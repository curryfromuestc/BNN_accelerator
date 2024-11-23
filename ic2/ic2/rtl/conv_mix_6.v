module conv_mix_6(
    input wire clk,
    input wire rstn,
    input wire start,//！启动信号，注意跟滑窗模块的启动信号时间不一�??
    input wire[5:0] weight_en,//�?? 权重有效信号
    input weight,//�?? 以比特权�??
    input wire signed[15:0] din_0,
    input wire signed[15:0] din_1,
    input wire signed[15:0] din_2,
    input wire signed[15:0] din_3,
    input wire signed[15:0] din_4,
    input wire signed[15:0] din_5,
    input state,//�?? 状�?�信�??
    output wire[5:0] ovalid,//�?? 输出有效信号
    output reg[5:0] done,//�?? 卷积运算完成信号
    output wire din_ready,
    output signed[15:0] dout_0,
    output signed[15:0] dout_1,
    output signed[15:0] dout_2,
    output signed[15:0] dout_3,
    output signed[15:0] dout_4,
    output signed[15:0] dout_5
);

reg start_window;
wire [79:0] taps_0;
wire [79:0] taps_1;
wire [79:0] taps_2;
wire [79:0] taps_3;
wire [79:0] taps_4;
wire [79:0] taps_5;
wire signed [15:0] conv_dout_0;
wire signed [15:0] conv_dout_1;
wire signed [15:0] conv_dout_2;
wire signed [15:0] conv_dout_3;
wire signed [15:0] conv_dout_4;
wire signed [15:0] conv_dout_5;
reg signed [15:0] conv_dout_0_ff_0,conv_dout_0_ff_1,conv_dout_0_ff_2;
reg signed [15:0] conv_dout_1_ff_0,conv_dout_1_ff_1,conv_dout_1_ff_2;
reg signed [15:0] conv_dout_2_ff_0,conv_dout_2_ff_1,conv_dout_2_ff_2;
reg signed [15:0] conv_dout_3_ff_0,conv_dout_3_ff_1,conv_dout_3_ff_2;
reg signed [15:0] conv_dout_4_ff_0,conv_dout_4_ff_1,conv_dout_4_ff_2;
reg signed [15:0] conv_dout_5_ff_0,conv_dout_5_ff_1,conv_dout_5_ff_2;
reg [7:0] cnt;//! 用于计数，工作时钟，控制滑窗模块启动时间
wire[5:0] conv_ovalid;
reg [5:0] conv_ovalid_ff_0,conv_ovalid_ff_1,conv_ovalid_ff_2;
wire[5:0] conv_done;

reg signed[15:0] conv_result_sum0_0;
reg signed[15:0] conv_result_sum0_1;
reg signed[15:0] conv_result_sum0_2;
reg signed[15:0] conv_result_sum1_0;
reg signed[15:0] conv_result_sum1_1;
reg signed[15:0] conv_result_sum2;

window window_inst_0(
    .clk(clk),
    .start(start_window),
    .din(din_0),
    .state(state),
    .taps(taps_0)
);
window window_inst_1(
    .clk(clk),
    .start(start_window),
    .din(din_1),
    .state(state),
    .taps(taps_1)
);
window window_inst_2(
    .clk(clk),
    .start(start_window),
    .din(din_2),
    .state(state),
    .taps(taps_2)
);
window window_inst_3(
    .clk(clk),
    .start(start_window),
    .din(din_3),
    .state(state),
    .taps(taps_3)
);
window window_inst_4(
    .clk(clk),
    .start(start_window),
    .din(din_4),
    .state(state),
    .taps(taps_4)
);
window window_inst_5(
    .clk(clk),
    .start(start_window),
    .din(din_5),
    .state(state),
    .taps(taps_5)
);

conv conv_inst_0(
    .clk(clk),
    .rstn(rstn),
    .start(start),
    .weight_en(weight_en[0]),
    .weight(weight),
    .taps(taps_0),
    .state(state),
    .dout(conv_dout_0),
    .ovalid(conv_ovalid[0]),
    .done(conv_done[0])
);

conv conv_inst_1(
    .clk(clk),
    .rstn(rstn),
    .start(start),
    .weight_en(weight_en[1]),
    .weight(weight),
    .taps(taps_1),
    .state(state),
    .dout(conv_dout_1),
    .ovalid(conv_ovalid[1]),
    .done(conv_done[1])
);

conv conv_inst_2(
    .clk(clk),
    .rstn(rstn),
    .start(start),
    .weight_en(weight_en[2]),
    .weight(weight),
    .taps(taps_2),
    .state(state),
    .dout(conv_dout_2),
    .ovalid(conv_ovalid[2]),
    .done(conv_done[2])
);

conv conv_inst_3(
    .clk(clk),
    .rstn(rstn),
    .start(start),
    .weight_en(weight_en[3]),
    .weight(weight),
    .taps(taps_3),
    .state(state),
    .dout(conv_dout_3),
    .ovalid(conv_ovalid[3]),
    .done(conv_done[3])
);

conv conv_inst_4(
    .clk(clk),
    .rstn(rstn),
    .start(start),
    .weight_en(weight_en[4]),
    .weight(weight),
    .taps(taps_4),
    .state(state),
    .dout(conv_dout_4),
    .ovalid(conv_ovalid[4]),
    .done(conv_done[4])
);

conv conv_inst_5(
    .clk(clk),
    .rstn(rstn),
    .start(start),
    .weight_en(weight_en[5]),
    .weight(weight),
    .taps(taps_5),
    .state(state),
    .dout(conv_dout_5),
    .ovalid(conv_ovalid[5]),
    .done(conv_done[5])
);

//----------------------------控制滑窗模块启动时间----------------------------
//当state�??0时，滑窗模块启动时间相比卷积模块�??10个时钟周期，当state�??1时，滑窗模块启动时间相比卷积模块�??90个时钟周�??
always @(posedge clk) begin
    if (!rstn) begin
        cnt <= 8'd0;
        start_window <= 1'b0;
    end else begin
        if (state == 1'b0) begin
            if (cnt < 8'd9&&start&&(!start_window)) begin
                cnt <= cnt + 1;
                start_window <= 1'b0;
            end else begin
                cnt <= 0;
                start_window <= start;
            end
        end else begin
            if (cnt < 8'd89&&start&&(!start_window)) begin
                cnt <= cnt + 1;
                start_window <= 1'b0;
            end else begin
                cnt <= 0;
                start_window <= start;
            end
        end
    end
end

assign din_ready = start_window;

always @(posedge clk) begin
    if(state == 1)begin
        conv_result_sum0_0 <= conv_dout_0 + conv_dout_1;
        conv_result_sum0_1 <= conv_dout_2 + conv_dout_3;
        conv_result_sum0_2 <= conv_dout_4 + conv_dout_5;
        conv_result_sum1_0 <= conv_result_sum0_0+conv_result_sum0_1;
        conv_result_sum1_1 <= conv_result_sum0_2;
        conv_result_sum2 <= conv_result_sum1_0+conv_result_sum1_1;
        conv_ovalid_ff_0 <= conv_ovalid;
        conv_ovalid_ff_1 <= conv_ovalid_ff_0;
        conv_ovalid_ff_2 <= conv_ovalid_ff_1;
    end
    else begin
        conv_ovalid_ff_0 <= conv_ovalid;
        conv_ovalid_ff_1 <= conv_ovalid_ff_0;
        conv_ovalid_ff_2 <= conv_ovalid_ff_1;
        conv_dout_0_ff_0 <= conv_dout_0;
        conv_dout_0_ff_1 <= conv_dout_0_ff_0;
        conv_dout_0_ff_2 <= conv_dout_0_ff_1;
        conv_dout_1_ff_0 <= conv_dout_1;
        conv_dout_1_ff_1 <= conv_dout_1_ff_0;
        conv_dout_1_ff_2 <= conv_dout_1_ff_1;
        conv_dout_2_ff_0 <= conv_dout_2;
        conv_dout_2_ff_1 <= conv_dout_2_ff_0;
        conv_dout_2_ff_2 <= conv_dout_2_ff_1;
        conv_dout_3_ff_0 <= conv_dout_3;
        conv_dout_3_ff_1 <= conv_dout_3_ff_0;
        conv_dout_3_ff_2 <= conv_dout_3_ff_1;
        conv_dout_4_ff_0 <= conv_dout_4;
        conv_dout_4_ff_1 <= conv_dout_4_ff_0;
        conv_dout_4_ff_2 <= conv_dout_4_ff_1;
        conv_dout_5_ff_0 <= conv_dout_5;
        conv_dout_5_ff_1 <= conv_dout_5_ff_0;
        conv_dout_5_ff_2 <= conv_dout_5_ff_1;
    end
end

wire [15:0]relu_in_0;
wire [15:0]relu_in_1;
wire [15:0]relu_in_2;
wire [15:0]relu_in_3;
wire [15:0]relu_in_4;
wire [15:0]relu_in_5;

assign relu_in_0 = (state)?conv_result_sum2:conv_dout_0_ff_2;
assign relu_in_1 = (state)?conv_result_sum2:conv_dout_1_ff_2;
assign relu_in_2 = (state)?conv_result_sum2:conv_dout_2_ff_2;
assign relu_in_3 = (state)?conv_result_sum2:conv_dout_3_ff_2;
assign relu_in_4 = (state)?conv_result_sum2:conv_dout_4_ff_2;
assign relu_in_5 = (state)?conv_result_sum2:conv_dout_5_ff_2;

reg signed[15:0] relu_dout_0;
reg signed[15:0] relu_dout_1;
reg signed[15:0] relu_dout_2;
reg signed[15:0] relu_dout_3;
reg signed[15:0] relu_dout_4;
reg signed[15:0] relu_dout_5;

reg relu_ovalid_0;
reg relu_ovalid_1;
reg relu_ovalid_2;
reg relu_ovalid_3;
reg relu_ovalid_4;
reg relu_ovalid_5;

always @(posedge clk or negedge rstn) begin
    if(!rstn)begin
        relu_dout_0 <= 32'b0;
        relu_dout_1 <= 32'b0;
        relu_dout_2 <= 32'b0;
        relu_dout_3 <= 32'b0;
        relu_dout_4 <= 32'b0;
        relu_dout_5 <= 32'b0;
        relu_ovalid_0 <= 1'b0;
        relu_ovalid_1 <= 1'b0;
        relu_ovalid_2 <= 1'b0;
        relu_ovalid_3 <= 1'b0;
        relu_ovalid_4 <= 1'b0;
        relu_ovalid_5 <= 1'b0;
    end
    else begin
        if(conv_ovalid_ff_2 == 6'b111111)begin
            relu_ovalid_0 <= 1'b1;
            relu_ovalid_1 <= 1'b1;
            relu_ovalid_2 <= 1'b1;
            relu_ovalid_3 <= 1'b1;
            relu_ovalid_4 <= 1'b1;
            relu_ovalid_5 <= 1'b1;
        end
        else begin
            relu_ovalid_0 <= 1'b0;
            relu_ovalid_1 <= 1'b0;
            relu_ovalid_2 <= 1'b0;
            relu_ovalid_3 <= 1'b0;
            relu_ovalid_4 <= 1'b0;
            relu_ovalid_5 <= 1'b0;
        end
        if(relu_in_0[15])begin
            relu_dout_0 <= 32'b0;
        end
        else begin
            relu_dout_0 <= relu_in_0;
        end
        if(relu_in_1[15])begin
            relu_dout_1 <= 32'b0;
        end
        else begin
            relu_dout_1 <= relu_in_1;
        end
        if(relu_in_2[15])begin
            relu_dout_2 <= 32'b0;
        end
        else begin
            relu_dout_2 <= relu_in_2;
        end
        if(relu_in_3[15])begin
            relu_dout_3 <= 32'b0;
        end
        else begin
            relu_dout_3 <= relu_in_3;
        end
        if(relu_in_4[15])begin
            relu_dout_4 <= 32'b0;
        end
        else begin
            relu_dout_4 <= relu_in_4;
        end
        if(relu_in_5[15])begin
            relu_dout_5 <= 32'b0;
        end
        else begin
            relu_dout_5 <= relu_in_5;
        end
    end
end

maxpool maxpool_inst_0(
    .clk(clk),
    .rstn(rstn),
    .ivalid(relu_ovalid_0),
    .state(state),
    .din(relu_dout_0),
    .ovalid(ovalid[0]),
    .dout(dout_0)
);
maxpool maxpool_inst_1(
    .clk(clk),
    .rstn(rstn),
    .ivalid(relu_ovalid_1),
    .state(state),
    .din(relu_dout_1),
    .ovalid(ovalid[1]),
    .dout(dout_1)
);
maxpool maxpool_inst_2(
    .clk(clk),
    .rstn(rstn),
    .ivalid(relu_ovalid_2),
    .state(state),
    .din(relu_dout_2),
    .ovalid(ovalid[2]),
    .dout(dout_2)
);
maxpool maxpool_inst_3(
    .clk(clk),
    .rstn(rstn),
    .ivalid(relu_ovalid_3),
    .state(state),
    .din(relu_dout_3),
    .ovalid(ovalid[3]),
    .dout(dout_3)
);
maxpool maxpool_inst_4(
    .clk(clk),
    .rstn(rstn),
    .ivalid(relu_ovalid_4),
    .state(state),
    .din(relu_dout_4),
    .ovalid(ovalid[4]),
    .dout(dout_4)
);
maxpool maxpool_inst_5(
    .clk(clk),
    .rstn(rstn),
    .ivalid(relu_ovalid_5),
    .state(state),
    .din(relu_dout_5),
    .ovalid(ovalid[5]),
    .dout(dout_5)
);

reg [9:0]cnt_line;
always @(posedge clk or negedge rstn) begin
    if(!rstn)
        cnt_line <= 0;
    else begin
        case(state)
        1'b0:begin
        if(relu_ovalid_0)
            cnt_line <= cnt_line + 1;
        else if(cnt_line == 576)
            cnt_line <= 0;
        else 
            cnt_line <= cnt_line;
        end
        1'b1:begin
        if(relu_ovalid_0)
            cnt_line <= cnt_line + 1;
        else if(cnt_line == 64)
            cnt_line <= 0;
        else 
            cnt_line <= cnt_line;
        end
        endcase
     end
end

always @(*) begin
    case(state)
    1'b0:begin
    if(cnt_line == 576)
        done = 6'b111111;
    else
        done = 6'b000000;
    end
    1'b1:begin
    if(cnt_line == 64)
        done = 6'b111111;
    else
        done = 6'b000000;
    end
    endcase
end


endmodule