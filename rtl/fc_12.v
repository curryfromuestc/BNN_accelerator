module fc_12(
    input wire clk,
    input wire rstn,
    input wire ivalid,
    input din_0,
    input din_1,
    input din_2,
    input din_3,
    input din_4,
    input din_5,
    input din_6,
    input din_7,
    input din_8,
    input din_9,
    input din_10,
    input din_11,
    input wire weight,
    input wire weight_en,
    output wire ovalid,
    output wire signed [15:0] dout
);

reg [10:0] weight_addr;
reg w[0:143];
reg csign;
reg osign;
reg [8:0] cnt_fc,cnt_w;

reg p0, p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11;
reg signed [4:0]sum00,sum01,sum02, sum03, sum04, sum05;
reg signed [6:0] sum10,sum11,sum12;
reg signed [7:0] sum20,sum21;
reg signed [8:0] sum;
reg signed [15:0] dout_r;


reg ivalid_ff_0,ivalid_ff_1,ivalid_ff_2,ivalid_ff_3,ivalid_ff_4,ivalid_ff_5;

always @(posedge clk or negedge rstn)begin
    if(!rstn) begin
        cnt_fc <= 9'd0;
    end
    else begin
        if(cnt_fc == 9'd144)
            cnt_fc <= cnt_fc;
        else begin
            if(ivalid)
                cnt_fc <= cnt_fc + 1;
            else
                cnt_fc <= cnt_fc;
            end
    end
end
// always @(posedge clk or negedge rstn) begin
//     if (rstn == 1'b0)begin
//         cnt_fc <= 'b0;
//     end
//     else if(cnt_fc == 9'd144)begin
//         cnt_fc <= 'b0;
//     end
//     else if(ivalid == 1'b1) begin
//         cnt_fc <= cnt_fc + 1;
//     end
// end
always @(posedge clk or negedge rstn)begin
    if(!rstn) begin
        cnt_w <= 9'd0;
    end
    else begin
        if(cnt_w == 9'd11)
            cnt_w <= 9'd0;
        else begin
            if(ivalid)
                cnt_w <= cnt_w + 1;
            else
                cnt_w <= cnt_w;
            end
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

// reg[4:0] ivalid_dly;
// always @() begin
//     else ivalid_dly <= {ivalid_dly[3:0],ivalid};
// end


//---------------Ȩ ؼ   ----------------------
always @(posedge clk or negedge rstn)begin
    if(!rstn) begin
        weight_addr <= 11'd0;
    end
    else begin
        if(weight_addr == 11'd143)
            weight_addr <= 11'd0;
        else begin
            if(weight_en)
                weight_addr <= weight_addr + 11'd1;
            else
                weight_addr <= weight_addr;
            end
    end
end

always @(posedge clk) begin
    if(weight_en) begin
        case(weight_addr)
            11'd0:w[0] <=weight;
            11'd1:w[1] <=weight;
            11'd2:w[2] <=weight;
            11'd3:w[3] <=weight;
            11'd4:w[4] <=weight;
            11'd5:w[5] <=weight;
            11'd6:w[6] <=weight;
            11'd7:w[7] <=weight;
            11'd8:w[8] <=weight;
            11'd9:w[9] <=weight;
            11'd10:w[10] <=weight;
            11'd11:w[11] <=weight;
            11'd12:w[12] <= weight;
            11'd13:w[13] <= weight;
            11'd14:w[14] <= weight;
            11'd15:w[15] <= weight;
            11'd16:w[16] <= weight;
            11'd17:w[17] <= weight;
            11'd18:w[18] <= weight;
            11'd19:w[19] <= weight;
            11'd20:w[20] <= weight;
            11'd21:w[21] <= weight;
            11'd22:w[22] <= weight;
            11'd23:w[23] <= weight;
            11'd24:w[24] <= weight;
            11'd25:w[25] <= weight;
            11'd26:w[26] <= weight;
            11'd27:w[27] <= weight;
            11'd28:w[28] <= weight;
            11'd29:w[29] <= weight;
            11'd30:w[30] <= weight;
            11'd31:w[31] <= weight;
            11'd32:w[32] <= weight;
            11'd33:w[33] <= weight;
            11'd34:w[34] <= weight;
            11'd35:w[35] <= weight;
            11'd36:w[36] <= weight;
            11'd37:w[37] <= weight;
            11'd38:w[38] <= weight;
            11'd39:w[39] <= weight;
            11'd40:w[40] <= weight;
            11'd41:w[41] <= weight;
            11'd42:w[42] <= weight;
            11'd43:w[43] <= weight;
            11'd44:w[44] <= weight;
            11'd45:w[45] <= weight;
            11'd46:w[46] <= weight;
            11'd47:w[47] <= weight;
            11'd48:w[48] <= weight;
            11'd49:w[49] <= weight;
            11'd50:w[50] <= weight;
            11'd51:w[51] <= weight;
            11'd52:w[52] <= weight;
            11'd53:w[53] <= weight;
            11'd54:w[54] <= weight;
            11'd55:w[55] <= weight;
            11'd56:w[56] <= weight;
            11'd57:w[57] <= weight;
            11'd58:w[58] <= weight;
            11'd59:w[59] <= weight;
            11'd60:w[60] <= weight;
            11'd61:w[61] <= weight;
            11'd62:w[62] <= weight;
            11'd63:w[63] <= weight;
            11'd64:w[64] <= weight;
            11'd65:w[65] <= weight;
            11'd66:w[66] <= weight;
            11'd67:w[67] <= weight;
            11'd68:w[68] <= weight;
            11'd69:w[69] <= weight;
            11'd70:w[70] <= weight;
            11'd71:w[71] <= weight;
            11'd72:w[72] <= weight;
            11'd73:w[73] <= weight;
            11'd74:w[74] <= weight;
            11'd75:w[75] <= weight;
            11'd76:w[76] <= weight;
            11'd77:w[77] <= weight;
            11'd78:w[78] <= weight;
            11'd79:w[79] <= weight;
            11'd80:w[80] <= weight;
            11'd81:w[81] <= weight;
            11'd82:w[82] <= weight;
            11'd83:w[83] <= weight;
            11'd84:w[84] <= weight;
            11'd85:w[85] <= weight;
            11'd86:w[86] <= weight;
            11'd87:w[87] <= weight;
            11'd88:w[88] <= weight;
            11'd89:w[89] <= weight;
            11'd90:w[90] <= weight;
            11'd91:w[91] <= weight;
            11'd92:w[92] <= weight;
            11'd93:w[93] <= weight;
            11'd94:w[94] <= weight;
            11'd95:w[95] <= weight;
            11'd96:w[96] <= weight;
            11'd97:w[97] <= weight;
            11'd98:w[98] <= weight;
            11'd99:w[99] <= weight;
            11'd100:w[100] <= weight;
            11'd101:w[101] <= weight;
            11'd102:w[102] <= weight;
            11'd103:w[103] <= weight;
            11'd104:w[104] <= weight;
            11'd105:w[105] <= weight;
            11'd106:w[106] <= weight;
            11'd107:w[107] <= weight;
            11'd108:w[108] <= weight;
            11'd109:w[109] <= weight;
            11'd110:w[110] <= weight;
            11'd111:w[111] <= weight;
            11'd112:w[112] <= weight;
            11'd113:w[113] <= weight;
            11'd114:w[114] <= weight;
            11'd115:w[115] <= weight;
            11'd116:w[116] <= weight;
            11'd117:w[117] <= weight;
            11'd118:w[118] <= weight;
            11'd119:w[119] <= weight;
            11'd120:w[120] <= weight;
            11'd121:w[121] <= weight;
            11'd122:w[122] <= weight;
            11'd123:w[123] <= weight;
            11'd124:w[124] <= weight;
            11'd125:w[125] <= weight;
            11'd126:w[126] <= weight;
            11'd127:w[127] <= weight;
            11'd128:w[128] <= weight;
            11'd129:w[129] <= weight;
            11'd130:w[130] <= weight;
            11'd131:w[131] <= weight;
            11'd132:w[132] <= weight;
            11'd133:w[133] <= weight;
            11'd134:w[134] <= weight;
            11'd135:w[135] <= weight;
            11'd136:w[136] <= weight;
            11'd137:w[137] <= weight;
            11'd138:w[138] <= weight;
            11'd139:w[139] <= weight;
            11'd140:w[140] <= weight;
            11'd141:w[141] <= weight;
            11'd142:w[142] <= weight;
            default:w[143] <=weight;
        endcase
    end
end
//             default :begin
//                 w[0] <= w[0];
//                 w[1] <= w[1];
//                 w[2] <= w[2];
//                 w[3] <= w[3];
//                 w[4] <= w[4];
//                 w[5] <= w[5];
//                 w[6] <= w[6];
//                 w[7] <= w[7];
//                 w[8] <= w[8];
//                 w[9] <= w[9];
//                 w[10] <= w[10];
//                 w[11] <= w[11];
//             end
                
//         endcase
//     end
//     else begin
//             w[0] <= w[0];
//             w[1] <= w[1];
//             w[2] <= w[2];
//             w[3] <= w[3];
//             w[4] <= w[4];
//             w[5] <= w[5];
//             w[6] <= w[6];
//             w[7] <= w[7];
//             w[8] <= w[8];
//             w[9] <= w[9];
//             w[10] <= w[10];
//             w[11] <= w[11];
//     end
// end

//-----------------    ----------------------
always @(posedge clk) begin
    if (ivalid)begin
        csign <= 1'd1;
        case(cnt_w)
            9'd0:begin
                p0 <= (w[0] ~^ din_0);
                p1 <= (w[1] ~^ din_1);
                p2 <= (w[2] ~^ din_2);
                p3 <= (w[3] ~^ din_3);
                p4 <= (w[4] ~^ din_4);
                p5 <= (w[5] ~^ din_5);
                p6 <= (w[6] ~^ din_6);
                p7 <= (w[7] ~^ din_7);
                p8 <= (w[8] ~^ din_8);
                p9 <= (w[9] ~^ din_9);
                p10 <= (w[10] ~^ din_10);
                p11 <= (w[11] ~^ din_11);
            end
            9'd1:begin
                p0 <= (w[12] ~^ din_0);
                p1 <= (w[13] ~^ din_1);
                p2 <= (w[14] ~^ din_2);
                p3 <= (w[15] ~^ din_3);
                p4 <= (w[16] ~^ din_4);
                p5 <= (w[17] ~^ din_5);
                p6 <= (w[18] ~^ din_6);
                p7 <= (w[19] ~^ din_7);
                p8 <= (w[20] ~^ din_8);
                p9 <= (w[21] ~^ din_9);
                p10 <= (w[22] ~^ din_10);
                p11 <= (w[23] ~^ din_11);
            end
            9'd2:begin
                p0 <= (w[24] ~^ din_0);
                p1 <= (w[25] ~^ din_1);
                p2 <= (w[26] ~^ din_2);
                p3 <= (w[27] ~^ din_3);
                p4 <= (w[28] ~^ din_4);
                p5 <= (w[29] ~^ din_5);
                p6 <= (w[30] ~^ din_6);
                p7 <= (w[31] ~^ din_7);
                p8 <= (w[32] ~^ din_8);
                p9 <= (w[33] ~^ din_9);
                p10 <= (w[34] ~^ din_10);
                p11 <= (w[35] ~^ din_11);
            end
            9'd3:begin
                p0 <= (w[36] ~^ din_0);
                p1 <= (w[37] ~^ din_1);
                p2 <= (w[38] ~^ din_2);
                p3 <= (w[39] ~^ din_3);
                p4 <= (w[40] ~^ din_4);
                p5 <= (w[41] ~^ din_5);
                p6 <= (w[42] ~^ din_6);
                p7 <= (w[43] ~^ din_7);
                p8 <= (w[44] ~^ din_8);
                p9 <= (w[45] ~^ din_9);
                p10 <= (w[46] ~^ din_10);
                p11 <= (w[47] ~^ din_11);
            end
            9'd4:begin
                p0 <= (w[48] ~^ din_0);
                p1 <= (w[49] ~^ din_1);
                p2 <= (w[50] ~^ din_2);
                p3 <= (w[51] ~^ din_3);
                p4 <= (w[52] ~^ din_4);
                p5 <= (w[53] ~^ din_5);
                p6 <= (w[54] ~^ din_6);
                p7 <= (w[55] ~^ din_7);
                p8 <= (w[56] ~^ din_8);
                p9 <= (w[57] ~^ din_9);
                p10 <= (w[58] ~^ din_10);
                p11 <= (w[59] ~^ din_11);
            end
            9'd5:begin
                p0 <= (w[60] ~^ din_0);
                p1 <= (w[61] ~^ din_1);
                p2 <= (w[62] ~^ din_2);
                p3 <= (w[63] ~^ din_3);
                p4 <= (w[64] ~^ din_4);
                p5 <= (w[65] ~^ din_5);
                p6 <= (w[66] ~^ din_6);
                p7 <= (w[67] ~^ din_7);
                p8 <= (w[68] ~^ din_8);
                p9 <= (w[69] ~^ din_9);
                p10 <= (w[70] ~^ din_10);
                p11 <= (w[71] ~^ din_11);
            end
            9'd6:begin
                p0 <= (w[72] ~^ din_0);
                p1 <= (w[73] ~^ din_1);
                p2 <= (w[74] ~^ din_2);
                p3 <= (w[75] ~^ din_3);
                p4 <= (w[76] ~^ din_4);
                p5 <= (w[77] ~^ din_5);
                p6 <= (w[78] ~^ din_6);
                p7 <= (w[79] ~^ din_7);
                p8 <= (w[80] ~^ din_8);
                p9 <= (w[81] ~^ din_9);
                p10 <= (w[82] ~^ din_10);
                p11 <= (w[83] ~^ din_11);
            end
            9'd7:begin
                p0 <= (w[84] ~^ din_0);
                p1 <= (w[85] ~^ din_1);
                p2 <= (w[86] ~^ din_2);
                p3 <= (w[87] ~^ din_3);
                p4 <= (w[88] ~^ din_4);
                p5 <= (w[89] ~^ din_5);
                p6 <= (w[90] ~^ din_6);
                p7 <= (w[91] ~^ din_7);
                p8 <= (w[92] ~^ din_8);
                p9 <= (w[93] ~^ din_9);
                p10 <= (w[94] ~^ din_10);
                p11 <= (w[95] ~^ din_11);
            end
            9'd8:begin
                p0 <= (w[96] ~^ din_0);
                p1 <= (w[97] ~^ din_1);
                p2 <= (w[98] ~^ din_2);
                p3 <= (w[99] ~^ din_3);
                p4 <= (w[100] ~^ din_4);
                p5 <= (w[101] ~^ din_5);
                p6 <= (w[102] ~^ din_6);
                p7 <= (w[103] ~^ din_7);
                p8 <= (w[104] ~^ din_8);
                p9 <= (w[105] ~^ din_9);
                p10 <= (w[106] ~^ din_10);
                p11 <= (w[107] ~^ din_11);
            end
            9'd9:begin
                p0 <= (w[108] ~^ din_0);
                p1 <= (w[109] ~^ din_1);
                p2 <= (w[110] ~^ din_2);
                p3 <= (w[111] ~^ din_3);
                p4 <= (w[112] ~^ din_4);
                p5 <= (w[113] ~^ din_5);
                p6 <= (w[114] ~^ din_6);
                p7 <= (w[115] ~^ din_7);
                p8 <= (w[116] ~^ din_8);
                p9 <= (w[117] ~^ din_9);
                p10 <= (w[118] ~^ din_10);
                p11 <= (w[119] ~^ din_11);
            end
            9'd10:begin
                p0 <= (w[120] ~^ din_0);
                p1 <= (w[121] ~^ din_1);
                p2 <= (w[122] ~^ din_2);
                p3 <= (w[123] ~^ din_3);
                p4 <= (w[124] ~^ din_4);
                p5 <= (w[125] ~^ din_5);
                p6 <= (w[126] ~^ din_6);
                p7 <= (w[127] ~^ din_7);
                p8 <= (w[128] ~^ din_8);
                p9 <= (w[129] ~^ din_9);
                p10 <= (w[130] ~^ din_10);
                p11 <= (w[131] ~^ din_11);
            end
            default:begin
                p0 <= (w[132] ~^ din_0);
                p1 <= (w[133] ~^ din_1);
                p2 <= (w[134] ~^ din_2);
                p3 <= (w[135] ~^ din_3);
                p4 <= (w[136] ~^ din_4);
                p5 <= (w[137] ~^ din_5);
                p6 <= (w[138] ~^ din_6);
                p7 <= (w[139] ~^ din_7);
                p8 <= (w[140] ~^ din_8);
                p9 <= (w[141] ~^ din_9);
                p10 <= (w[142] ~^ din_10);
                p11 <= (w[143] ~^ din_11);
            end
        endcase
        
    end
    else begin
        csign <= 0;
        p0 <= p0;
        p1 <= p1;
        p2 <= p2;
        p3 <= p3;
        p4 <= p4;
        p5 <= p5;
        p6 <= p6;
        p7 <= p7;
        p8 <= p8;
        p9 <= p9;
        p10 <= p10;
        p11 <= p11;
    end
end
//  һ  
always @(posedge clk) begin
    if (csign)begin
        if((p0 == 1'b1)&&(p1 == 1'b1))
            sum00 <= 5'sd2;
        else if((p0 == 1'b0)&&(p1 == 1'b0))
            sum00 <= -5'sd2;
        else
            sum00 <= 5'sd0;
        if((p2 == 1'b1)&&(p3 == 1'b1))
            sum01 <= 5'sd2;
        else if((p2 == 1'b0)&&(p3 == 1'b0))
            sum01 <= -5'sd2;
        else
            sum01 <= 5'sd0;
        if((p4 == 1'b1)&&(p5 == 1'b1))
            sum02 <= 5'sd2;
        else if((p4 == 1'b0)&&(p5 == 1'b0))
            sum02 <= -5'sd2;
        else
            sum02 <= 5'sd0;
        if((p6 == 1'b1)&&(p7 == 1'b1))
            sum03 <= 5'sd2;
        else if((p6 == 1'b0)&&(p7 == 1'b0))
            sum03 <= -5'sd2;
        else
            sum03 <= 5'sd0;
        if((p8 == 1'b1)&&(p9 == 1'b1))
            sum04 <= 5'sd2;
        else if((p8 == 1'b0)&&(p9 == 1'b0))
            sum04 <= -5'sd2;
        else
            sum04 <= 5'sd0;
        if((p10 == 1'b1)&&(p11 == 1'b1))
            sum05 <= 5'sd2;
        else if((p10 == 1'b0)&&(p11 == 1'b0))
            sum05 <= -5'sd2;
        else
            sum05 <= 5'sd0;
    end
    else begin
        sum00 <= 5'sd0; 
        sum01 <= 5'sd0;
        sum02 <= 5'sd0;
        sum03 <= 5'sd0;
        sum04 <= 5'sd0;
        sum05 <= 5'sd0;  
        end
             
end
// ڶ   
always @(posedge clk) begin
    if(ivalid_ff_1)begin
        sum10 <= sum00 + sum01;
        sum11 <= sum02 + sum03;
        sum12 <= sum04 + sum05;
    end
    else begin
        sum10 <= 0;
        sum11 <= 0;
        sum12 <= 0;
    end
end
//      
always @(posedge clk) begin
    if(ivalid_ff_2)begin
        sum20 <= sum10 + sum11;
        sum21 <= sum12;
    end
    else begin
        sum20 <= 0;
        sum21 <= 0;
    end
end
//   
always @(posedge clk) begin
    if(ivalid_ff_3)begin
        sum <= sum20 + sum21;
    end
    else 
        sum <= 0;
end

always @(posedge clk or negedge rstn) begin
    if(!rstn) begin
        dout_r <= 13'd0;
    end
    else begin
        if(ivalid_ff_4)begin
            dout_r <= sum + dout_r;
        end
        else begin
            dout_r <= dout_r;
        end
    end
end

always @(posedge clk or negedge rstn) begin
    if(!rstn) begin
        osign <= 1'd0;
    end
    else begin
        if(!ivalid_ff_4)begin
            if (cnt_fc==9'd144)
                osign <= 1'd1;
            else
                osign <= 1'd0;
        end
        else begin
            osign <= osign;
        end
    end
end

assign dout = dout_r;
assign ovalid = osign;
endmodule