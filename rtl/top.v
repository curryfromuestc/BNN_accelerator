module top(
    input wire image_in,
    input wire weight_fc_0_in,
    input wire weight_fc_1_in,
    input wire weight_fc_2_in,
    input wire weight_fc_3_in,
    input wire weight_fc_4_in,
    input wire weight_fc_5_in,
    input wire weight_fc_6_in,
    input wire weight_fc_7_in,
    input wire weight_fc_8_in,
    input wire weight_fc_9_in,
    input wire weight_conv_in,
    input wire clk,
    input wire rstn,
    input wire start,
    output wire fc_ivalid,
    output done,
    output [3:0] classes_b,
    output wire weight_en_0,weight_en_1
);

wire conv_0_start,conv_1_start;
wire [1:0]conv_done;
wire conv_din_0,conv_din_1;
wire state;
wire [4:0]conv_result_0,conv_result_1;
wire signed [4:0]conv_result_0_f,conv_result_1_f;
wire conv_result_0_valid,conv_result_1_valid;
wire conv_result_0_valid_f,conv_result_1_valid_f;
wire fc_din;
wire [9:0] classes;
wire signed [9:0] fc_result_0,fc_result_1,fc_result_2,fc_result_3,fc_result_4,fc_result_5,fc_result_6,fc_result_7,fc_result_8,fc_result_9;
wire signed [4:0] conv2_result_sum0;
wire maxpool_valid;
wire[9:0] fc_ovalid;


controller controller_inst(
    .clk(clk),
    .rstn(rstn),
    .start(start),
    .conv_result_0(conv_result_0),
    .conv_result_0_valid(conv_result_0_valid),
    .conv_result_1(conv_result_1),
    .conv_result_1_valid(conv_result_1_valid),
    .pic_din(image_in),
    .conv_done(conv_done),
    .conv_din_0(conv_din_0),
    .conv_0_start(conv_0_start),
    .weight_en_0(weight_en_0),
    .conv_din_1(conv_din_1),
    .conv_1_start(conv_1_start),
    .weight_en_1(weight_en_1),
    .stage(state),
    .conv2_result_sum0(conv2_result_sum0),
    .maxpool_valid(maxpool_valid),
    .fc_result_0(fc_result_0),
    .fc_result_1(fc_result_1),
    .fc_result_2(fc_result_2),
    .fc_result_3(fc_result_3),
    .fc_result_4(fc_result_4),
    .fc_result_5(fc_result_5),
    .fc_result_6(fc_result_6),
    .fc_result_7(fc_result_7),
    .fc_result_8(fc_result_8),
    .fc_result_9(fc_result_9),
    .fc_result_valid(fc_ovalid[0]),
    .classes(classes),
    .done(done)
);

conv_mix conv_mix_inst_0(
    .clk(clk),
    .rstn(rstn),
    .start(start),
    .din(conv_din_0),
    .state(state),
    .weight_en(weight_en_0),
    .weight(weight_conv_in),
    .dout(conv_result_0_f),
    .ovalid(conv_result_0_valid_f),
    .done(conv_done[0])
);

conv_mix conv_mix_inst_1(
    .clk(clk),
    .rstn(rstn),
    .start(start),
    .din(conv_din_1),
    .state(state),
    .weight_en(weight_en_1),
    .weight(weight_conv_in),
    .dout(conv_result_1_f),
    .ovalid(conv_result_1_valid_f),
    .done(conv_done[1])
);

fc_12 fc_12_inst_0(
    .clk(clk),
    .rstn(rstn),
    .ivalid(fc_ivalid),
    .inputdata(fc_din),
    .weight(weight_fc_0_in),
    .ovalid(fc_ovalid[0]),
    .dout(fc_result_0)
);

fc_12 fc_12_inst_1(
    .clk(clk),
    .rstn(rstn),
    .ivalid(fc_ivalid),
    .inputdata(fc_din),
    .weight(weight_fc_1_in),
    .ovalid(fc_ovalid[1]),
    .dout(fc_result_1)
);

fc_12 fc_12_inst_2(
    .clk(clk),
    .rstn(rstn),
    .ivalid(fc_ivalid),
    .inputdata(fc_din),
    .weight(weight_fc_2_in),
    .ovalid(fc_ovalid[2]),
    .dout(fc_result_2)
);

fc_12 fc_12_inst_3(
    .clk(clk),
    .rstn(rstn),
    .ivalid(fc_ivalid),
    .inputdata(fc_din),
    .weight(weight_fc_3_in),
    .ovalid(fc_ovalid[3]),
    .dout(fc_result_3)
);

fc_12 fc_12_inst_4(
    .clk(clk),
    .rstn(rstn),
    .ivalid(fc_ivalid),
    .inputdata(fc_din),
    .weight(weight_fc_4_in),
    .ovalid(fc_ovalid[4]),
    .dout(fc_result_4)
);


fc_12 fc_12_inst_5(
    .clk(clk),
    .rstn(rstn),
    .ivalid(fc_ivalid),
    .inputdata(fc_din),
    .weight(weight_fc_5_in),
    .ovalid(fc_ovalid[5]),
    .dout(fc_result_5)
);

fc_12 fc_12_inst_6(
    .clk(clk),
    .rstn(rstn),
    .ivalid(fc_ivalid),
    .inputdata(fc_din),
    .weight(weight_fc_6_in),
    .ovalid(fc_ovalid[6]),
    .dout(fc_result_6)
);

fc_12 fc_12_inst_7(
    .clk(clk),
    .rstn(rstn),
    .ivalid(fc_ivalid),
    .inputdata(fc_din),
    .weight(weight_fc_7_in),
    .ovalid(fc_ovalid[7]),
    .dout(fc_result_7)
);

fc_12 fc_12_inst_8(
    .clk(clk),
    .rstn(rstn),
    .ivalid(fc_ivalid),
    .inputdata(fc_din),
    .weight(weight_fc_8_in),
    .ovalid(fc_ovalid[8]),
    .dout(fc_result_8)
);


fc_12 fc_12_inst_9(
    .clk(clk),
    .rstn(rstn),
    .ivalid(fc_ivalid),
    .inputdata(fc_din),
    .weight(weight_fc_9_in),
    .ovalid(fc_ovalid[9]),
    .dout(fc_result_9)
);

maxpool maxpool_inst(
    .clk(clk),
    .rstn(rstn),
    .ivalid(maxpool_valid),
    .state(state),
    .din(conv2_result_sum0),
    .dout(fc_din),
    .ovalid(fc_ivalid)
);

onehot2b onehot2b_inst(
    .classes(classes),
    .classes_b(classes_b)
);

endmodule