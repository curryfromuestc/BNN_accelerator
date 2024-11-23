module controller
#(
    parameter N = 6
)
(
    input wire clk,
    input wire rstn,
    input wire start,
    input wire[5:0] weight_en,
    input wire signed[15:0] din_0,
    input wire signed[15:0] din_1,
    input wire signed[15:0] din_2,
    input wire signed[15:0] din_3,
    input wire signed[15:0] din_4,
    input wire signed[15:0] din_5,
    input wire state,
    output wire[5:0] ovalid,
    output reg[5:0] done,
    output wire din_ready,
    output signed[15:0] dout_0,
    output signed[15:0] dout_1,
    output signed[15:0] dout_2,
    output signed[15:0] dout_3,
    output signed[15:0] dout_4,
    output signed[15:0] dout_5
)
(

);
endmodule