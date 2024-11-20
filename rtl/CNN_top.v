module CNN_top(
    input wire clk,
    input wire rstn,
    input wire start,
    input wire signed[31:0] din,
    output reg [9:0] classes,
    output wire done,
    output wire conv1_done, 
    output wire din_ready
);

reg signed [31:0] fmap_0 [143:0];
reg signed [31:0] fmap_1 [143:0];
reg signed [31:0] fmap_2 [143:0];
reg signed [31:0] fmap_3 [143:0];
reg signed [31:0] fmap_4 [143:0];
reg signed [31:0] fmap_5 [143:0];

reg signed [31:0] fmap_fc_0 [15:0];
reg signed [31:0] fmap_fc_1 [15:0];
reg signed [31:0] fmap_fc_2 [15:0];
reg signed [31:0] fmap_fc_3 [15:0];
reg signed [31:0] fmap_fc_4 [15:0];
reg signed [31:0] fmap_fc_5 [15:0];
reg signed [31:0] fmap_fc_6 [15:0];
reg signed [31:0] fmap_fc_7 [15:0];
reg signed [31:0] fmap_fc_8 [15:0];
reg signed [31:0] fmap_fc_9 [15:0];
reg signed [31:0] fmap_fc_10 [15:0];
reg signed [31:0] fmap_fc_11 [15:0];

wire signed [31:0] fc_out [9:0];
reg signed [31:0] fc_out_reg [9:0];
reg [3:0] max_addr00,max_addr01,max_addr02,max_addr03,max_addr04;
reg [3:0] max_addr10,max_addr11,max_addr12;
reg [3:0] max_addr20,max_addr21;
reg [3:0] max_addr30;
reg signed [31:0] fc_out_max_00,fc_out_max_01,fc_out_max_02,fc_out_max_03,fc_out_max_04;
reg signed [31:0] fc_out_max_10,fc_out_max_11,fc_out_max_12;
reg signed [31:0] fc_out_max_20,fc_out_max_21;
reg signed [31:0] fc_out_max_30;

wire signed [31:0] image_in_0;
wire signed [31:0] image_in_1;
wire signed [31:0] image_in_2;
wire signed [31:0] image_in_3;
wire signed [31:0] image_in_4;
wire signed [31:0] image_in_5;

wire signed [31:0] fc_in_0;
wire signed [31:0] fc_in_1;
wire signed [31:0] fc_in_2;
wire signed [31:0] fc_in_3;
wire signed [31:0] fc_in_4;
wire signed [31:0] fc_in_5;
wire signed [31:0] fc_in_6;
wire signed [31:0] fc_in_7;
wire signed [31:0] fc_in_8;
wire signed [31:0] fc_in_9;
wire signed [31:0] fc_in_10;
wire signed [31:0] fc_in_11;

wire signed [31:0] conv_result_0;
wire signed [31:0] conv_result_1;
wire signed [31:0] conv_result_2;
wire signed [31:0] conv_result_3;
wire signed [31:0] conv_result_4;
wire signed [31:0] conv_result_5;

wire din_ready_0;
wire din_ready_1;
wire din_ready_2;
wire din_ready_3;
wire din_ready_4;
wire din_ready_5;

wire stage;
wire [5:0] weight_en;
reg [5:0] weight_en_reg,weight_en_ff,weight_en_ff_1;
wire [9:0] weight_en_fc;
reg [9:0] weight_en_fc_reg;
reg [7:0]weight_conv1_addr;
reg [10:0]weight_conv2_addr,weight_conv2_addr_ff0,weight_conv2_addr_ff1;
reg [10:0]weight_fc_addr;
wire weight_c;
reg weight_c_ff_reg;
wire weight_c_ff;
wire weight_conv1,weight_conv2;
wire weight_fc;
reg weight_fc_ff_reg;
wire weight_fc_ff;
wire [5:0] ovalid;
reg [5:0] ovalid_reg;
wire [5:0] conv_done;
reg [5:0] conv_done_ff_0,conv_done_ff_1;
wire [9:0] fc_ivalid;
reg [9:0] fc_ivalid_reg;
wire [9:0] fc_ovalid;
wire start_conv;
reg start_conv2;
reg [7:0] fc_out_cnt_0,fc_out_cnt_1,fc_out_cnt_2,fc_out_cnt_3,fc_out_cnt_4,fc_out_cnt_5,fc_out_cnt_6,fc_out_cnt_7,fc_out_cnt_8,fc_out_cnt_9;

parameter IDLE = 3'b000;
parameter CONV_1 = 3'b001;
parameter CONV_2 = 3'b010;
parameter FC = 3'b011;
parameter CLASSES = 3'b100;

reg compare_done;

reg [2:0] state, next_state;
reg [7:0] conv_cnt,conv_cnt_ff0,conv_cnt_ff1,conv_cnt_ff2,conv_cnt_ff3;
reg [7:0] fmap_cnt;//!控制卷积输出的值保存到fmap中
reg [7:0] fmap_r_conv2_cnt,fmap_r_fc_cnt;
wire fmap_en;
reg [2:0]cnt_classes;

assign conv1_done = (state == CONV_1&&conv_done == 6'b111111) ? 1'b1 : 1'b0;
assign weight_c = (stage == 1'b1) ? weight_conv2 : weight_conv1;
assign fmap_en = (state == CONV_2) ? din_ready_0 : 1'b0;
assign din_ready = (state == CONV_1) ? din_ready_0 : 1'b0;
assign start_conv = (stage == 1'b1) ? start_conv2 : start;
assign stage = (state == CONV_2) ? 1'b1 : 1'b0;
assign fc_ivalid = fc_ivalid_reg;
// assign fc_ivalid = (conv_cnt_ff3 == 8'd13) ? 10'b1111111111 : 10'b0000000000;
//!控制输入image_in

assign image_in_0 = (state == CONV_1) ? din : fmap_0[fmap_r_conv2_cnt];
assign image_in_1 = (state == CONV_1) ? din : fmap_1[fmap_r_conv2_cnt];
assign image_in_2 = (state == CONV_1) ? din : fmap_2[fmap_r_conv2_cnt];
assign image_in_3 = (state == CONV_1) ? din : fmap_3[fmap_r_conv2_cnt];
assign image_in_4 = (state == CONV_1) ? din : fmap_4[fmap_r_conv2_cnt];
assign image_in_5 = (state == CONV_1) ? din : fmap_5[fmap_r_conv2_cnt];

assign fc_in_0 = (state == FC)? fmap_fc_0[fmap_r_fc_cnt] : 32'b0;
assign fc_in_1 = (state == FC)? fmap_fc_1[fmap_r_fc_cnt] : 32'b0;
assign fc_in_2 = (state == FC)? fmap_fc_2[fmap_r_fc_cnt] : 32'b0;
assign fc_in_3 = (state == FC)? fmap_fc_3[fmap_r_fc_cnt] : 32'b0;
assign fc_in_4 = (state == FC)? fmap_fc_4[fmap_r_fc_cnt] : 32'b0;
assign fc_in_5 = (state == FC)? fmap_fc_5[fmap_r_fc_cnt] : 32'b0;
assign fc_in_6 = (state == FC)? fmap_fc_6[fmap_r_fc_cnt] : 32'b0;
assign fc_in_7 = (state == FC)? fmap_fc_7[fmap_r_fc_cnt] : 32'b0;
assign fc_in_8 = (state == FC)? fmap_fc_8[fmap_r_fc_cnt] : 32'b0;
assign fc_in_9 = (state == FC)? fmap_fc_9[fmap_r_fc_cnt] : 32'b0;
assign fc_in_10 = (state == FC)? fmap_fc_10[fmap_r_fc_cnt] : 32'b0;
assign fc_in_11 = (state == FC)? fmap_fc_11[fmap_r_fc_cnt] : 32'b0;

assign done = compare_done;

assign weight_en = weight_en_ff_1;
assign weight_en_fc = weight_en_fc_reg;

always @( *) begin
    case(state)
    IDLE:begin
        weight_en_reg = 6'b000000;
        weight_en_fc_reg = 10'b0000000000;
        fc_ivalid_reg = 10'b0000000000;
    end
    CONV_1:begin
        if(ovalid_reg == 6'b111111)begin
            fmap_0[fmap_cnt-1] = conv_result_0;
            fmap_1[fmap_cnt-1] = conv_result_1;
            fmap_2[fmap_cnt-1] = conv_result_2;
            fmap_3[fmap_cnt-1] = conv_result_3;
            fmap_4[fmap_cnt-1] = conv_result_4;
            fmap_5[fmap_cnt-1] = conv_result_5;
        end
        else begin
            fmap_0[fmap_cnt] = fmap_0[fmap_cnt];
            fmap_1[fmap_cnt] = fmap_1[fmap_cnt];
            fmap_2[fmap_cnt] = fmap_2[fmap_cnt];
            fmap_3[fmap_cnt] = fmap_3[fmap_cnt];
            fmap_4[fmap_cnt] = fmap_4[fmap_cnt];
            fmap_5[fmap_cnt] = fmap_5[fmap_cnt];
        end
        if(start_conv)begin
            if(weight_conv1_addr<25)
                weight_en_reg = 6'b000001;
            else if(weight_conv1_addr<50)
                weight_en_reg = 6'b000010;
            else if(weight_conv1_addr<75)
                weight_en_reg = 6'b000100;
            else if(weight_conv1_addr<100)
                weight_en_reg = 6'b001000;
            else if(weight_conv1_addr<125)
                weight_en_reg = 6'b010000;
            else if(weight_conv1_addr<150)
                weight_en_reg = 6'b100000;
            else
                weight_en_reg = 6'b000000;
        end
        else
            weight_en_reg = 6'b000000;
    end
    CONV_2:begin
    if(start_conv)begin
        case(conv_cnt)
        8'd1:begin
            if(weight_conv2_addr < 25)
                weight_en_reg = 6'b000001;
            else if(weight_conv2_addr < 50)
                weight_en_reg = 6'b000010;
            else if(weight_conv2_addr < 75)
                weight_en_reg = 6'b000100;
            else if(weight_conv2_addr < 100)
                weight_en_reg = 6'b001000;
            else if(weight_conv2_addr < 125)
                weight_en_reg = 6'b010000;
            else if(weight_conv2_addr < 150)
                weight_en_reg = 6'b100000;
            else
                weight_en_reg = 6'b000000; 
        end
        8'd2:begin
            if(weight_conv2_addr < 175)
                weight_en_reg = 6'b000001;
            else if(weight_conv2_addr < 200)
                weight_en_reg = 6'b000010;
            else if(weight_conv2_addr < 225)
                weight_en_reg = 6'b000100;
            else if(weight_conv2_addr < 250)
                weight_en_reg = 6'b001000;
            else if(weight_conv2_addr < 275)
                weight_en_reg = 6'b010000;
            else if(weight_conv2_addr < 300)
                weight_en_reg = 6'b100000;
            else
                weight_en_reg = 6'b000000; 
        end
        8'd3:begin
            if(weight_conv2_addr < 325)
                weight_en_reg = 6'b000001;
            else if(weight_conv2_addr < 350)
                weight_en_reg = 6'b000010;
            else if(weight_conv2_addr < 375)
                weight_en_reg = 6'b000100;
            else if(weight_conv2_addr < 400)
                weight_en_reg = 6'b001000;
            else if(weight_conv2_addr < 425)
                weight_en_reg = 6'b010000;
            else if(weight_conv2_addr < 450)
                weight_en_reg = 6'b100000;
            else
                weight_en_reg = 6'b000000; 
        end
        8'd4:begin
            if(weight_conv2_addr < 475)
                weight_en_reg = 6'b000001;
            else if(weight_conv2_addr < 500)
                weight_en_reg = 6'b000010;
            else if(weight_conv2_addr < 525)
                weight_en_reg = 6'b000100;
            else if(weight_conv2_addr < 550)
                weight_en_reg = 6'b001000;
            else if(weight_conv2_addr < 575)
                weight_en_reg = 6'b010000;
            else if(weight_conv2_addr < 600)
                weight_en_reg = 6'b100000;
            else
                weight_en_reg = 6'b000000; 
        end
        8'd5:begin
            if(weight_conv2_addr < 625)
                weight_en_reg = 6'b000001;
            else if(weight_conv2_addr < 650)
                weight_en_reg = 6'b000010;
            else if(weight_conv2_addr < 675)
                weight_en_reg = 6'b000100;
            else if(weight_conv2_addr < 700)
                weight_en_reg = 6'b001000;
            else if(weight_conv2_addr < 725)
                weight_en_reg = 6'b010000;
            else if(weight_conv2_addr < 750)
                weight_en_reg = 6'b100000;
            else
                weight_en_reg = 6'b000000; 
        end
        8'd6:begin
            if(weight_conv2_addr < 775)
                weight_en_reg = 6'b000001;
            else if(weight_conv2_addr < 800)
                weight_en_reg = 6'b000010;
            else if(weight_conv2_addr < 825)
                weight_en_reg = 6'b000100;
            else if(weight_conv2_addr < 850)
                weight_en_reg = 6'b001000;
            else if(weight_conv2_addr < 875)
                weight_en_reg = 6'b010000;
            else if(weight_conv2_addr < 900)
                weight_en_reg = 6'b100000;
            else
                weight_en_reg = 6'b000000; 
        end
        8'd7:begin
            if(weight_conv2_addr < 925)
                weight_en_reg = 6'b000001;
            else if(weight_conv2_addr < 950)
                weight_en_reg = 6'b000010;
            else if(weight_conv2_addr < 975)
                weight_en_reg = 6'b000100;
            else if(weight_conv2_addr < 1000)
                weight_en_reg = 6'b001000;
            else if(weight_conv2_addr < 1025)
                weight_en_reg = 6'b010000;
            else if(weight_conv2_addr < 1050)
                weight_en_reg = 6'b100000;
            else
                weight_en_reg = 6'b000000; 
        end
        8'd8:begin
            if(weight_conv2_addr < 1075)
                weight_en_reg = 6'b000001;
            else if(weight_conv2_addr < 1100)
                weight_en_reg = 6'b000010;
            else if(weight_conv2_addr < 1125)
                weight_en_reg = 6'b000100;
            else if(weight_conv2_addr < 1150)
                weight_en_reg = 6'b001000;
            else if(weight_conv2_addr < 1175)
                weight_en_reg = 6'b010000;
            else if(weight_conv2_addr < 1200)
                weight_en_reg = 6'b100000;
            else
                weight_en_reg = 6'b000000; 
        end
        8'd9:begin
            if(weight_conv2_addr < 1225)
                weight_en_reg = 6'b000001;
            else if(weight_conv2_addr < 1250)
                weight_en_reg = 6'b000010;
            else if(weight_conv2_addr < 1275)
                weight_en_reg = 6'b000100;
            else if(weight_conv2_addr < 1300)
                weight_en_reg = 6'b001000;
            else if(weight_conv2_addr < 1325)
                weight_en_reg = 6'b010000;
            else if(weight_conv2_addr < 1350)
                weight_en_reg = 6'b100000;
            else
                weight_en_reg = 6'b000000; 
        end
        8'd10:begin
            if(weight_conv2_addr < 1375)
                weight_en_reg = 6'b000001;
            else if(weight_conv2_addr < 1400)
                weight_en_reg = 6'b000010;
            else if(weight_conv2_addr < 1425)
                weight_en_reg = 6'b000100;
            else if(weight_conv2_addr < 1450)
                weight_en_reg = 6'b001000;
            else if(weight_conv2_addr < 1475)
                weight_en_reg = 6'b010000;
            else if(weight_conv2_addr < 1500)
                weight_en_reg = 6'b100000;
            else
                weight_en_reg = 6'b000000; 
        end
        8'd11:begin
            if(weight_conv2_addr < 1525)
                weight_en_reg = 6'b000001;
            else if(weight_conv2_addr < 1550)
                weight_en_reg = 6'b000010;
            else if(weight_conv2_addr < 1575)
                weight_en_reg = 6'b000100;
            else if(weight_conv2_addr < 1600)
                weight_en_reg = 6'b001000;
            else if(weight_conv2_addr < 1625)
                weight_en_reg = 6'b010000;
            else if(weight_conv2_addr < 1650)
                weight_en_reg = 6'b100000;
            else
                weight_en_reg = 6'b000000; 
        end
        8'd12:begin
            if(weight_conv2_addr < 1675)
                weight_en_reg = 6'b000001;
            else if(weight_conv2_addr < 1700)
                weight_en_reg = 6'b000010;
            else if(weight_conv2_addr < 1725)
                weight_en_reg = 6'b000100;
            else if(weight_conv2_addr < 1750)
                weight_en_reg = 6'b001000;
            else if(weight_conv2_addr < 1775)
                weight_en_reg = 6'b010000;
            else if(weight_conv2_addr < 1800)
                weight_en_reg = 6'b100000;
            else
                weight_en_reg = 6'b000000; 
        end
        default:begin
            weight_en_reg = 6'b000000;
        end
        endcase
    end
    end
    FC:begin
        if(weight_fc_addr < 192)begin
            weight_en_fc_reg = 10'b0000000001;
            fc_ivalid_reg = 10'b0000000000;
        end
        else if(weight_fc_addr < 384)begin
            weight_en_fc_reg = 10'b0000000010;
            fc_ivalid_reg = 10'b0000000001;
        end
        else if(weight_fc_addr < 576)begin
            weight_en_fc_reg = 10'b0000000100;
            fc_ivalid_reg = 10'b0000000010;
        end
        else if(weight_fc_addr < 768)begin
            weight_en_fc_reg = 10'b0000001000;
            fc_ivalid_reg = 10'b0000000100;
        end
        else if(weight_fc_addr < 960)begin
            weight_en_fc_reg = 10'b0000010000;
            fc_ivalid_reg = 10'b0000001000;
        end
        else if(weight_fc_addr < 1152)begin
            weight_en_fc_reg = 10'b0000100000;
            fc_ivalid_reg = 10'b0000010000;
        end
        else if(weight_fc_addr < 1344)begin
            weight_en_fc_reg = 10'b0001000000;
            fc_ivalid_reg = 10'b0000100000;
        end
        else if(weight_fc_addr < 1536)begin
            weight_en_fc_reg = 10'b0010000000;
            fc_ivalid_reg = 10'b0001000000;
        end
        else if(weight_fc_addr < 1728)begin
            weight_en_fc_reg = 10'b0100000000;
            fc_ivalid_reg = 10'b0010000000;
        end
        else if(weight_fc_addr < 1920)begin
            weight_en_fc_reg = 10'b1000000000;
            fc_ivalid_reg = 10'b0100000000;
        end
        else begin
            weight_en_fc_reg = 10'b0000000000;
            fc_ivalid_reg = 10'b1000000000;
        end

        if(fc_ovalid == 10'b0000000001)begin
            if(fc_out_cnt_0 == 8'd0)
                fc_out_reg[0] = fc_out[0];
            else
                fc_out_reg[0] = fc_out_reg[0];
        end
        else if(fc_ovalid == 10'b0000000010)begin
            if(fc_out_cnt_1 == 8'd0)
                fc_out_reg[1] = fc_out[1];
            else
                fc_out_reg[1] = fc_out_reg[1];
        end
        else if(fc_ovalid == 10'b0000000100)begin
            if(fc_out_cnt_2 == 8'd0)
                fc_out_reg[2] = fc_out[2];
            else
                fc_out_reg[2] = fc_out_reg[2];
        end
        else if(fc_ovalid == 10'b0000001000)begin
            if(fc_out_cnt_3 == 8'd0)
                fc_out_reg[3] = fc_out[3];
            else
                fc_out_reg[3] = fc_out_reg[3];
        end
        else if(fc_ovalid == 10'b0000010000)begin
            if(fc_out_cnt_4 == 8'd0)
                fc_out_reg[4] = fc_out[4];
            else
                fc_out_reg[4] = fc_out_reg[4];
        end
        else if(fc_ovalid == 10'b0000100000)begin
            if(fc_out_cnt_5 == 8'd0)
                fc_out_reg[5] = fc_out[5];
            else
                fc_out_reg[5] = fc_out_reg[5];
        end
        else if(fc_ovalid == 10'b0001000000)begin
            if(fc_out_cnt_6 == 8'd0)
                fc_out_reg[6] = fc_out[6];
            else
                fc_out_reg[6] = fc_out_reg[6];
        end
        else if(fc_ovalid == 10'b0010000000)begin
            if(fc_out_cnt_7 == 8'd0)
                fc_out_reg[7] = fc_out[7];
            else
                fc_out_reg[7] = fc_out_reg[7];
        end
        else if(fc_ovalid == 10'b0100000000)begin
            if(fc_out_cnt_8 == 8'd0)
                fc_out_reg[8] = fc_out[8];
            else
                fc_out_reg[8] = fc_out_reg[8];
        end
        else if(fc_ovalid == 10'b1000000000)begin
            if(fc_out_cnt_9 == 8'd0)
                fc_out_reg[9] = fc_out[9];
            else
                fc_out_reg[9] = fc_out_reg[9];
        end
        else begin
            fc_out_reg[0] = fc_out_reg[0];
            fc_out_reg[1] = fc_out_reg[1];
            fc_out_reg[2] = fc_out_reg[2];
            fc_out_reg[3] = fc_out_reg[3];
            fc_out_reg[4] = fc_out_reg[4];
            fc_out_reg[5] = fc_out_reg[5];
            fc_out_reg[6] = fc_out_reg[6];
            fc_out_reg[7] = fc_out_reg[7];
            fc_out_reg[8] = fc_out_reg[8];
            fc_out_reg[9] = fc_out_reg[9];
        end
    end
    CLASSES:begin
        weight_en_reg = 6'b000000;
        weight_en_fc_reg = 10'b0000000000;
    end
endcase
end

always @(posedge clk or negedge rstn) begin
    if(!rstn)begin
        weight_en_ff <= 6'b000000;
        weight_en_ff_1 <= 6'b000000;
    end
    else begin
        ovalid_reg <= ovalid;
        conv_done_ff_0 <= conv_done;
        conv_done_ff_1 <= conv_done_ff_0;
        weight_en_ff <= weight_en_reg;
        weight_en_ff_1 <= weight_en_ff;
    end
end

always @(posedge clk) begin
    case(state)
    IDLE:begin
        fmap_cnt <= 8'd0;
        fmap_r_conv2_cnt <= 8'd0;
        fmap_r_fc_cnt <= 4'd0;
        cnt_classes <= 3'd0;
        weight_conv1_addr <= 8'd0;
        weight_conv2_addr <= 11'd0;
        weight_fc_addr <= 11'd0;
        fc_out_cnt_0 <= 8'd0;
        fc_out_cnt_1 <= 8'd0;
        fc_out_cnt_2 <= 8'd0;
        fc_out_cnt_3 <= 8'd0;
        fc_out_cnt_4 <= 8'd0;
        fc_out_cnt_5 <= 8'd0;
        fc_out_cnt_6 <= 8'd0;
        fc_out_cnt_7 <= 8'd0;
        fc_out_cnt_8 <= 8'd0;
        fc_out_cnt_9 <= 8'd0;
    end
    CONV_1:begin
        if(start)begin
            if(weight_conv1_addr < 150)
                weight_conv1_addr <= weight_conv1_addr + 1;
            else
                weight_conv1_addr <= weight_conv1_addr;
        end
        else
            weight_conv1_addr <= weight_conv1_addr;
        if(ovalid == 6'b111111) begin
            fmap_cnt <= fmap_cnt + 1;
        end
        else if(fmap_cnt == 8'd144) begin
            fmap_cnt <= 8'd0;
        end
        else begin
            fmap_cnt <= fmap_cnt;
        end
    end
    CONV_2:begin
        weight_conv2_addr_ff0 <= weight_conv2_addr;
        weight_conv2_addr_ff1 <= weight_conv2_addr_ff0;
        // if(weight_en_reg[0])begin
        //     weight_conv2_addr <= weight_conv2_addr + 1;
        // end
        // else if(weight_en_reg[1])begin
        //     weight_conv2_addr <= weight_conv2_addr + 1;
        // end
        // else if(weight_en_reg[2])begin
        //     weight_conv2_addr <= weight_conv2_addr + 1;
        // end
        // else if(weight_en_reg[3])begin
        //     weight_conv2_addr <= weight_conv2_addr + 1;
        // end
        // else if(weight_en_reg[4])begin
        //     weight_conv2_addr <= weight_conv2_addr + 1;
        // end
        // else if(weight_en_reg[5])begin
        //     weight_conv2_addr <= weight_conv2_addr + 1;
        // end
        // else
        //     weight_conv2_addr <= weight_conv2_addr;
        if(start_conv2)begin
            case(conv_cnt)
            8'd1:begin
                if(weight_conv2_addr < 150)
                    weight_conv2_addr <= weight_conv2_addr + 1;
                else
                    weight_conv2_addr <= weight_conv2_addr;
            end
            8'd2:begin
                if(weight_conv2_addr < 300)
                    weight_conv2_addr <= weight_conv2_addr + 1;
                else
                    weight_conv2_addr <= weight_conv2_addr;
            end
            8'd3:begin
                if(weight_conv2_addr < 450)
                    weight_conv2_addr <= weight_conv2_addr + 1;
                else
                    weight_conv2_addr <= weight_conv2_addr;
            end
            8'd4:begin
                if(weight_conv2_addr < 600)
                    weight_conv2_addr <= weight_conv2_addr + 1;
                else
                    weight_conv2_addr <= weight_conv2_addr;
            end
            8'd5:begin
                if(weight_conv2_addr < 750)
                    weight_conv2_addr <= weight_conv2_addr + 1;
                else
                    weight_conv2_addr <= weight_conv2_addr;
            end
            8'd6:begin
                if(weight_conv2_addr < 900)
                    weight_conv2_addr <= weight_conv2_addr + 1;
                else
                    weight_conv2_addr <= weight_conv2_addr;
            end
            8'd7:begin
                if(weight_conv2_addr < 1050)
                    weight_conv2_addr <= weight_conv2_addr + 1;
                else
                    weight_conv2_addr <= weight_conv2_addr;
            end
            8'd8:begin
                if(weight_conv2_addr < 1200)
                    weight_conv2_addr <= weight_conv2_addr + 1;
                else
                    weight_conv2_addr <= weight_conv2_addr;
            end
            8'd9:begin
                if(weight_conv2_addr < 1350)
                    weight_conv2_addr <= weight_conv2_addr + 1;
                else
                    weight_conv2_addr <= weight_conv2_addr;
            end
            8'd10:begin
                if(weight_conv2_addr < 1500)
                    weight_conv2_addr <= weight_conv2_addr + 1;
                else
                    weight_conv2_addr <= weight_conv2_addr;
            end
            8'd11:begin
                if(weight_conv2_addr < 1650)
                    weight_conv2_addr <= weight_conv2_addr + 1;
                else
                    weight_conv2_addr <= weight_conv2_addr;
            end
            8'd12:begin
                if(weight_conv2_addr < 1800)
                    weight_conv2_addr <= weight_conv2_addr + 1;
                else
                    weight_conv2_addr <= weight_conv2_addr;
            end
            default:begin
                weight_conv2_addr <= weight_conv2_addr;
            end
            endcase
        end
        else
            weight_conv2_addr <= weight_conv2_addr;
        case(conv_cnt)
        8'd1: fmap_fc_0[fmap_cnt] <= conv_result_0;
        8'd2: fmap_fc_1[fmap_cnt] <= conv_result_0;
        8'd3: fmap_fc_2[fmap_cnt] <= conv_result_0;
        8'd4: fmap_fc_3[fmap_cnt] <= conv_result_0;
        8'd5: fmap_fc_4[fmap_cnt] <= conv_result_0;
        8'd6: fmap_fc_5[fmap_cnt] <= conv_result_0;
        8'd7: fmap_fc_6[fmap_cnt] <= conv_result_0;
        8'd8: fmap_fc_7[fmap_cnt] <= conv_result_0;
        8'd9: fmap_fc_8[fmap_cnt] <= conv_result_0;
        8'd10: fmap_fc_9[fmap_cnt] <= conv_result_0;
        8'd11: fmap_fc_10[fmap_cnt] <= conv_result_0;
        8'd12: fmap_fc_11[fmap_cnt] <= conv_result_0;
        default : begin
            fmap_fc_0[fmap_cnt] <= fmap_fc_0[fmap_cnt];
            fmap_fc_1[fmap_cnt] <= fmap_fc_1[fmap_cnt];
            fmap_fc_2[fmap_cnt] <= fmap_fc_2[fmap_cnt];
            fmap_fc_3[fmap_cnt] <= fmap_fc_3[fmap_cnt];
            fmap_fc_4[fmap_cnt] <= fmap_fc_4[fmap_cnt];
            fmap_fc_5[fmap_cnt] <= fmap_fc_5[fmap_cnt];
            fmap_fc_6[fmap_cnt] <= fmap_fc_6[fmap_cnt];
            fmap_fc_7[fmap_cnt] <= fmap_fc_7[fmap_cnt];
            fmap_fc_8[fmap_cnt] <= fmap_fc_8[fmap_cnt];
            fmap_fc_9[fmap_cnt] <= fmap_fc_9[fmap_cnt];
            fmap_fc_10[fmap_cnt] <= fmap_fc_10[fmap_cnt];
            fmap_fc_11[fmap_cnt] <= fmap_fc_11[fmap_cnt];
        end
        endcase
        if(ovalid == 6'b111111)
            fmap_cnt <= fmap_cnt + 1;
        else if(fmap_cnt == 8'd16)
            fmap_cnt <= 8'd0;
        else
            fmap_cnt <= fmap_cnt;
        if(fmap_en)
            fmap_r_conv2_cnt <= fmap_r_conv2_cnt + 1;
        else
            fmap_r_conv2_cnt <= 8'd0;
    end
    FC:begin
        weight_fc_addr <= weight_fc_addr + 1;
        if(|fc_ivalid&&fmap_r_fc_cnt <8'd15)
            fmap_r_fc_cnt <= fmap_r_fc_cnt + 1;
        else
            fmap_r_fc_cnt <= 8'd0;

        if(fc_ovalid == 10'b0000000001)
            fc_out_cnt_0 <= fc_out_cnt_0 + 1;
        else if(fc_ovalid == 10'b0000000010)
            fc_out_cnt_1 <= fc_out_cnt_1 + 1;
        else if(fc_ovalid == 10'b0000000100)
            fc_out_cnt_2 <= fc_out_cnt_2 + 1;
        else if(fc_ovalid == 10'b0000001000)
            fc_out_cnt_3 <= fc_out_cnt_3 + 1;
        else if(fc_ovalid == 10'b0000010000)
            fc_out_cnt_4 <= fc_out_cnt_4 + 1;
        else if(fc_ovalid == 10'b0000100000)
            fc_out_cnt_5 <= fc_out_cnt_5 + 1;
        else if(fc_ovalid == 10'b0001000000)
            fc_out_cnt_6 <= fc_out_cnt_6 + 1;
        else if(fc_ovalid == 10'b0010000000)
            fc_out_cnt_7 <= fc_out_cnt_7 + 1;
        else if(fc_ovalid == 10'b0100000000)
            fc_out_cnt_8 <= fc_out_cnt_8 + 1;
        else if(fc_ovalid == 10'b1000000000)
            fc_out_cnt_9 <= fc_out_cnt_9 + 1;
        else begin
            fc_out_cnt_0 <= fc_out_cnt_0;
            fc_out_cnt_1 <= fc_out_cnt_1;
            fc_out_cnt_2 <= fc_out_cnt_2;
            fc_out_cnt_3 <= fc_out_cnt_3;
            fc_out_cnt_4 <= fc_out_cnt_4;
            fc_out_cnt_5 <= fc_out_cnt_5;
            fc_out_cnt_6 <= fc_out_cnt_6;
            fc_out_cnt_7 <= fc_out_cnt_7;
            fc_out_cnt_8 <= fc_out_cnt_8;
            fc_out_cnt_9 <= fc_out_cnt_9;
        end
    end
    CLASSES:begin
        //!计算fc_out中最大的值，给出他的位置
        max_addr12 <= max_addr04;
        fc_out_max_12 <= fc_out_max_04;
        max_addr21 <= max_addr12;
        fc_out_max_21 <= fc_out_max_12;
        if(fc_out_reg[0] > fc_out_reg[1])begin
            max_addr00 <= 4'd0;
            fc_out_max_00 <= fc_out_reg[0];
        end
        else begin
            max_addr00 <= 4'd1;
            fc_out_max_00 <= fc_out_reg[1];
        end
        if(fc_out_reg[2] > fc_out_reg[3])begin
            max_addr01 <= 4'd2;
            fc_out_max_01 <= fc_out_reg[2];
        end
        else begin
            max_addr01 <= 4'd3;
            fc_out_max_01 <= fc_out_reg[3];
        end
        if(fc_out_reg[4] > fc_out_reg[5])begin
            max_addr02 <= 4'd4;
            fc_out_max_02 <= fc_out_reg[4];
        end
        else begin
            max_addr02 <= 4'd5;
            fc_out_max_02 <= fc_out_reg[5];
        end
        if(fc_out_reg[6] > fc_out_reg[7])begin
            max_addr03 <= 4'd6;
            fc_out_max_03 <= fc_out_reg[6];
        end
        else begin
            max_addr03 <= 4'd7;
            fc_out_max_03 <= fc_out_reg[7];
        end
        if(fc_out_reg[8] > fc_out_reg[9])begin
            max_addr04 <= 4'd8;
            fc_out_max_04 <= fc_out_reg[8];
        end
        else begin
            max_addr04 <= 4'd9;
            fc_out_max_04 <= fc_out_reg[9];
        end
        if(fc_out_max_00 > fc_out_max_01)begin
            max_addr10 <= max_addr00;
            fc_out_max_10 <= fc_out_max_00;
        end
        else begin
            max_addr10 <= max_addr01;
            fc_out_max_10 <= fc_out_max_01;
        end
        if(fc_out_max_02 > fc_out_max_03)begin
            max_addr11 <= max_addr02;
            fc_out_max_11 <= fc_out_max_02;
        end
        else begin
            max_addr11 <= max_addr03;
            fc_out_max_11 <= fc_out_max_03;
        end
        if(fc_out_max_10 > fc_out_max_11)begin
            max_addr20 <= max_addr10;
            fc_out_max_20 <= fc_out_max_10;
        end
        else begin
            max_addr20 <= max_addr11;
            fc_out_max_20 <= fc_out_max_11;
        end
        if(fc_out_max_20 > fc_out_max_21)begin
            max_addr30 <= max_addr20;
            fc_out_max_30 <= fc_out_max_20;
        end
        else begin
            max_addr30 <= max_addr21;
            fc_out_max_30 <= fc_out_max_21;
        end
        classes[max_addr30] <= 1'b1;
        cnt_classes <= cnt_classes + 1;
        if(cnt_classes == 3'd4)
            compare_done <= 1'b1;
        else
            compare_done <= 1'b0;
    end
    endcase
    end

always @(posedge clk) begin
    weight_c_ff_reg <= weight_c;
    weight_fc_ff_reg <= weight_fc;
end

assign weight_c_ff = weight_c_ff_reg;
assign weight_fc_ff = weight_fc_ff_reg;

ROM_conv1 blk_mem_gen_0_inst(
    .clka(clk),
    .addra(weight_conv1_addr),
    .douta(weight_conv1)
);
ROM_conv2 blk_mem_gen_1_inst(
    .clka(clk),
    .addra(weight_conv2_addr),
    .douta(weight_conv2)
);
ROM_fc blk_mem_gen_2_inst(
    .clka(clk),
    .addra(weight_fc_addr),
    .douta(weight_fc)
);

conv_mix_6 conv_mix_6_inst(
    .clk(clk),
    .rstn(rstn),
    .start(start_conv),
    .weight_en(weight_en),
    .weight(weight_c_ff),
    .din_0(image_in_0),
    .din_1(image_in_1),
    .din_2(image_in_2),
    .din_3(image_in_3),
    .din_4(image_in_4),
    .din_5(image_in_5),
    .state(stage),
    .ovalid(ovalid),
    .done(conv_done),
    .dout_0(conv_result_0),
    .dout_1(conv_result_1),
    .dout_2(conv_result_2),
    .dout_3(conv_result_3),
    .dout_4(conv_result_4),
    .dout_5(conv_result_5),
    .din_ready(din_ready_0)
);

fc_12 fc_12_inst0(
    .clk(clk),
    .rstn(rstn),
    .ivalid(fc_ivalid[0]),
    .din_0(fc_in_0),
    .din_1(fc_in_1),
    .din_2(fc_in_2),
    .din_3(fc_in_3),
    .din_4(fc_in_4),
    .din_5(fc_in_5),
    .din_6(fc_in_6),
    .din_7(fc_in_7),
    .din_8(fc_in_8),
    .din_9(fc_in_9),
    .din_10(fc_in_10),
    .din_11(fc_in_11),
    .weight(weight_fc_ff),
    .weight_en(weight_en_fc[0]),
    .ovalid(fc_ovalid[0]),
    .dout(fc_out[0])
);
fc_12 fc_12_inst1(
    .clk(clk),
    .rstn(rstn),
    .ivalid(fc_ivalid[1]),
    .din_0(fc_in_0),
    .din_1(fc_in_1),
    .din_2(fc_in_2),
    .din_3(fc_in_3),
    .din_4(fc_in_4),
    .din_5(fc_in_5),
    .din_6(fc_in_6),
    .din_7(fc_in_7),
    .din_8(fc_in_8),
    .din_9(fc_in_9),
    .din_10(fc_in_10),
    .din_11(fc_in_11),
    .weight(weight_fc_ff),
    .weight_en(weight_en_fc[1]),
    .ovalid(fc_ovalid[1]),
    .dout(fc_out[1])
);
fc_12 fc_12_inst2(
    .clk(clk),
    .rstn(rstn),
    .ivalid(fc_ivalid[2]),
    .din_0(fc_in_0),
    .din_1(fc_in_1),
    .din_2(fc_in_2),
    .din_3(fc_in_3),
    .din_4(fc_in_4),
    .din_5(fc_in_5),
    .din_6(fc_in_6),
    .din_7(fc_in_7),
    .din_8(fc_in_8),
    .din_9(fc_in_9),
    .din_10(fc_in_10),
    .din_11(fc_in_11),
    .weight(weight_fc_ff),
    .weight_en(weight_en_fc[2]),
    .ovalid(fc_ovalid[2]),
    .dout(fc_out[2])
);
fc_12 fc_12_inst3(
    .clk(clk),
    .rstn(rstn),
    .ivalid(fc_ivalid[3]),
    .din_0(fc_in_0),
    .din_1(fc_in_1),
    .din_2(fc_in_2),
    .din_3(fc_in_3),
    .din_4(fc_in_4),
    .din_5(fc_in_5),
    .din_6(fc_in_6),
    .din_7(fc_in_7),
    .din_8(fc_in_8),
    .din_9(fc_in_9),
    .din_10(fc_in_10),
    .din_11(fc_in_11),
    .weight(weight_fc_ff),
    .weight_en(weight_en_fc[3]),
    .ovalid(fc_ovalid[3]),
    .dout(fc_out[3])
);
fc_12 fc_12_inst4(
    .clk(clk),
    .rstn(rstn),
    .ivalid(fc_ivalid[4]),
    .din_0(fc_in_0),
    .din_1(fc_in_1),
    .din_2(fc_in_2),
    .din_3(fc_in_3),
    .din_4(fc_in_4),
    .din_5(fc_in_5),
    .din_6(fc_in_6),
    .din_7(fc_in_7),
    .din_8(fc_in_8),
    .din_9(fc_in_9),
    .din_10(fc_in_10),
    .din_11(fc_in_11),
    .weight(weight_fc_ff),
    .weight_en(weight_en_fc[4]),
    .ovalid(fc_ovalid[4]),
    .dout(fc_out[4])
);
fc_12 fc_12_inst5(
    .clk(clk),
    .rstn(rstn),
    .ivalid(fc_ivalid[5]),
    .din_0(fc_in_0),
    .din_1(fc_in_1),
    .din_2(fc_in_2),
    .din_3(fc_in_3),
    .din_4(fc_in_4),
    .din_5(fc_in_5),
    .din_6(fc_in_6),
    .din_7(fc_in_7),
    .din_8(fc_in_8),
    .din_9(fc_in_9),
    .din_10(fc_in_10),
    .din_11(fc_in_11),
    .weight(weight_fc_ff),
    .weight_en(weight_en_fc[5]),
    .ovalid(fc_ovalid[5]),
    .dout(fc_out[5])
);
fc_12 fc_12_inst6(
    .clk(clk),
    .rstn(rstn),
    .ivalid(fc_ivalid[6]),
    .din_0(fc_in_0),
    .din_1(fc_in_1),
    .din_2(fc_in_2),
    .din_3(fc_in_3),
    .din_4(fc_in_4),
    .din_5(fc_in_5),
    .din_6(fc_in_6),
    .din_7(fc_in_7),
    .din_8(fc_in_8),
    .din_9(fc_in_9),
    .din_10(fc_in_10),
    .din_11(fc_in_11),
    .weight(weight_fc_ff),
    .weight_en(weight_en_fc[6]),
    .ovalid(fc_ovalid[6]),
    .dout(fc_out[6])
);
fc_12 fc_12_inst7(
    .clk(clk),
    .rstn(rstn),
    .ivalid(fc_ivalid[7]),
    .din_0(fc_in_0),
    .din_1(fc_in_1),
    .din_2(fc_in_2),
    .din_3(fc_in_3),
    .din_4(fc_in_4),
    .din_5(fc_in_5),
    .din_6(fc_in_6),
    .din_7(fc_in_7),
    .din_8(fc_in_8),
    .din_9(fc_in_9),
    .din_10(fc_in_10),
    .din_11(fc_in_11),
    .weight(weight_fc_ff),
    .weight_en(weight_en_fc[7]),
    .ovalid(fc_ovalid[7]),
    .dout(fc_out[7])
);
fc_12 fc_12_inst8(
    .clk(clk),
    .rstn(rstn),
    .ivalid(fc_ivalid[8]),
    .din_0(fc_in_0),
    .din_1(fc_in_1),
    .din_2(fc_in_2),
    .din_3(fc_in_3),
    .din_4(fc_in_4),
    .din_5(fc_in_5),
    .din_6(fc_in_6),
    .din_7(fc_in_7),
    .din_8(fc_in_8),
    .din_9(fc_in_9),
    .din_10(fc_in_10),
    .din_11(fc_in_11),
    .weight(weight_fc_ff),
    .weight_en(weight_en_fc[8]),
    .ovalid(fc_ovalid[8]),
    .dout(fc_out[8])
);
fc_12 fc_12_inst9(
    .clk(clk),
    .rstn(rstn),
    .ivalid(fc_ivalid[9]),
    .din_0(fc_in_0),
    .din_1(fc_in_1),
    .din_2(fc_in_2),
    .din_3(fc_in_3),
    .din_4(fc_in_4),
    .din_5(fc_in_5),
    .din_6(fc_in_6),
    .din_7(fc_in_7),
    .din_8(fc_in_8),
    .din_9(fc_in_9),
    .din_10(fc_in_10),
    .din_11(fc_in_11),
    .weight(weight_fc_ff),
    .weight_en(weight_en_fc[9]),
    .ovalid(fc_ovalid[9]),
    .dout(fc_out[9])
);
//!状态转移逻辑
always @(posedge clk or negedge rstn) begin
    if(~rstn)
        state <= IDLE;
    else
        state <= next_state;
end

//!下一状态逻辑
always @( *) begin
    case(state)
        IDLE:begin
            if(start)
                next_state = CONV_1;
            else
                next_state = IDLE;
        end
        CONV_1:begin
            if(conv_done_ff_1 == 6'b111111)
                next_state = CONV_2;
            else
                next_state = CONV_1;
        end
        CONV_2:begin
            if(conv_cnt == 8'd13 )
                next_state = FC;
            else
                next_state = CONV_2; 
        end
        FC:begin
            if(fc_ovalid == 10'b1000000000)
                next_state = CLASSES;
            else
                next_state = FC;
        end
        CLASSES:begin
            if(compare_done)
                next_state = IDLE;
            else
                next_state = CLASSES;
        end
    endcase
end

always @(posedge clk or negedge rstn) begin
    if(!rstn) begin
        conv_cnt <= 8'd0;
        start_conv2 <= 1'b0;
    end
    else begin
        if(conv_done == 6'b111111) begin
            conv_cnt <= conv_cnt + 1;
            start_conv2 <= 1'b0;
        end
        else if(conv_cnt - conv_cnt_ff0 == 8'd1) begin
            conv_cnt <= conv_cnt;
            start_conv2 <= 1'b1;
        end
        else begin
            conv_cnt <= conv_cnt;
            start_conv2 <= start_conv2;
        end
    end
end
always @(posedge clk) begin
    conv_cnt_ff0 <= conv_cnt;
    conv_cnt_ff1 <= conv_cnt_ff0;
    conv_cnt_ff2 <= conv_cnt_ff1;
    conv_cnt_ff3 <= conv_cnt_ff2;
end

endmodule