module conv_mix
#(
    parameter N = 6
)
(
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
endmodule