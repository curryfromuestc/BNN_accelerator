module conv 
#(
   parameter K = 5,
//   parameter Ni = 28, //！ 28 for the first layer, 12 for the second layer
//   parameter N1 = 12,
   parameter S = 1
)
(
    input wire clk,
    input wire rstn,
    input wire start,//！启动信号，注意跟滑窗模块的启动信号时间不一样
    input wire weight_en,//！ 权重有效信号
    input weight,//！ 以比特权重
    input [79:0] taps,//！ 滑窗模块输入
    input state,//！选择信号，为第一个卷积层或者是第二个卷积层
    output signed [15:0] dout,//！ 卷积输出
    output ovalid,//！ 输出有效信号
    output done//！ 卷积运算完成信号
);
//------------------------变量定义----------------------------
wire [7:0] Ni;
reg [7:0] weight_addr = 8'd0;
reg [15:0] wt_data;

reg [19:0] cnt1;//! 用于计数，工作时钟
reg [9:0] cnt2;//！ 用于同步滑窗模块以及卷积模块

reg sum_valid;
reg sum_valid_ff;
reg k00, k01, k02, k03, k04,
    k10, k11, k12, k13, k14,
    k20, k21, k22, k23, k24,
    k30, k15, k32, k33, k34,
    k40, k41, k42, k43, k44;//! 25个卷积核的权重，全是1bit
wire signed [15:0] m04,m14,m24,m34,m44;
reg signed [15:0] m00,m01,m02,m03,
    m10,m11,m12,m13,
    m20,m21,m22,m23,
    m30,m15,m32,m33,
    m40,m41,m42,m43;//! 缓存输入数据与权重矩阵重叠部分
reg signed [15:0] p00,p01,p02,p03,p04,
    p10,p11,p12,p13,p14,
    p20,p21,p22,p23,p24,
    p30,p15,p32,p33,p34,
    p40,p41,p42,p43,p44;//! 相乘的结果，流水线第一级
reg signed [15:0] sum000,sum001,sum002,sum003,sum004,
    sum010,sum011,sum012,sum013,sum014,
    sum020,sum021,sum022,sum023,sum024;//！ 流水线第二级
reg signed [15:0] sum100,sum101,sum102,sum103,sum104,
    sum110,sum111,sum112,sum113,sum114;//！ 流水线第三级
reg signed [15:0] sum200,sum201,sum202,sum203,sum204;//！ 流水线第四级
reg signed [15:0] sum30,sum21,sum32;//！ 流水线第五级
reg signed [15:0] sum40,sum41;//！ 流水线第六级


assign Ni = (state)?12:28;

//----------------------------对输入矩阵进行赋值----------------------------
assign m04 = taps[79:64];
assign m14 = taps[63:48];
assign m24 = taps[47:32];
assign m34 = taps[31:16];
assign m44 = taps[15:0];

always @(posedge clk) begin
    {m00,m01,m02,m03} <= {m01,m02,m03,m04};
    {m10,m11,m12,m13} <= {m11,m12,m13,m14};
    {m20,m21,m22,m23} <= {m21,m22,m23,m24};
    {m30,m15,m32,m33} <= {m15,m32,m33,m34};
    {m40,m41,m42,m43} <= {m41,m42,m43,m44};
end
//------------------------读取权重矩阵---------------------------------
always @(posedge clk or negedge rstn) begin
    if(!rstn)begin
        weight_addr <= 8'd0;
    end
    else begin
        if(start)begin
            if(weight_addr == 8'd25||!weight_en)
                weight_addr <= weight_addr;
            else
                weight_addr <= weight_addr + 8'd1; 
        end
        else 
            weight_addr <= 8'd0;
    end
end

//----------------------------权重赋值----------------------------
always @(posedge clk or negedge rstn)begin
    if(!rstn)
        k00 <= 1'b0;
    else begin
        if(weight_addr == 8'd0)
            k00 <= weight;
        else
            k00 <= k00;
    end
end
always @(posedge clk or negedge rstn)begin
    if(!rstn)
        k01 <= 1'b0;
    else begin
        if(weight_addr == 8'd1)
            k01 <= weight;
        else
            k01 <= k01;
    end
end

always @(posedge clk or negedge rstn)begin
    if(!rstn)
        k02 <= 1'b0;
    else begin
        if(weight_addr == 8'd2)
            k02 <= weight;
        else
            k02 <= k02;
    end
end

always @(posedge clk or negedge rstn)begin
    if(!rstn)
        k03 <= 1'b0;
    else begin
        if(weight_addr == 8'd3)
            k03 <= weight;
        else
            k03 <= k03;
    end
end

always @(posedge clk or negedge rstn)begin
    if(!rstn)
        k04 <= 1'b0;
    else begin
        if(weight_addr == 8'd4)
            k04 <= weight;
        else
            k04 <= k04;
    end
end

always @(posedge clk or negedge rstn)begin
    if(!rstn)
        k10 <= 1'b0;
    else begin
        if(weight_addr == 8'd5)
            k10 <= weight;
        else
            k10 <= k10;
    end
end

always @(posedge clk or negedge rstn)begin
    if(!rstn)
        k11 <= 1'b0;
    else begin
        if(weight_addr == 8'd6)
            k11 <= weight;
        else
            k11 <= k11;
    end
end

always @(posedge clk or negedge rstn)begin
    if(!rstn)
        k12 <= 1'b0;
    else begin
        if(weight_addr == 8'd7)
            k12 <= weight;
        else
            k12 <= k12;
    end
end

always @(posedge clk or negedge rstn)begin
    if(!rstn)
        k13 <= 1'b0;
    else begin
        if(weight_addr == 8'd8)
            k13 <= weight;
        else
            k13 <= k13;
    end
end

always @(posedge clk or negedge rstn)begin
    if(!rstn)
        k14 <= 1'b0;
    else begin
        if(weight_addr == 8'd9)
            k14 <= weight;
        else
            k14 <= k14;
    end
end

always @(posedge clk or negedge rstn)begin
    if(!rstn)
        k20 <= 1'b0;
    else begin
        if(weight_addr == 8'd10)
            k20 <= weight;
        else
            k20 <= k20;
    end
end

always @(posedge clk or negedge rstn)begin
    if(!rstn)
        k21 <= 1'b0;
    else begin
        if(weight_addr == 8'd11)
            k21 <= weight;
        else
            k21 <= k21;
    end
end

always @(posedge clk or negedge rstn)begin
    if(!rstn)
        k22 <= 1'b0;
    else begin
        if(weight_addr == 8'd12)
            k22 <= weight;
        else
            k22 <= k22;
    end
end

always @(posedge clk or negedge rstn)begin
    if(!rstn)
        k23 <= 1'b0;
    else begin
        if(weight_addr == 8'd13)
            k23 <= weight;
        else
            k23 <= k23;
    end
end

always @(posedge clk or negedge rstn)begin
    if(!rstn)
        k24 <= 1'b0;
    else begin
        if(weight_addr == 8'd14)
            k24 <= weight;
        else
            k24 <= k24;
    end
end

always @(posedge clk or negedge rstn)begin
    if(!rstn)
        k30 <= 1'b0;
    else begin
        if(weight_addr == 8'd15)
            k30 <= weight;
        else
            k30 <= k30;
    end
end

always @(posedge clk or negedge rstn)begin
    if(!rstn)
        k15 <= 1'b0;
    else begin
        if(weight_addr == 8'd16)
            k15 <= weight;
        else
            k15 <= k15;
    end
end

always @(posedge clk or negedge rstn)begin
    if(!rstn)
        k32 <= 1'b0;
    else begin
        if(weight_addr == 8'd17)
            k32 <= weight;
        else
            k32 <= k32;
    end
end

always @(posedge clk or negedge rstn)begin
    if(!rstn)
        k33 <= 1'b0;
    else begin
        if(weight_addr == 8'd18)
            k33 <= weight;
        else
            k33 <= k33;
    end
end

always @(posedge clk or negedge rstn)begin
    if(!rstn)
        k34 <= 1'b0;
    else begin
        if(weight_addr == 8'd19)
            k34 <= weight;
        else
            k34 <= k34;
    end
end

always @(posedge clk or negedge rstn)begin
    if(!rstn)
        k40 <= 1'b0;
    else begin
        if(weight_addr == 8'd20)
            k40 <= weight;
        else
            k40 <= k40;
    end
end

always @(posedge clk or negedge rstn)begin
    if(!rstn)
        k41 <= 1'b0;
    else begin
        if(weight_addr == 8'd21)
            k41 <= weight;
        else
            k41 <= k41;
    end
end

always @(posedge clk or negedge rstn)begin
    if(!rstn)
        k42 <= 1'b0;
    else begin
        if(weight_addr == 8'd22)
            k42 <= weight;
        else
            k42 <= k42;
    end
end

always @(posedge clk or negedge rstn)begin
    if(!rstn)
        k43 <= 1'b0;
    else begin
        if(weight_addr == 8'd23)
            k43 <= weight;
        else
            k43 <= k43;
    end
end

always @(posedge clk or negedge rstn)begin
    if(!rstn)
        k44 <= 1'b0;
    else begin
        if(weight_addr == 8'd24)
            k44 <= weight;
        else
            k44 <= k44;
    end
end

//------------------------流水线第一级---------------------------------
always @(posedge clk) begin
    if(k00 == 1'b1)
        p00 <=m00;
    else
        p00 <= -m00;
end
always @(posedge clk) begin
    if(k01 == 1'b1)
        p01 <=m01;
    else
        p01 <= -m01;
end
always @(posedge clk) begin
    if(k02 == 1'b1)
        p02 <=m02;
    else
        p02 <= -m02;
end
always @(posedge clk) begin
    if(k03 == 1'b1)
        p03 <=m03;
    else
        p03 <= -m03;
end
always @(posedge clk) begin
    if(k04 == 1'b1)
        p04 <=m04;
    else
        p04 <= -m04;
end
always @(posedge clk) begin
    if(k10 == 1'b1)
        p10 <=m10;
    else
        p10 <= -m10;
end
always @(posedge clk) begin
    if(k11 == 1'b1)
        p11 <=m11;
    else
        p11 <= -m11;
end
always @(posedge clk) begin
    if(k12 == 1'b1)
        p12 <=m12;
    else
        p12 <= -m12;
end
always @(posedge clk) begin
    if(k13 == 1'b1)
        p13 <=m13;
    else
        p13 <= -m13;
end
always @(posedge clk) begin
    if(k14 == 1'b1)
        p14 <=m14;
    else
        p14 <= -m14;
end
always @(posedge clk) begin
    if(k20 == 1'b1)
        p20 <=m20;
    else
        p20 <= -m20;
end
always @(posedge clk) begin
    if(k21 == 1'b1)
        p21 <=m21;
    else
        p21 <= -m21;
end
always @(posedge clk) begin
    if(k22 == 1'b1)
        p22 <=m22;
    else
        p22 <= -m22;
end
always @(posedge clk) begin
    if(k23 == 1'b1)
        p23 <=m23;
    else
        p23 <= -m23;
end
always @(posedge clk) begin
    if(k24 == 1'b1)
        p24 <=m24;
    else
        p24 <= -m24;
end
always @(posedge clk) begin
    if(k30 == 1'b1)
        p30 <=m30;
    else
        p30 <= -m30;
end
always @(posedge clk) begin
    if(k15 == 1'b1)
        p15 <=m15;
    else
        p15 <= -m15;
end
always @(posedge clk) begin
    if(k32 == 1'b1)
        p32 <=m32;
    else
        p32 <= -m32;
end
always @(posedge clk) begin
    if(k33 == 1'b1)
        p33 <=m33;
    else
        p33 <= -m33;
end
always @(posedge clk) begin
    if(k34 == 1'b1)
        p34 <=m34;
    else
        p34 <= -m34;
end
always @(posedge clk) begin
    if(k40 == 1'b1)
        p40 <=m40;
    else
        p40 <= -m40;
end
always @(posedge clk) begin
    if(k41 == 1'b1)
        p41 <=m41;
    else
        p41 <= -m41;
end
always @(posedge clk) begin
    if(k42 == 1'b1)
        p42 <=m42;
    else
        p42 <= -m42;
end
always @(posedge clk) begin
    if(k43 == 1'b1)
        p43 <=m43;
    else
        p43 <= -m43;
end
always @(posedge clk) begin
    if(k44 == 1'b1)
        p44 <=m44;
    else
        p44 <= -m44;
end


//------------------------流水线第二级---------------------------------
always @(posedge clk) begin
    sum000 <= p00 + p10;
    sum001 <= p01 + p11;
    sum002 <= p02 + p12;
    sum003 <= p03 + p13;
    sum004 <= p04 + p14;
    sum010 <= p20 + p30;
    sum011 <= p21 + p15;
    sum012 <= p22 + p32;
    sum013 <= p23 + p33;
    sum014 <= p24 + p34;
    sum020 <= p40;
    sum021 <= p41;
    sum022 <= p42;
    sum023 <= p43;
    sum024 <= p44;
end
//------------------------流水线第三级---------------------------------
always @(posedge clk) begin
    sum100 <= sum000 + sum010;
    sum101 <= sum001 + sum011;
    sum102 <= sum002 + sum012;
    sum103 <= sum003 + sum013;
    sum104 <= sum004 + sum014;
    sum110 <= sum020;
    sum111 <= sum021;
    sum112 <= sum022;
    sum113 <= sum023;
    sum114 <= sum024;
end
//------------------------流水线第四级---------------------------------
always @(posedge clk) begin
    sum200 <= sum100 + sum110;
    sum201 <= sum101 + sum111;
    sum202 <= sum102 + sum112;
    sum203 <= sum103 + sum113;
    sum204 <= sum104 + sum114;
end
//------------------------流水线第五级---------------------------------
always @(posedge clk) begin
    sum30 <= sum200 + sum201;
    sum21 <= sum202 + sum203;
    sum32 <= sum204;
end
//------------------------流水线第六级---------------------------------
always @(posedge clk) begin
    sum40 <= sum30 + sum21;
    sum41 <= sum32;
end
//------------------------流水线第七级---------------------------------
always @(posedge clk) begin
    wt_data <= sum40 + sum41;
end
//------------------------模块工作时钟---------------------------------
always @(posedge clk) begin
    if(start)
        cnt1 <= cnt1+1'd1;
    else
        cnt1 <= 20'd0;
end
always @(posedge clk) begin
    if(sum_valid)begin
        if(cnt2 == Ni-1)
            cnt2 <= 10'd0;
        else
            cnt2 <= cnt2 + 10'd1; 
    end
    else
        cnt2 <= 10'd0;
end
//------------------------输出信号有效判断---------------------------------
always @(posedge clk) begin
    if(!start)
        sum_valid <= 1'b0;
    else begin
        case (state)
            1'b0:if(cnt1 == 20'd828)
                    sum_valid <= 1'b0;
                else if(cnt1 == 20'd160)
                    sum_valid <= 1'b1;
            1'b1:if(cnt1 == 20'd255)
                    sum_valid <= 1'b0;
                else if(cnt1 == 20'd160)
                    sum_valid <= 1'b1;
        endcase
    end
end
always @(posedge clk) begin
    sum_valid_ff <= sum_valid;
end
assign done = ~sum_valid && sum_valid_ff;
assign ovalid = (sum_valid&&cnt2<Ni-K+1)?1'b1:1'b0;
assign dout = wt_data;
endmodule