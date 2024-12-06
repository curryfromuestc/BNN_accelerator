module controller
#(
    parameter conv_N = 3
)
(
    input wire clk,
    input wire rstn,
    input wire start,
    //------------------------卷积控制信号----------------------------
    input wire conv_result_0,
    input wire conv_result_0_valid,
    input wire conv_result_1,
    input wire conv_result_1_valid,
    input wire conv_result_2,
    input wire conv_result_2_valid,
    input wire[7:0] pic_din,
    input wire[2:0] conv_done,
    output wire conv_din_0,
    output wire conv_0_start,
    output reg weight_en_0,
    output wire conv_din_1,
    output wire conv_1_start,
    output reg weight_en_1,
    output wire conv_din_2,
    output wire conv_2_start,
    output reg weight_en_2,
    output wire conv_weight,
    output wire stage,
    //------------------------全连接控制信号----------------------------
    output wire fc_din,
    output reg fc_invalid,
    output wire fc_weight_en,
    output wire fc_weight,
    input wire fc_result,
    input wire fc_result_valid,
    //------------------------输出控制信号----------------------------
    output wire[9:0] classes,
    output wire[9:0] ovalid
);

parameter IDLE = 3'b000;
parameter CONV1 = 3'b001;
parameter CONV2 = 3'b010;
parameter CLASSES = 3'b011;
reg [2:0] state, next_state;

reg [675:0] fmap_conv1_0, fmap_conv1_1, fmap_conv1_2;
reg [9:0] cnt_fmap_0, cnt_fmap_1, cnt_fmap_2;
reg signed [4:0] conv2_result_sum0;
wire conv2_result_valid;
wire fc_done;

wire pic_q_din;
//------------------------操作fmap读写----------------------------
always @(posedge clk or negedge rstn) begin
    if(rstn == 1'b0)begin
        cnt_fmap_0 <= 10'b0;
        cnt_fmap_1 <= 10'b0;
        cnt_fmap_2 <= 10'b0;
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

            if(conv_result_2_valid == 1'b1)
                cnt_fmap_2 <= cnt_fmap_2 + 1'b1;
            else if(cnt_fmap_2 == 10'd675)
                cnt_fmap_2 <= 'b0;
            else 
                cnt_fmap_2 <= cnt_fmap_2;
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

            if(conv_2_start)
                cnt_fmap_2 <= cnt_fmap_2 + 1'b1;
            else if(cnt_fmap_2 == 10'd675)
                cnt_fmap_2 <= 'b0;
            else 
                cnt_fmap_2 <= cnt_fmap_2;
        end

        endcase
    end
end
//------------------------控制卷积结果读入fmap----------------------------
always @(posedge clk or negedge rstn) begin
    if(rstn == 1'b0) begin
        fmap_conv1_0 <= 'b0;
        fmap_conv1_1 <= 'b0;
        fmap_conv1_2 <= 'b0;
    end
    else begin
        case(stage)
        1'b0:begin
            if(conv_result_0_valid == 1'b1)
                fmap_conv1_0[cnt_fmap_0] <= conv_result_0;
            else
                fmap_conv1_0 <= fmap_conv1_0;
            
            if(conv_result_1_valid == 1'b1)
                fmap_conv1_1[cnt_fmap_1] <= conv_result_1;
            else
                fmap_conv1_1 <= fmap_conv1_1;

            if(conv_result_2_valid == 1'b1)
                fmap_conv1_2[cnt_fmap_2] <= conv_result_2;
            else
                fmap_conv1_2 <= fmap_conv1_2;
        end

        1'b1:begin
            fmap_conv1_0 <= fmap_conv1_0;
            fmap_conv1_1 <= fmap_conv1_1;
            fmap_conv1_2 <= fmap_conv1_2;
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
        if(conv_done == 3'b111)
            next_state = CONV2;
        else
            next_state = CONV1;
    end
    CONV2:begin
        if(fc_done == 1'b1)
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
    endcase
end
//------------------------控制fc的输入----------------------------
always @(posedge clk or negedge rstn) begin
    if(rstn == 1'b0)begin
        conv2_result_sum0 <= 6'd0;
    end
    else begin
        conv2_result_sum0 <= conv_result_0 + conv_result_1;
    end
end
assign fc_din = ((conv2_result_sum0 + conv_result_2) > 6'd0)?1'b1:1'b0;
always @(posedge clk or negedge rstn) begin
    if(rstn == 1'b0)begin
        fc_invalid <= 1'b0;
    end
    else begin
        if((stage == CONV2)&&(conv_result_0_valid == 1'b1))
            fc_invalid <= 1'b1;
        else
            fc_invalid <= 1'b0;
    end
end
//------------------------控制fc的权重----------------------------



//------------------------控制卷积的输入----------------------------
assign pic_q_din=(pic_din>8'd127)?1'b1:1'b0;
assign conv_din_0 = (state == CONV1)?pic_q_din:fmap_conv1_0[cnt_fmap_0];
assign conv_din_1 = (state == CONV1)?pic_q_din:fmap_conv1_1[cnt_fmap_1];
assign conv_din_2 = (state == CONV1)?pic_q_din:fmap_conv1_2[cnt_fmap_2];
assign conv_0_start = ((state == CONV1&&start == 1'b1&&conv_done==3'b000)||(state==CONV2&&conv_done==3'b000))?1'b1:1'b0;
assign conv_1_start = ((state == CONV1&&start == 1'b1&&conv_done==3'b001)||(state==CONV2&&conv_done==3'b001))?1'b1:1'b0;
assign conv_2_start = ((state == CONV1&&start == 1'b1&&conv_done==3'b010)||(state==CONV2&&conv_done==3'b010))?1'b1:1'b0;
assign stage = (state == CONV1)?1'b0:1'b1;
always @(posedge clk or negedge rstn) begin
    if(rstn == 1'b0)begin
        weight_en_0 <= 1'b0;
        weight_en_1 <= 1'b0;
        weight_en_2 <= 1'b0;
    end
    else begin
        case(stage)
        1'b0:begin
            
        end
        1'b1:begin
            
        end
        endcase
    end
end
endmodule