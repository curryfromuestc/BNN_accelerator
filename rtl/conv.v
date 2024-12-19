module conv 
#(
   parameter K = 3,
   parameter S = 1
)
(
    input wire clk,
    input wire rstn,
    input wire start,//！启动信号，注意跟滑窗模块的启动信号时间不一样
    input wire weight_en,//！ 权重有效信号
    input weight,//！ 以比特权重
    input [2:0] taps,//！ 滑窗模块输入
    input state,//！选择信号，为第一个卷积层或者是第二个卷积层
    output signed [4:0] dout,//！ 卷积输出
    output ovalid,//！ 输出有效信号
    output done//！ 卷积运算完成信号
);
//------------------------变量定义----------------------------
wire [4:0] Ni;
reg [7:0] weight_addr;
reg [4:0] wt_data;

reg [9:0] cnt1;//! 用于计数，工作时钟
reg [4:0] cnt2;//！ 用于同步滑窗模块以及卷积模块

reg sum_valid;
reg sum_valid_ff;
reg k00, k01, k02, 
    k10, k11, k12, 
    k20, k21, k22;
wire m02,m12,m22;
reg m00,m01,
    m10,m11,
    m20,m21;
reg p00,p01,p02,
    p10,p11,p12,
    p20,p21,p22;//! 相乘的结果，流水线第一级
reg signed [4:0] sum000,sum001,sum002,
    sum010,sum011,sum012;//！ 流水线第二级
reg signed [4:0] sum100,sum101,sum102;//！ 流水线第三级
reg signed [4:0] sum200,sum201;//！ 流水线第四级

assign Ni = (state)?26:28;

//----------------------------对输入矩阵进行赋值----------------------------
assign m02 = taps[2];
assign m12 = taps[1];
assign m22 = taps[0];

always @(posedge clk) begin
    {m00,m01} <= {m01,m02};
    {m10,m11} <= {m11,m12};
    {m20,m21} <= {m21,m22};
end
//------------------------读取权重矩阵---------------------------------
always @(posedge clk or negedge rstn) begin
    if(!rstn)begin
        weight_addr <= 8'd0;
    end
    else begin
        if(weight_en)begin
            if(weight_addr == 8'd9)
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
        if(weight_addr == 8'd1)
            k00 <= weight;
        else
            k00 <= k00;
    end
end
always @(posedge clk or negedge rstn)begin
    if(!rstn)
        k01 <= 1'b0;
    else begin
        if(weight_addr == 8'd2)
            k01 <= weight;
        else
            k01 <= k01;
    end
end
always @(posedge clk or negedge rstn)begin
    if(!rstn)
        k02 <= 1'b0;
    else begin
        if(weight_addr == 8'd3)
            k02 <= weight;
        else
            k02 <= k02;
    end
end
always @(posedge clk or negedge rstn)begin
    if(!rstn)
        k10 <= 1'b0;
    else begin
        if(weight_addr == 8'd4)
            k10 <= weight;
        else
            k10 <= k10;
    end
end
always @(posedge clk or negedge rstn)begin
    if(!rstn)
        k11 <= 1'b0;
    else begin
        if(weight_addr == 8'd5)
            k11 <= weight;
        else
            k11 <= k11;
    end
end
always @(posedge clk or negedge rstn)begin
    if(!rstn)
        k12 <= 1'b0;
    else begin
        if(weight_addr == 8'd6)
            k12 <= weight;
        else
            k12 <= k12;
    end
end
always @(posedge clk or negedge rstn)begin
    if(!rstn)
        k20 <= 1'b0;
    else begin
        if(weight_addr == 8'd7)
            k20 <= weight;
        else
            k20 <= k20;
    end
end
always @(posedge clk or negedge rstn)begin
    if(!rstn)
        k21 <= 1'b0;
    else begin
        if(weight_addr == 8'd8)
            k21 <= weight;
        else
            k21 <= k21;
    end
end
always @(posedge clk or negedge rstn)begin
    if(!rstn)
        k22 <= 1'b0;
    else begin
        if(weight_addr == 8'd9)
            k22 <= weight;
        else
            k22 <= k22;
    end
end
//------------------------流水线第一级---------------------------------
always @(posedge clk or negedge rstn)begin
    if(!rstn)begin
        p00 <= 1'b0;
        p01 <= 1'b0;
        p02 <= 1'b0;
        p10 <= 1'b0;
        p11 <= 1'b0;
        p12 <= 1'b0;
        p20 <= 1'b0;
        p21 <= 1'b0;
        p22 <= 1'b0;
    end
    else begin
        p00 <= m00 ~^ k00;
        p01 <= m01 ~^ k01;
        p02 <= m02 ~^ k02;
        p10 <= m10 ~^ k10;
        p11 <= m11 ~^ k11;
        p12 <= m12 ~^ k12;
        p20 <= m20 ~^ k20;
        p21 <= m21 ~^ k21;
        p22 <= m22 ~^ k22;
    end
end
        

//------------------------流水线第二级---------------------------------
always @(posedge clk or negedge rstn) begin
    if(!rstn)begin
        sum000 <= 5'sd0;
    end
    else begin
        if((p00 == 1'b1)&&(p10 == 1'b1))
            sum000 <= 5'sd2;
        else if((p00 == 1'b0)&&(p10 == 1'b0))
            sum000 <= -5'sd2;
        else
            sum000 <= 5'sd0;
    end
end
always @(posedge clk or negedge rstn) begin
    if(!rstn)begin
        sum001 <= 5'sd0;
    end
    else begin
        if((p01 == 1'b1)&&(p11 == 1'b1))
            sum001 <= 5'sd2;
        else if((p01 == 1'b0)&&(p11 == 1'b0))
            sum001 <= -5'sd2;
        else
            sum001 <= 5'sd0;
    end
end
always @(posedge clk or negedge rstn) begin
    if(!rstn)begin
        sum002 <= 5'sd0;
    end
    else begin
        if((p02 == 1'b1)&&(p12 == 1'b1))
            sum002 <= 5'sd2;
        else if((p02 == 1'b0)&&(p12 == 1'b0))
            sum002 <= -5'sd2;
        else
            sum002 <= 5'sd0;
    end
end
always @(posedge clk or negedge rstn)begin
    if(!rstn)begin
        sum010 <= 5'sd0;
    end
    else begin
        if(p20 == 1'b1)
            sum010 <= 5'sd1;
        else if(p20 == 1'b0)
            sum010 <= -5'sd1;
        else
            sum010 <= 5'sd0;
    end
end
always @(posedge clk or negedge rstn)begin
    if(!rstn)begin
        sum011 <= 5'sd0;
    end
    else begin
        if(p21 == 1'b1)
            sum011 <= 5'sd1;
        else if(p21 == 1'b0)
            sum011 <= -5'sd1;
        else
            sum011 <= 5'sd0;
    end
end
always @(posedge clk or negedge rstn)begin
    if(!rstn)begin
        sum012 <= 5'sd0;
    end
    else begin
        if(p22 == 1'b1)
            sum012 <= 5'sd1;
        else if(p22 == 1'b0)
            sum012 <= -5'sd1;
        else
            sum012 <= 5'sd0;
    end
end
//------------------------流水线第三级---------------------------------
always @(posedge clk) begin
    sum100 <= sum000 + sum010;
    sum101 <= sum001 + sum011;
    sum102 <= sum002 + sum012;
end
//------------------------流水线第四级---------------------------------
always @(posedge clk) begin
    sum200 <= sum100 + sum101;
    sum201 <= sum102;
end
//------------------------流水线第五级---------------------------------
always @(posedge clk) begin
    wt_data <= sum200 + sum201;
end
//------------------------模块工作时钟---------------------------------
always @(posedge clk) begin
    if(start)
        cnt1 <= cnt1+1'd1;
    else
        cnt1 <= 10'd0;
end
always @(posedge clk) begin
    if(sum_valid)begin
        if(cnt2 == Ni-1)
            cnt2 <= 5'd0;
        else
            cnt2 <= cnt2 + 5'd1; 
    end
    else
        cnt2 <= 5'd0;
end
//------------------------输出信号有效判断---------------------------------
always @(posedge clk) begin
    if(!start)
        sum_valid <= 1'b0;
    else begin
        case (state)
            1'b0:if(cnt1 == 10'd814)
                    sum_valid <= 1'b0;
                else if(cnt1 == 10'd90)
                    sum_valid <= 1'b1;
            1'b1:if(cnt1 == 10'd255)
                    sum_valid <= 1'b0;
                else if(cnt1 == 10'd160)
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