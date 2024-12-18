module controller
#(
    parameter conv_N = 3
)
(
    input wire clk,
    input wire rstn,
    input wire start,
    //------------------------卷积控制信号----------------------------
    input wire [4:0]conv_result_0,
    input wire conv_result_0_valid,
    input wire [4:0]conv_result_1,
    input wire conv_result_1_valid,
    input wire pic_din,
    input wire[1:0] conv_done,
    output wire conv_din_0,
    output wire conv_0_start,
    output reg weight_en_0,
    output wire conv_din_1,
    output wire conv_1_start,
    output reg weight_en_1,
    output wire stage,
    output reg signed [4:0] conv2_result_sum0,
    output wire maxpool_valid,
    //------------------------全连接控制信号----------------------------
    //output wire fc_din,
    //output reg fc_invalid,
    input wire signed [9:0] fc_result_0,
    input wire signed [9:0] fc_result_1,
    input wire signed [9:0] fc_result_2,
    input wire signed [9:0] fc_result_3,
    input wire signed [9:0] fc_result_4,
    input wire signed [9:0] fc_result_5,
    input wire signed [9:0] fc_result_6,
    input wire signed [9:0] fc_result_7,
    input wire signed [9:0] fc_result_8,
    input wire signed [9:0] fc_result_9,
    input wire fc_result_valid,
    //------------------------输出控制信号----------------------------
    output reg[9:0] classes,
    output wire done
);

parameter IDLE = 3'b000;
parameter CONV1 = 3'b001;
parameter CONV2 = 3'b010;
parameter CLASSES = 3'b011;
reg [2:0] state, next_state;

reg [675:0] fmap_conv1_0, fmap_conv1_1;
reg [9:0] cnt_fmap_0, cnt_fmap_1;
reg [4:0] cnt_conv_weight;
//reg signed [4:0] conv2_result_sum0;
wire conv2_result_valid;
wire fc_done;

reg signed [9:0] compare_buf;
reg [3:0] cnt_compare;

wire pic_q_din;
//------------------------操作fmap读写----------------------------
always @(posedge clk or negedge rstn) begin
    if(rstn == 1'b0)begin
        cnt_fmap_0 <= 10'b0;
        cnt_fmap_1 <= 10'b0;
    end
    else begin
        case(stage)
        1'b0:begin//!写入 fmap
            if(conv_result_0_valid == 1'b1)
                cnt_fmap_0 <= cnt_fmap_0 + 1'b1;
            else if(cnt_fmap_0 == 10'd675)
                cnt_fmap_0 <= 'b0;
            else
                cnt_fmap_0 <= cnt_fmap_0;
            
            if(conv_result_1_valid == 1'b1)
                cnt_fmap_1 <= cnt_fmap_1 + 1'b1;
            else if(cnt_fmap_1 == 10'd675)
                cnt_fmap_1 <= 'b0;
            else
                cnt_fmap_1 <= cnt_fmap_1;
        end
        1'b1:begin//！从 fmap 读出
            if(conv_0_start)
                cnt_fmap_0 <= cnt_fmap_0 + 1'b1;
            else if(cnt_fmap_0 == 10'd675)
                cnt_fmap_0 <= 'b0;
            else
                cnt_fmap_0 <= cnt_fmap_0;

            if(conv_1_start)
                cnt_fmap_1 <= cnt_fmap_1 + 1'b1;
            else if(cnt_fmap_1 == 10'd675)
                cnt_fmap_1 <= 'b0;
            else
                cnt_fmap_1 <= cnt_fmap_1;
        end

        endcase
    end
end
//------------------------控制卷积结果读入fmap----------------------------
always @(posedge clk or negedge rstn) begin
    if(rstn == 1'b0) begin
        fmap_conv1_0 <= 'b0;
        fmap_conv1_1 <= 'b0;
    end
    else begin
        case(stage)
        1'b0:begin
            if(conv_result_0_valid == 1'b1)
                fmap_conv1_0[cnt_fmap_0] <= ~conv_result_0[4];
            else
                fmap_conv1_0 <= fmap_conv1_0;
            
            if(conv_result_1_valid == 1'b1)
                fmap_conv1_1[cnt_fmap_1] <= ~conv_result_1[4];
            else
                fmap_conv1_1 <= fmap_conv1_1;
        end

        1'b1:begin
            fmap_conv1_0 <= fmap_conv1_0;
            fmap_conv1_1 <= fmap_conv1_1;
        end
        endcase
    end
end

always @(posedge clk or negedge rstn) begin
    if(rstn == 1'b0) begin
        state <= IDLE;
    end
    else begin
        state <= next_state;
    end
end

always @(*) begin
    case(state)
    IDLE:begin
        if(start == 1'b1)
            next_state = CONV1;
        else
            next_state = IDLE;
    end
    CONV1:begin
        if(conv_done == 2'b11)
            next_state = CONV2;
        else
            next_state = CONV1;
    end
    CONV2:begin
        if(fc_result_valid == 1'b1)
            next_state = CLASSES;
        else
            next_state = CONV2;
    end
    CLASSES:begin
        if(done == 1'b1)
            next_state = IDLE;
        else
            next_state = CLASSES;
    end
    default:next_state = IDLE;
    endcase
end
//------------------------控制fc的输入----------------------------
always @(posedge clk or negedge rstn) begin
    if(rstn == 1'b0)begin
        conv2_result_sum0 <= 5'd0;
        maxpool_valid <= 1'b0;
    end
    else begin
        conv2_result_sum0 <= conv_result_0 + conv_result_1;
        if(conv_result_0_valid == 1'b1 && conv_result_1_valid == 1'b1 && state == CONV2)
            maxpool_valid <= 1'b1;
        else
            maxpool_valid <= 1'b0;
    end
end
//------------------------控制卷积的输入----------------------------
assign pic_q_din= pic_din;
assign conv_din_0 = (state == CONV1)?pic_q_din:fmap_conv1_0[cnt_fmap_0];
assign conv_din_1 = (state == CONV1)?pic_q_din:fmap_conv1_1[cnt_fmap_1];
assign conv_0_start = ((state == CONV1&&start == 1'b1&&conv_done==2'b00)||(state==CONV2&&conv_done==2'b00))?1'b1:1'b0;
assign conv_1_start = ((state == CONV1&&start == 1'b1&&conv_done==2'b00)||(state==CONV2&&conv_done==2'b00))?1'b1:1'b0;
assign stage = (state == CONV1)?1'b0:1'b1;
always @(posedge clk or negedge rstn) begin
    if(rstn == 1'b0)begin
        weight_en_0 <= 1'b0;
        weight_en_1 <= 1'b0;
    end
    else begin
        if(conv_0_start)begin
            if(cnt_conv_weight < 5'd9)begin
                weight_en_0 <= 1'b1;
                weight_en_1 <= 1'b0;
            end
            else if(cnt_conv_weight < 5'd18)begin
                weight_en_0 <= 1'b0;
                weight_en_1 <= 1'b1;
            end
            else begin
                weight_en_0 <= 1'b0;
                weight_en_1 <= 1'b0;
            end
        end
        else begin
            weight_en_0 <= 1'b0;
            weight_en_1 <= 1'b0;
        end
    end
end
always @(posedge clk or negedge rstn) begin
    if(rstn == 1'b0)begin
        cnt_conv_weight <= 5'd0;
    end
    else begin
        if(conv_0_start == 1'b1) begin
            if(cnt_conv_weight <5'd18)
                cnt_conv_weight <= cnt_conv_weight + 1;
            else
                cnt_conv_weight <= cnt_conv_weight;
            end
        else
            cnt_conv_weight <= 5'd0;
    end
end
//------------------------排序----------------------------
always @(posedge clk or negedge rstn) begin
    if(rstn == 1'b0)begin
        compare_buf <= -10'sd512;
        cnt_compare <= 4'd0;
        classes <= 10'd0;
    end
    else begin
        if(state ==CLASSES)begin
            cnt_compare <= cnt_compare + 1;
            case(cnt_compare)
            4'd0:begin
                if(fc_result_0 > compare_buf) begin
                    compare_buf <= fc_result_0;
                    classes <= 10'b0000000001;
                end
                else begin
                    compare_buf <= compare_buf;
                    classes <= classes;
                end
            end
            4'd1:begin
                if(fc_result_1 > compare_buf)begin
                    compare_buf <= fc_result_1;
                    classes <= 10'b0000000010;
                end
                else begin
                    compare_buf <= compare_buf;
                    classes <= classes;
                end
            end
            4'd2:begin
                if(fc_result_2 > compare_buf)begin
                    compare_buf <= fc_result_2;
                    classes <= 10'b0000000100;
                end
                else begin
                    compare_buf <= compare_buf;
                    classes <= classes;
                end
            end
            4'd3:begin
                if(fc_result_3 > compare_buf)begin
                    compare_buf <= fc_result_3;
                    classes <= 10'b0000001000;
                end
                else begin
                    compare_buf <= compare_buf;
                    classes <= classes;
                end
            end
            4'd4:begin
                if(fc_result_4 > compare_buf)begin
                    compare_buf <= fc_result_4;
                    classes <= 10'b0000010000;
                end
                else begin
                    compare_buf <= compare_buf;
                    classes <= classes;
                end
            end
            4'd5:begin
                if(fc_result_5 > compare_buf)begin
                    compare_buf <= fc_result_5;
                    classes <= 10'b0000100000;
                end
                else begin
                    compare_buf <= compare_buf;
                    classes <= classes;
                end
            end
            4'd6:begin
                if(fc_result_6 > compare_buf)begin
                    compare_buf <= fc_result_6;
                    classes <= 10'b0001000000;
                end
                else begin
                    compare_buf <= compare_buf;
                    classes <= classes;
                end
            end
            4'd7:begin
                if(fc_result_7 > compare_buf)begin
                    compare_buf <= fc_result_7;
                    classes <= 10'b0010000000;
                end
                else begin
                    compare_buf <= compare_buf;
                    classes <= classes;
                end
            end
            4'd8:begin
                if(fc_result_8 > compare_buf)begin
                    compare_buf <= fc_result_8;
                    classes <= 10'b0100000000;
                end
                else begin
                    compare_buf <= compare_buf;
                    classes <= classes;
                end
            end
            4'd9:begin
                if(fc_result_9 > compare_buf)begin
                    compare_buf <= fc_result_9;
                    classes <= 10'b1000000000;
                end
                else begin
                    compare_buf <= compare_buf;
                    classes <= classes;
                end
            end
            default:begin
                compare_buf <= compare_buf;
                classes <= classes;
            end
            endcase
        end
    end
end
assign done = (cnt_compare == 4'd9)?1'b1:1'b0;
endmodule