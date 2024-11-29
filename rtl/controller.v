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
    output wire conv_din_0,
    output wire conv_0_start,
    output wire weight_en_0,
    output wire conv_din_1,
    output wire conv_1_start,
    output wire weight_en_1,
    output wire conv_din_2,
    output wire conv_2_start,
    output wire weight_en_2,
    output wire conv_weight,
    output wire state,
    //------------------------全连接控制信号----------------------------
    output wire fc_din_0,
    output wire fc_din_1,
    output wire fc_din_2,
    output wire fc_din_3,
    output wire fc_din_4,
    output wire fc_din_5,
    output wire fc_din_6,
    output wire fc_din_7,
    output wire fc_din_8,
    output wire fc_din_9,
    output wire fc_din_10,
    output wire fc_din_11,
    output wire fc_invalid,
    output wire fc_weight_en,
    output wire fc_weight,
    input wire fc_result,
    input wire fc_result_valid,
    //------------------------输出控制信号----------------------------
    output wire[9:0] classes,
    output wire[9:0] ovalid
);

reg [2027:0] feature_map;

endmodule