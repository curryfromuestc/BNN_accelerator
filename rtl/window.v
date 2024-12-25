module window (
    input wire clk,
    input wire start,
    input wire rstn,
    input wire din,
    input wire state,
    output wire [2:0]taps
);

// 声明一个ram
reg mem [0:83];
always @(posedge clk or negedge rstn) begin
    if (!rstn) begin
        mem[0] <= 1'b0;
        mem[1] <= 1'b0;
        mem[2] <= 1'b0;
        mem[3] <= 1'b0;
        mem[4] <= 1'b0;
        mem[5] <= 1'b0;
        mem[6] <= 1'b0;
        mem[7] <= 1'b0;
        mem[8] <= 1'b0;
        mem[9] <= 1'b0;
        mem[10] <= 1'b0;
        mem[11] <= 1'b0;
        mem[12] <= 1'b0;
        mem[13] <= 1'b0;
        mem[14] <= 1'b0;
        mem[15] <= 1'b0;
        mem[16] <= 1'b0;
        mem[17] <= 1'b0;
        mem[18] <= 1'b0;
        mem[19] <= 1'b0;
        mem[20] <= 1'b0;
        mem[21] <= 1'b0;
        mem[22] <= 1'b0;
        mem[23] <= 1'b0;
        mem[24] <= 1'b0;
        mem[25] <= 1'b0;
        mem[26] <= 1'b0;
        mem[27] <= 1'b0;
        mem[28] <= 1'b0;
        mem[29] <= 1'b0;
        mem[30] <= 1'b0;
        mem[31] <= 1'b0;
        mem[32] <= 1'b0;
        mem[33] <= 1'b0;
        mem[34] <= 1'b0;
        mem[35] <= 1'b0;
        mem[36] <= 1'b0;
        mem[37] <= 1'b0;
        mem[38] <= 1'b0;
        mem[39] <= 1'b0;
        mem[40] <= 1'b0;
        mem[41] <= 1'b0;
        mem[42] <= 1'b0;
        mem[43] <= 1'b0;
        mem[44] <= 1'b0;
        mem[45] <= 1'b0;
        mem[46] <= 1'b0;
        mem[47] <= 1'b0;
        mem[48] <= 1'b0;
        mem[49] <= 1'b0;
        mem[50] <= 1'b0;
        mem[51] <= 1'b0;
        mem[52] <= 1'b0;
        mem[53] <= 1'b0;
        mem[54] <= 1'b0;
        mem[55] <= 1'b0;
        mem[56] <= 1'b0;
        mem[57] <= 1'b0;
        mem[58] <= 1'b0;
        mem[59] <= 1'b0;
        mem[60] <= 1'b0;
        mem[61] <= 1'b0;
        mem[62] <= 1'b0;
        mem[63] <= 1'b0;
        mem[64] <= 1'b0;
        mem[65] <= 1'b0;
        mem[66] <= 1'b0;
        mem[67] <= 1'b0;
        mem[68] <= 1'b0;
        mem[69] <= 1'b0;
        mem[70] <= 1'b0;
        mem[71] <= 1'b0;
        mem[72] <= 1'b0;
        mem[73] <= 1'b0;
        mem[74] <= 1'b0;
        mem[75] <= 1'b0;
        mem[76] <= 1'b0;
        mem[77] <= 1'b0;
        mem[78] <= 1'b0;
        mem[79] <= 1'b0;
        mem[80] <= 1'b0;
        mem[81] <= 1'b0;
        mem[82] <= 1'b0;
        mem[83] <= 1'b0;
    end
    else if (start) begin
        mem[0] <= din;
        mem[1] <= mem[0];
        mem[2] <= mem[1];
        mem[3] <= mem[2];
        mem[4] <= mem[3];
        mem[5] <= mem[4];
        mem[6] <= mem[5];
        mem[7] <= mem[6];
        mem[8] <= mem[7];
        mem[9] <= mem[8];
        mem[10] <= mem[9];
        mem[11] <= mem[10];
        mem[12] <= mem[11];
        mem[13] <= mem[12];
        mem[14] <= mem[13];
        mem[15] <= mem[14];
        mem[16] <= mem[15];
        mem[17] <= mem[16];
        mem[18] <= mem[17];
        mem[19] <= mem[18];
        mem[20] <= mem[19];
        mem[21] <= mem[20];
        mem[22] <= mem[21];
        mem[23] <= mem[22];
        mem[24] <= mem[23];
        mem[25] <= mem[24];
        mem[26] <= mem[25];
        mem[27] <= mem[26];
        mem[28] <= mem[27];
        mem[29] <= mem[28];
        mem[30] <= mem[29];
        mem[31] <= mem[30];
        mem[32] <= mem[31];
        mem[33] <= mem[32];
        mem[34] <= mem[33];
        mem[35] <= mem[34];
        mem[36] <= mem[35];
        mem[37] <= mem[36];
        mem[38] <= mem[37];
        mem[39] <= mem[38];
        mem[40] <= mem[39];
        mem[41] <= mem[40];
        mem[42] <= mem[41];
        mem[43] <= mem[42];
        mem[44] <= mem[43];
        mem[45] <= mem[44];
        mem[46] <= mem[45];
        mem[47] <= mem[46];
        mem[48] <= mem[47];
        mem[49] <= mem[48];
        mem[50] <= mem[49];
        mem[51] <= mem[50];
        mem[52] <= mem[51];
        mem[53] <= mem[52];
        mem[54] <= mem[53];
        mem[55] <= mem[54];
        mem[56] <= mem[55];
        mem[57] <= mem[56];
        mem[58] <= mem[57];
        mem[59] <= mem[58];
        mem[60] <= mem[59];
        mem[61] <= mem[60];
        mem[62] <= mem[61];
        mem[63] <= mem[62];
        mem[64] <= mem[63];
        mem[65] <= mem[64];
        mem[66] <= mem[65];
        mem[67] <= mem[66];
        mem[68] <= mem[67];
        mem[69] <= mem[68];
        mem[70] <= mem[69];
        mem[71] <= mem[70];
        mem[72] <= mem[71];
        mem[73] <= mem[72];
        mem[74] <= mem[73];
        mem[75] <= mem[74];
        mem[76] <= mem[75];
        mem[77] <= mem[76];
        mem[78] <= mem[77];
        mem[79] <= mem[78];
        mem[80] <= mem[79];
        mem[81] <= mem[80];
        mem[82] <= mem[81];
        mem[83] <= mem[82];
    end
end
assign taps = (!state)?
                {mem[83],mem[55],mem[27]}
                :{mem[77],mem[51],mem[25]};    
endmodule