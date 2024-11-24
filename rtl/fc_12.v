module fc_12(
    input wire clk,
    input wire rstn,
    input wire ivalid,
    input signed [15:0] din_0,
    input signed [15:0] din_1,
    input signed [15:0] din_2,
    input signed [15:0] din_3,
    input signed [15:0] din_4,
    input signed [15:0] din_5,
    input signed [15:0] din_6,
    input signed [15:0] din_7,
    input signed [15:0] din_8,
    input signed [15:0] din_9,
    input signed [15:0] din_10,
    input signed [15:0] din_11,
    input wire weight,
    input wire weight_en,
    output wire ovalid,
    output wire signed [15:0] dout
);

reg [7:0] weight_addr, weight_addr_ff0, weight_addr_ff1;
reg w[0:191];

reg [4:0] cnt_fc;

reg signed [15:0] p0, p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11;
reg signed [15:0] sum00,sum01,sum02, sum03, sum04, sum05;
reg signed [15:0] sum10,sum11,sum12;
reg signed [15:0] sum20,sum21;
reg signed [15:0] sum;
reg signed [15:0] dout_r;


reg ivalid_ff_0,ivalid_ff_1,ivalid_ff_2,ivalid_ff_3,ivalid_ff_4,ivalid_ff_5;

always @(posedge clk or negedge rstn)begin
    if(!rstn)
        cnt_fc <= 5'd0;
    else begin
        if(ivalid)
            cnt_fc <= cnt_fc + 1;
        else
            cnt_fc <= cnt_fc;
    end
end

always @(posedge clk or negedge rstn) begin
    if(!rstn)begin
        ivalid_ff_0 <= 1'b0;
        ivalid_ff_1 <= 1'b0;
        ivalid_ff_2 <= 1'b0;
        ivalid_ff_3 <= 1'b0;
        ivalid_ff_4 <= 1'b0;
        ivalid_ff_5 <= 1'b0;
    end
    else begin
        ivalid_ff_0 <= ivalid;
        ivalid_ff_1 <= ivalid_ff_0;
        ivalid_ff_2 <= ivalid_ff_1;
        ivalid_ff_3 <= ivalid_ff_2;
        ivalid_ff_4 <= ivalid_ff_3;
        ivalid_ff_5 <= ivalid_ff_4;
    end
end


//---------------权重加载----------------------
always @(posedge clk or negedge rstn)begin
    if(!rstn) begin
        weight_addr <= 8'd0;
        weight_addr_ff0 <= 1'b0;
        weight_addr_ff1 <= 1'b0;
    end
    else begin
        weight_addr_ff0 <= weight_addr;
        weight_addr_ff1 <= weight_addr_ff0;
        if(weight_addr == 8'd192)
            weight_addr <= weight_addr;
        else begin
            if(weight_en)
                weight_addr <= weight_addr + 1;
            else
                weight_addr <= weight_addr;
            end
    end
end

always @(posedge clk) begin
    case(weight_addr)
        8'd0:w[0] <= weight;
        8'd1:w[1] <= weight;
        8'd2:w[2] <= weight;
        8'd3:w[3] <= weight;
        8'd4:w[4] <= weight;
        8'd5:w[5] <= weight;
        8'd6:w[6] <= weight;
        8'd7:w[7] <= weight;
        8'd8:w[8] <= weight;
        8'd9:w[9] <= weight;
        8'd10:w[10] <= weight;
        8'd11:w[11] <= weight;
        8'd12:w[12] <= weight;
        8'd13:w[13] <= weight;
        8'd14:w[14] <= weight;
        8'd15:w[15] <= weight;
        8'd16:w[16] <= weight;
        8'd17:w[17] <= weight;
        8'd18:w[18] <= weight;
        8'd19:w[19] <= weight;
        8'd20:w[20] <= weight;
        8'd21:w[21] <= weight;
        8'd22:w[22] <= weight;
        8'd23:w[23] <= weight;
        8'd24:w[24] <= weight;
        8'd25:w[25] <= weight;
        8'd26:w[26] <= weight;
        8'd27:w[27] <= weight;
        8'd28:w[28] <= weight;
        8'd29:w[29] <= weight;
        8'd30:w[30] <= weight;
        8'd31:w[31] <= weight;
        8'd32:w[32] <= weight;
        8'd33:w[33] <= weight;
        8'd34:w[34] <= weight;
        8'd35:w[35] <= weight;
        8'd36:w[36] <= weight;
        8'd37:w[37] <= weight;
        8'd38:w[38] <= weight;
        8'd39:w[39] <= weight;
        8'd40:w[40] <= weight;
        8'd41:w[41] <= weight;
        8'd42:w[42] <= weight;
        8'd43:w[43] <= weight;
        8'd44:w[44] <= weight;
        8'd45:w[45] <= weight;
        8'd46:w[46] <= weight;
        8'd47:w[47] <= weight;
        8'd48:w[48] <= weight;
        8'd49:w[49] <= weight;
        8'd50:w[50] <= weight;
        8'd51:w[51] <= weight;
        8'd52:w[52] <= weight;
        8'd53:w[53] <= weight;
        8'd54:w[54] <= weight;
        8'd55:w[55] <= weight;
        8'd56:w[56] <= weight;
        8'd57:w[57] <= weight;
        8'd58:w[58] <= weight;
        8'd59:w[59] <= weight;
        8'd60:w[60] <= weight;
        8'd61:w[61] <= weight;
        8'd62:w[62] <= weight;
        8'd63:w[63] <= weight;
        8'd64:w[64] <= weight;
        8'd65:w[65] <= weight;
        8'd66:w[66] <= weight;
        8'd67:w[67] <= weight;
        8'd68:w[68] <= weight;
        8'd69:w[69] <= weight;
        8'd70:w[70] <= weight;
        8'd71:w[71] <= weight;
        8'd72:w[72] <= weight;
        8'd73:w[73] <= weight;
        8'd74:w[74] <= weight;
        8'd75:w[75] <= weight;
        8'd76:w[76] <= weight;
        8'd77:w[77] <= weight;
        8'd78:w[78] <= weight;
        8'd79:w[79] <= weight;
        8'd80:w[80] <= weight;
        8'd81:w[81] <= weight;
        8'd82:w[82] <= weight;
        8'd83:w[83] <= weight;
        8'd84:w[84] <= weight;
        8'd85:w[85] <= weight;
        8'd86:w[86] <= weight;
        8'd87:w[87] <= weight;
        8'd88:w[88] <= weight;
        8'd89:w[89] <= weight;
        8'd90:w[90] <= weight;
        8'd91:w[91] <= weight;
        8'd92:w[92] <= weight;
        8'd93:w[93] <= weight;
        8'd94:w[94] <= weight;
        8'd95:w[95] <= weight;
        8'd96:w[96] <= weight;
        8'd97:w[97] <= weight;
        8'd98:w[98] <= weight;
        8'd99:w[99] <= weight;
        8'd100:w[100] <= weight;
        8'd101:w[101] <= weight;
        8'd102:w[102] <= weight;
        8'd103:w[103] <= weight;
        8'd104:w[104] <= weight;
        8'd105:w[105] <= weight;
        8'd106:w[106] <= weight;
        8'd107:w[107] <= weight;
        8'd108:w[108] <= weight;
        8'd109:w[109] <= weight;
        8'd110:w[110] <= weight;
        8'd111:w[111] <= weight;
        8'd112:w[112] <= weight;
        8'd113:w[113] <= weight;
        8'd114:w[114] <= weight;
        8'd115:w[115] <= weight;
        8'd116:w[116] <= weight;
        8'd117:w[117] <= weight;
        8'd118:w[118] <= weight;
        8'd119:w[119] <= weight;
        8'd120:w[120] <= weight;
        8'd121:w[121] <= weight;
        8'd122:w[122] <= weight;
        8'd123:w[123] <= weight;
        8'd124:w[124] <= weight;
        8'd125:w[125] <= weight;
        8'd126:w[126] <= weight;
        8'd127:w[127] <= weight;
        8'd128:w[128] <= weight;
        8'd129:w[129] <= weight;
        8'd130:w[130] <= weight;
        8'd131:w[131] <= weight;
        8'd132:w[132] <= weight;
        8'd133:w[133] <= weight;
        8'd134:w[134] <= weight;
        8'd135:w[135] <= weight;
        8'd136:w[136] <= weight;
        8'd137:w[137] <= weight;
        8'd138:w[138] <= weight;
        8'd139:w[139] <= weight;
        8'd140:w[140] <= weight;
        8'd141:w[141] <= weight;
        8'd142:w[142] <= weight;
        8'd143:w[143] <= weight;
        8'd144:w[144] <= weight;
        8'd145:w[145] <= weight;
        8'd146:w[146] <= weight;
        8'd147:w[147] <= weight;
        8'd148:w[148] <= weight;
        8'd149:w[149] <= weight;
        8'd150:w[150] <= weight;
        8'd151:w[151] <= weight;
        8'd152:w[152] <= weight;
        8'd153:w[153] <= weight;
        8'd154:w[154] <= weight;
        8'd155:w[155] <= weight;
        8'd156:w[156] <= weight;
        8'd157:w[157] <= weight;
        8'd158:w[158] <= weight;
        8'd159:w[159] <= weight;
        8'd160:w[160] <= weight;
        8'd161:w[161] <= weight;
        8'd162:w[162] <= weight;
        8'd163:w[163] <= weight;
        8'd164:w[164] <= weight;
        8'd165:w[165] <= weight;
        8'd166:w[166] <= weight;
        8'd167:w[167] <= weight;
        8'd168:w[168] <= weight;
        8'd169:w[169] <= weight;
        8'd170:w[170] <= weight;
        8'd171:w[171] <= weight;
        8'd172:w[172] <= weight;
        8'd173:w[173] <= weight;
        8'd174:w[174] <= weight;
        8'd175:w[175] <= weight;
        8'd176:w[176] <= weight;
        8'd177:w[177] <= weight;
        8'd178:w[178] <= weight;
        8'd179:w[179] <= weight;
        8'd180:w[180] <= weight;
        8'd181:w[181] <= weight;
        8'd182:w[182] <= weight;
        8'd183:w[183] <= weight;
        8'd184:w[184] <= weight;
        8'd185:w[185] <= weight;
        8'd186:w[186] <= weight;
        8'd187:w[187] <= weight;
        8'd188:w[188] <= weight;
        8'd189:w[189] <= weight;
        8'd190:w[190] <= weight;
        8'd191:w[191] <= weight;
        default:begin
            w[0] <= w[0];
            w[1] <= w[1];
            w[2] <= w[2];
            w[3] <= w[3];
            w[4] <= w[4];
            w[5] <= w[5];
            w[6] <= w[6];
            w[7] <= w[7];
            w[8] <= w[8];
            w[9] <= w[9];
            w[10] <= w[10];
            w[11] <= w[11];
            w[12] <= w[12];
            w[13] <= w[13];
            w[14] <= w[14];
            w[15] <= w[15];
            w[16] <= w[16];
            w[17] <= w[17];
            w[18] <= w[18];
            w[19] <= w[19];
            w[20] <= w[20];
            w[21] <= w[21];
            w[22] <= w[22];
            w[23] <= w[23];
            w[24] <= w[24];
            w[25] <= w[25];
            w[26] <= w[26];
            w[27] <= w[27];
            w[28] <= w[28];
            w[29] <= w[29];
            w[30] <= w[30];
            w[31] <= w[31];
            w[32] <= w[32];
            w[33] <= w[33];
            w[34] <= w[34];
            w[35] <= w[35];
            w[36] <= w[36];
            w[37] <= w[37];
            w[38] <= w[38];
            w[39] <= w[39];
            w[40] <= w[40];
            w[41] <= w[41];
            w[42] <= w[42];
            w[43] <= w[43];
            w[44] <= w[44];
            w[45] <= w[45];
            w[46] <= w[46];
            w[47] <= w[47];
            w[48] <= w[48];
            w[49] <= w[49];
            w[50] <= w[50];
            w[51] <= w[51];
            w[52] <= w[52];
            w[53] <= w[53];
            w[54] <= w[54];
            w[55] <= w[55];
            w[56] <= w[56];
            w[57] <= w[57];
            w[58] <= w[58];
            w[59] <= w[59];
            w[60] <= w[60];
            w[61] <= w[61];
            w[62] <= w[62];
            w[63] <= w[63];
            w[64] <= w[64];
            w[65] <= w[65];
            w[66] <= w[66];
            w[67] <= w[67];
            w[68] <= w[68];
            w[69] <= w[69];
            w[70] <= w[70];
            w[71] <= w[71];
            w[72] <= w[72];
            w[73] <= w[73];
            w[74] <= w[74];
            w[75] <= w[75];
            w[76] <= w[76];
            w[77] <= w[77];
            w[78] <= w[78];
            w[79] <= w[79];
            w[80] <= w[80];
            w[81] <= w[81];
            w[82] <= w[82];
            w[83] <= w[83];
            w[84] <= w[84];
            w[85] <= w[85];
            w[86] <= w[86];
            w[87] <= w[87];
            w[88] <= w[88];
            w[89] <= w[89];
            w[90] <= w[90];
            w[91] <= w[91];
            w[92] <= w[92];
            w[93] <= w[93];
            w[94] <= w[94];
            w[95] <= w[95];
            w[96] <= w[96];
            w[97] <= w[97];
            w[98] <= w[98];
            w[99] <= w[99];
            w[100] <= w[100];
            w[101] <= w[101];
            w[102] <= w[102];
            w[103] <= w[103];
            w[104] <= w[104];
            w[105] <= w[105];
            w[106] <= w[106];
            w[107] <= w[107];
            w[108] <= w[108];
            w[109] <= w[109];
            w[110] <= w[110];
            w[111] <= w[111];
            w[112] <= w[112];
            w[113] <= w[113];
            w[114] <= w[114];
            w[115] <= w[115];
            w[116] <= w[116];
            w[117] <= w[117];
            w[118] <= w[118];
            w[119] <= w[119];
            w[120] <= w[120];
            w[121] <= w[121];
            w[122] <= w[122];
            w[123] <= w[123];
            w[124] <= w[124];
            w[125] <= w[125];
            w[126] <= w[126];
            w[127] <= w[127];
            w[128] <= w[128];
            w[129] <= w[129];
            w[130] <= w[130];
            w[131] <= w[131];
            w[132] <= w[132];
            w[133] <= w[133];
            w[134] <= w[134];
            w[135] <= w[135];
            w[136] <= w[136];
            w[137] <= w[137];
            w[138] <= w[138];
            w[139] <= w[139];
            w[140] <= w[140];
            w[141] <= w[141];
            w[142] <= w[142];
            w[143] <= w[143];
            w[144] <= w[144];
            w[145] <= w[145];
            w[146] <= w[146];
            w[147] <= w[147];
            w[148] <= w[148];
            w[149] <= w[149];
            w[150] <= w[150];
            w[151] <= w[151];
            w[152] <= w[152];
            w[153] <= w[153];
            w[154] <= w[154];
            w[155] <= w[155];
            w[156] <= w[156];
            w[157] <= w[157];
            w[158] <= w[158];
            w[159] <= w[159];
            w[160] <= w[160];
            w[161] <= w[161];
            w[162] <= w[162];
            w[163] <= w[163];
            w[164] <= w[164];
            w[165] <= w[165];
            w[166] <= w[166];
            w[167] <= w[167];
            w[168] <= w[168];
            w[169] <= w[169];
            w[170] <= w[170];
            w[171] <= w[171];
            w[172] <= w[172];
            w[173] <= w[173];
            w[174] <= w[174];
            w[175] <= w[175];
            w[176] <= w[176];
            w[177] <= w[177];
            w[178] <= w[178];
            w[179] <= w[179];
            w[180] <= w[180];
            w[181] <= w[181];
            w[182] <= w[182];
            w[183] <= w[183];
            w[184] <= w[184];
            w[185] <= w[185];
            w[186] <= w[186];
            w[187] <= w[187];
            w[188] <= w[188];
            w[189] <= w[189];
            w[190] <= w[190];
            w[191] <= w[191];
        end
        endcase
    end

always @(posedge clk) begin
    case(cnt_fc)
        4'd0:begin
            p0 <= (w[0] == 1'b1) ? din_0 : -din_0;
			p1 <= (w[16] == 1'b1) ? din_1 : -din_1;
			p2 <= (w[32] == 1'b1) ? din_2 : -din_2;
			p3 <= (w[48] == 1'b1) ? din_3 : -din_3;
			p4 <= (w[64] == 1'b1) ? din_4 : -din_4;
			p5 <= (w[80] == 1'b1) ? din_5 : -din_5;
            p6 <= (w[96] == 1'b1) ? din_6 : -din_6;
            p7 <= (w[112] == 1'b1) ? din_7 : -din_7;
            p8 <= (w[128] == 1'b1) ? din_8 : -din_8;
            p9 <= (w[144] == 1'b1) ? din_9 : -din_9;
            p10 <= (w[160] == 1'b1) ? din_10 : -din_10;
            p11 <= (w[176] == 1'b1) ? din_11 : -din_11;
        end
        4'd1:begin
            p0 <= (w[1] == 1'b1) ? din_0 : -din_0;
            p1 <= (w[17] == 1'b1) ? din_1 : -din_1;
            p2 <= (w[33] == 1'b1) ? din_2 : -din_2;
            p3 <= (w[49] == 1'b1) ? din_3 : -din_3;
            p4 <= (w[65] == 1'b1) ? din_4 : -din_4;
            p5 <= (w[81] == 1'b1) ? din_5 : -din_5;
            p6 <= (w[97] == 1'b1) ? din_6 : -din_6;
            p7 <= (w[113] == 1'b1) ? din_7 : -din_7;
            p8 <= (w[129] == 1'b1) ? din_8 : -din_8;
            p9 <= (w[145] == 1'b1) ? din_9 : -din_9;
            p10 <= (w[161] == 1'b1) ? din_10 : -din_10;
            p11 <= (w[177] == 1'b1) ? din_11 : -din_11;
        end
        4'd2:begin
            p0 <= (w[2] == 1'b1) ? din_0 : -din_0;
            p1 <= (w[18] == 1'b1) ? din_1 : -din_1;
            p2 <= (w[34] == 1'b1) ? din_2 : -din_2;
            p3 <= (w[50] == 1'b1) ? din_3 : -din_3;
            p4 <= (w[66] == 1'b1) ? din_4 : -din_4;
            p5 <= (w[82] == 1'b1) ? din_5 : -din_5;
            p6 <= (w[98] == 1'b1) ? din_6 : -din_6;
            p7 <= (w[114] == 1'b1) ? din_7 : -din_7;
            p8 <= (w[130] == 1'b1) ? din_8 : -din_8;
            p9 <= (w[146] == 1'b1) ? din_9 : -din_9;
            p10 <= (w[162] == 1'b1) ? din_10 : -din_10;
            p11 <= (w[178] == 1'b1) ? din_11 : -din_11;
        end
        4'd3:begin
            p0 <= (w[3] == 1'b1) ? din_0 : -din_0;
            p1 <= (w[19] == 1'b1) ? din_1 : -din_1;
            p2 <= (w[35] == 1'b1) ? din_2 : -din_2;
            p3 <= (w[51] == 1'b1) ? din_3 : -din_3;
            p4 <= (w[67] == 1'b1) ? din_4 : -din_4;
            p5 <= (w[83] == 1'b1) ? din_5 : -din_5;
            p6 <= (w[99] == 1'b1) ? din_6 : -din_6;
            p7 <= (w[115] == 1'b1) ? din_7 : -din_7;
            p8 <= (w[131] == 1'b1) ? din_8 : -din_8;
            p9 <= (w[147] == 1'b1) ? din_9 : -din_9;
            p10 <= (w[163] == 1'b1) ? din_10 : -din_10;
            p11 <= (w[179] == 1'b1) ? din_11 : -din_11;
        end
        4'd4:begin
            p0 <= (w[4] == 1'b1) ? din_0 : -din_0;
            p1 <= (w[20] == 1'b1) ? din_1 : -din_1;
            p2 <= (w[36] == 1'b1) ? din_2 : -din_2;
            p3 <= (w[52] == 1'b1) ? din_3 : -din_3;
            p4 <= (w[68] == 1'b1) ? din_4 : -din_4;
            p5 <= (w[84] == 1'b1) ? din_5 : -din_5;
            p6 <= (w[100] == 1'b1) ? din_6 : -din_6;
            p7 <= (w[116] == 1'b1) ? din_7 : -din_7;
            p8 <= (w[132] == 1'b1) ? din_8 : -din_8;
            p9 <= (w[148] == 1'b1) ? din_9 : -din_9;
            p10 <= (w[164] == 1'b1) ? din_10 : -din_10;
            p11 <= (w[180] == 1'b1) ? din_11 : -din_11;
        end
        4'd5:begin
            p0 <= (w[5] == 1'b1) ? din_0 : -din_0;
            p1 <= (w[21] == 1'b1) ? din_1 : -din_1;
            p2 <= (w[37] == 1'b1) ? din_2 : -din_2;
            p3 <= (w[53] == 1'b1) ? din_3 : -din_3;
            p4 <= (w[69] == 1'b1) ? din_4 : -din_4;
            p5 <= (w[85] == 1'b1) ? din_5 : -din_5;
            p6 <= (w[101] == 1'b1) ? din_6 : -din_6;
            p7 <= (w[117] == 1'b1) ? din_7 : -din_7;
            p8 <= (w[133] == 1'b1) ? din_8 : -din_8;
            p9 <= (w[149] == 1'b1) ? din_9 : -din_9;
            p10 <= (w[165] == 1'b1) ? din_10 : -din_10;
            p11 <= (w[181] == 1'b1) ? din_11 : -din_11;
        end
        4'd6:begin
            p0 <= (w[6] == 1'b1) ? din_0 : -din_0;
            p1 <= (w[22] == 1'b1) ? din_1 : -din_1;
            p2 <= (w[38] == 1'b1) ? din_2 : -din_2;
            p3 <= (w[54] == 1'b1) ? din_3 : -din_3;
            p4 <= (w[70] == 1'b1) ? din_4 : -din_4;
            p5 <= (w[86] == 1'b1) ? din_5 : -din_5;
            p6 <= (w[102] == 1'b1) ? din_6 : -din_6;
            p7 <= (w[118] == 1'b1) ? din_7 : -din_7;
            p8 <= (w[134] == 1'b1) ? din_8 : -din_8;
            p9 <= (w[150] == 1'b1) ? din_9 : -din_9;
            p10 <= (w[166] == 1'b1) ? din_10 : -din_10;
            p11 <= (w[182] == 1'b1) ? din_11 : -din_11;
        end
        4'd7:begin
            p0 <= (w[7] == 1'b1) ? din_0 : -din_0;
            p1 <= (w[23] == 1'b1) ? din_1 : -din_1;
            p2 <= (w[39] == 1'b1) ? din_2 : -din_2;
            p3 <= (w[55] == 1'b1) ? din_3 : -din_3;
            p4 <= (w[71] == 1'b1) ? din_4 : -din_4;
            p5 <= (w[87] == 1'b1) ? din_5 : -din_5;
            p6 <= (w[103] == 1'b1) ? din_6 : -din_6;
            p7 <= (w[119] == 1'b1) ? din_7 : -din_7;
            p8 <= (w[135] == 1'b1) ? din_8 : -din_8;
            p9 <= (w[151] == 1'b1) ? din_9 : -din_9;
            p10 <= (w[167] == 1'b1) ? din_10 : -din_10;
            p11 <= (w[183] == 1'b1) ? din_11 : -din_11;
        end
        4'd8:begin
            p0 <= (w[8] == 1'b1) ? din_0 : -din_0;
            p1 <= (w[24] == 1'b1) ? din_1 : -din_1;
            p2 <= (w[40] == 1'b1) ? din_2 : -din_2;
            p3 <= (w[56] == 1'b1) ? din_3 : -din_3;
            p4 <= (w[72] == 1'b1) ? din_4 : -din_4;
            p5 <= (w[88] == 1'b1) ? din_5 : -din_5;
            p6 <= (w[104] == 1'b1) ? din_6 : -din_6;
            p7 <= (w[120] == 1'b1) ? din_7 : -din_7;
            p8 <= (w[136] == 1'b1) ? din_8 : -din_8;
            p9 <= (w[152] == 1'b1) ? din_9 : -din_9;
            p10 <= (w[168] == 1'b1) ? din_10 : -din_10;
            p11 <= (w[184] == 1'b1) ? din_11 : -din_11;
        end
        4'd9:begin
            p0 <= (w[9] == 1'b1) ? din_0 : -din_0;
            p1 <= (w[25] == 1'b1) ? din_1 : -din_1;
            p2 <= (w[41] == 1'b1) ? din_2 : -din_2;
            p3 <= (w[57] == 1'b1) ? din_3 : -din_3;
            p4 <= (w[73] == 1'b1) ? din_4 : -din_4;
            p5 <= (w[89] == 1'b1) ? din_5 : -din_5;
            p6 <= (w[105] == 1'b1) ? din_6 : -din_6;
            p7 <= (w[121] == 1'b1) ? din_7 : -din_7;
            p8 <= (w[137] == 1'b1) ? din_8 : -din_8;
            p9 <= (w[153] == 1'b1) ? din_9 : -din_9;
            p10 <= (w[169] == 1'b1) ? din_10 : -din_10;
            p11 <= (w[185] == 1'b1) ? din_11 : -din_11;
        end
        4'd10:begin
            p0 <= (w[10] == 1'b1) ? din_0 : -din_0;
            p1 <= (w[26] == 1'b1) ? din_1 : -din_1;
            p2 <= (w[42] == 1'b1) ? din_2 : -din_2;
            p3 <= (w[58] == 1'b1) ? din_3 : -din_3;
            p4 <= (w[74] == 1'b1) ? din_4 : -din_4;
            p5 <= (w[90] == 1'b1) ? din_5 : -din_5;
            p6 <= (w[106] == 1'b1) ? din_6 : -din_6;
            p7 <= (w[122] == 1'b1) ? din_7 : -din_7;
            p8 <= (w[138] == 1'b1) ? din_8 : -din_8;
            p9 <= (w[154] == 1'b1) ? din_9 : -din_9;
            p10 <= (w[170] == 1'b1) ? din_10 : -din_10;
            p11 <= (w[186] == 1'b1) ? din_11 : -din_11;
        end
        4'd11:begin
            p0 <= (w[11] == 1'b1) ? din_0 : -din_0;
            p1 <= (w[27] == 1'b1) ? din_1 : -din_1;
            p2 <= (w[43] == 1'b1) ? din_2 : -din_2;
            p3 <= (w[59] == 1'b1) ? din_3 : -din_3;
            p4 <= (w[75] == 1'b1) ? din_4 : -din_4;
            p5 <= (w[91] == 1'b1) ? din_5 : -din_5;
            p6 <= (w[107] == 1'b1) ? din_6 : -din_6;
            p7 <= (w[123] == 1'b1) ? din_7 : -din_7;
            p8 <= (w[139] == 1'b1) ? din_8 : -din_8;
            p9 <= (w[155] == 1'b1) ? din_9 : -din_9;
            p10 <= (w[171] == 1'b1) ? din_10 : -din_10;
            p11 <= (w[187] == 1'b1) ? din_11 : -din_11;
        end
        4'd12:begin
            p0 <= (w[12] == 1'b1) ? din_0 : -din_0;
            p1 <= (w[28] == 1'b1) ? din_1 : -din_1;
            p2 <= (w[44] == 1'b1) ? din_2 : -din_2;
            p3 <= (w[60] == 1'b1) ? din_3 : -din_3;
            p4 <= (w[76] == 1'b1) ? din_4 : -din_4;
            p5 <= (w[92] == 1'b1) ? din_5 : -din_5;
            p6 <= (w[108] == 1'b1) ? din_6 : -din_6;
            p7 <= (w[124] == 1'b1) ? din_7 : -din_7;
            p8 <= (w[140] == 1'b1) ? din_8 : -din_8;
            p9 <= (w[156] == 1'b1) ? din_9 : -din_9;
            p10 <= (w[172] == 1'b1) ? din_10 : -din_10;
            p11 <= (w[188] == 1'b1) ? din_11 : -din_11;
        end
        4'd13:begin
            p0 <= (w[13] == 1'b1) ? din_0 : -din_0;
            p1 <= (w[29] == 1'b1) ? din_1 : -din_1;
            p2 <= (w[45] == 1'b1) ? din_2 : -din_2;
            p3 <= (w[61] == 1'b1) ? din_3 : -din_3;
            p4 <= (w[77] == 1'b1) ? din_4 : -din_4;
            p5 <= (w[93] == 1'b1) ? din_5 : -din_5;
            p6 <= (w[109] == 1'b1) ? din_6 : -din_6;
            p7 <= (w[125] == 1'b1) ? din_7 : -din_7;
            p8 <= (w[141] == 1'b1) ? din_8 : -din_8;
            p9 <= (w[157] == 1'b1) ? din_9 : -din_9;
            p10 <= (w[173] == 1'b1) ? din_10 : -din_10;
            p11 <= (w[189] == 1'b1) ? din_11 : -din_11;
        end
        4'd14:begin
            p0 <= (w[14] == 1'b1) ? din_0 : -din_0;
            p1 <= (w[30] == 1'b1) ? din_1 : -din_1;
            p2 <= (w[46] == 1'b1) ? din_2 : -din_2;
            p3 <= (w[62] == 1'b1) ? din_3 : -din_3;
            p4 <= (w[78] == 1'b1) ? din_4 : -din_4;
            p5 <= (w[94] == 1'b1) ? din_5 : -din_5;
            p6 <= (w[110] == 1'b1) ? din_6 : -din_6;
            p7 <= (w[126] == 1'b1) ? din_7 : -din_7;
            p8 <= (w[142] == 1'b1) ? din_8 : -din_8;
            p9 <= (w[158] == 1'b1) ? din_9 : -din_9;
            p10 <= (w[174] == 1'b1) ? din_10 : -din_10;
            p11 <= (w[190] == 1'b1) ? din_11 : -din_11;
        end
        4'd15:begin
            p0 <= (w[15] == 1'b1) ? din_0 : -din_0;
            p1 <= (w[31] == 1'b1) ? din_1 : -din_1;
            p2 <= (w[47] == 1'b1) ? din_2 : -din_2;
            p3 <= (w[63] == 1'b1) ? din_3 : -din_3;
            p4 <= (w[79] == 1'b1) ? din_4 : -din_4;
            p5 <= (w[95] == 1'b1) ? din_5 : -din_5;
            p6 <= (w[111] == 1'b1) ? din_6 : -din_6;
            p7 <= (w[127] == 1'b1) ? din_7 : -din_7;
            p8 <= (w[143] == 1'b1) ? din_8 : -din_8;
            p9 <= (w[159] == 1'b1) ? din_9 : -din_9;
            p10 <= (w[175] == 1'b1) ? din_10 : -din_10;
            p11 <= (w[191] == 1'b1) ? din_11 : -din_11;
        end
        default:begin
            p0 <= 32'd0;
            p1 <= 32'd0;
            p2 <= 32'd0;
            p3 <= 32'd0;
            p4 <= 32'd0;
            p5 <= 32'd0;
            p6 <= 32'd0;
            p7 <= 32'd0;
            p8 <= 32'd0;
            p9 <= 32'd0;
            p10 <= 32'd0;
            p11 <= 32'd0;
        end
    endcase
end
//第一级
always @(posedge clk) begin
    sum00 <= p0 + p1;
    sum01 <= p2 + p3;
    sum02 <= p4 + p5;
    sum03 <= p6 + p7;
    sum04 <= p8 + p9;
    sum05 <= p10 + p11;
end
//第二级
always @(posedge clk) begin
    sum10 <= sum00 + sum01;
    sum11 <= sum02 + sum03;
    sum12 <= sum04 + sum05;
end
//第三级
always @(posedge clk) begin
    sum20 <= sum10 + sum11;
    sum21 <= sum12;
end
//输出
always @(posedge clk) begin
    sum <= sum20 + sum21;
end

always @(posedge clk or negedge rstn) begin
    if(!rstn)
        dout_r <= 32'd0;
    else begin
        if(ivalid_ff_4)
            dout_r <= sum + dout_r;
        else
            dout_r <= dout_r;
        end
end

assign dout = dout_r;
assign ovalid = cnt_fc == 5'd21 ? 1'b1 : 1'b0;
endmodule