module window (
    input wire clk,
    input wire start,
    input wire signed[15:0] din,
    input wire state,
    output wire [79:0]taps
);

// 声明一个ram
reg signed[15:0] mem [0:139];
always @(posedge clk) begin
    if (start) begin
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
        mem[84] <= mem[83];
        mem[85] <= mem[84];
        mem[86] <= mem[85];
        mem[87] <= mem[86];
        mem[88] <= mem[87];
        mem[89] <= mem[88];
        mem[90] <= mem[89];
        mem[91] <= mem[90];
        mem[92] <= mem[91];
        mem[93] <= mem[92];
        mem[94] <= mem[93];
        mem[95] <= mem[94];
        mem[96] <= mem[95];
        mem[97] <= mem[96];
        mem[98] <= mem[97];
        mem[99] <= mem[98];
        mem[100] <= mem[99];
        mem[101] <= mem[100];
        mem[102] <= mem[101];
        mem[103] <= mem[102];
        mem[104] <= mem[103];
        mem[105] <= mem[104];
        mem[106] <= mem[105];
        mem[107] <= mem[106];
        mem[108] <= mem[107];
        mem[109] <= mem[108];
        mem[110] <= mem[109];
        mem[111] <= mem[110];
        mem[112] <= mem[111];
        mem[113] <= mem[112];
        mem[114] <= mem[113];
        mem[115] <= mem[114];
        mem[116] <= mem[115];
        mem[117] <= mem[116];
        mem[118] <= mem[117];
        mem[119] <= mem[118];
        mem[120] <= mem[119];
        mem[121] <= mem[120];
        mem[122] <= mem[121];
        mem[123] <= mem[122];
        mem[124] <= mem[123];
        mem[125] <= mem[124];
        mem[126] <= mem[125]; 
        mem[127] <= mem[126];
        mem[128] <= mem[127];
        mem[129] <= mem[128];
        mem[130] <= mem[129];
        mem[131] <= mem[130];
        mem[132] <= mem[131];
        mem[133] <= mem[132];
        mem[134] <= mem[133];
        mem[135] <= mem[134];
        mem[136] <= mem[135];
        mem[137] <= mem[136];
        mem[138] <= mem[137];
        mem[139] <= mem[138];
    end
end
assign taps = (!state)?
                {mem[139],mem[111],mem[83],mem[55],mem[27]}
                :{mem[59],mem[47],mem[35],mem[23],mem[11]};    
endmodule