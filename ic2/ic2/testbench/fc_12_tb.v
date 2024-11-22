module fc_12_tb ();
reg clk;
reg rstn;
reg ivalid;
reg signed [31:0] din_0;
reg signed [31:0] din_1;
reg signed [31:0] din_2;
reg signed [31:0] din_3;
reg signed [31:0] din_4;
reg signed [31:0] din_5;
reg signed [31:0] din_6;
reg signed [31:0] din_7;
reg signed [31:0] din_8;
reg signed [31:0] din_9;
reg signed [31:0] din_10;
reg signed [31:0] din_11;
reg weight,weight_ff0,weight_ff1;
reg [31:0] weight_32;
reg weight_en;
// 输出
wire ovalid;
wire signed [31:0]dout;
reg[10:0] cnt_line; // 读取行数计数
integer count_w;// 文件指针
integer fp_i_0;
integer fp_i_1;
integer fp_i_2;
integer fp_i_3;
integer fp_i_4;
integer fp_i_5;
integer fp_i_6;
integer fp_i_7;
integer fp_i_8;
integer fp_i_9;
integer fp_i_10;
integer fp_i_11;

fc_12 fc_12_inst(
    .clk(clk),
    .rstn(rstn),
    .ivalid(ivalid),
    .din_0(din_0),
    .din_1(din_1),
    .din_2(din_2),
    .din_3(din_3),
    .din_4(din_4),
    .din_5(din_5),
    .din_6(din_6),
    .din_7(din_7),
    .din_8(din_8),
    .din_9(din_9),
    .din_10(din_10),
    .din_11(din_11),
    .weight(weight_ff0),
    .weight_en(weight_en),
    .ovalid(ovalid),
    .dout(dout)
);

initial begin
    clk = 0;
    rstn = 0; // 复位
    cnt_line = 0; //行数清零
    ivalid = 0; 
    din_0 = 0;
    din_1 = 0;
    din_2 = 0;
    din_3 = 0;
    din_4 = 0;
    din_5 = 0;
    din_6 = 0;
    din_7 = 0;
    din_8 = 0;
    din_9 = 0;
    din_10 = 0;
    din_11 = 0;
    weight_en = 0;
    # 20; // �???周期后填充权重数据，共需�???192个时钟周期，192x20
    rstn = 1;
    weight_en = 1;
    # (192*20);// �???始填充数�???
    weight_en = 0;
    ivalid = 1;
end

integer w_i;
integer count_r;

initial begin
    w_i = $fopen("C:\\Users\\curry_yang\\code\\curry_code_summay\\rtl_works\\BNN_on_fpga\\test_fc1_weight_txt.txt", "r");
end
always @(posedge clk) begin
    weight_ff0 <= weight;
    weight_ff1 <= weight_ff0;
    if(weight_en) begin
        count_r = $fscanf(w_i,"%b",weight);
        //$display("weight: %b",weight);
    end
end

initial
begin
    fp_i_0 = $fopen("C:\\Users\\curry_yang\\code\\curry_code_summay\\rtl_works\\BNN_on_fpga\\test_output5_txt0.txt","r"); // 数字 0  (1)输入数据路径
    fp_i_1 = $fopen("C:\\Users\\curry_yang\\code\\curry_code_summay\\rtl_works\\BNN_on_fpga\\test_output5_txt1.txt","r"); // 数字 1  (1)输入数据路径
    fp_i_2 = $fopen("C:\\Users\\curry_yang\\code\\curry_code_summay\\rtl_works\\BNN_on_fpga\\test_output5_txt2.txt","r"); // 数字 2  (1)输入数据路径
    fp_i_3 = $fopen("C:\\Users\\curry_yang\\code\\curry_code_summay\\rtl_works\\BNN_on_fpga\\test_output5_txt3.txt","r"); // 数字 3  (1)输入数据路径
    fp_i_4 = $fopen("C:\\Users\\curry_yang\\code\\curry_code_summay\\rtl_works\\BNN_on_fpga\\test_output5_txt4.txt","r"); // 数字 4  (1)输入数据路径
    fp_i_5 = $fopen("C:\\Users\\curry_yang\\code\\curry_code_summay\\rtl_works\\BNN_on_fpga\\test_output5_txt5.txt","r"); // 数字 5  (1)输入数据路径
    fp_i_6 = $fopen("C:\\Users\\curry_yang\\code\\curry_code_summay\\rtl_works\\BNN_on_fpga\\test_output5_txt6.txt","r"); // 数字 6  (1)输入数据路径
    fp_i_7 = $fopen("C:\\Users\\curry_yang\\code\\curry_code_summay\\rtl_works\\BNN_on_fpga\\test_output5_txt7.txt","r"); // 数字 7  (1)输入数据路径
    fp_i_8 = $fopen("C:\\Users\\curry_yang\\code\\curry_code_summay\\rtl_works\\BNN_on_fpga\\test_output5_txt8.txt","r"); // 数字 8  (1)输入数据路径
    fp_i_9 = $fopen("C:\\Users\\curry_yang\\code\\curry_code_summay\\rtl_works\\BNN_on_fpga\\test_output5_txt9.txt","r"); // 数字 9  (1)输入数据路径
    fp_i_10 = $fopen("C:\\Users\\curry_yang\\code\\curry_code_summay\\rtl_works\\BNN_on_fpga\\test_output5_txt10.txt","r"); // 数字 10  (1)输入数据路径
    fp_i_11 = $fopen("C:\\Users\\curry_yang\\code\\curry_code_summay\\rtl_works\\BNN_on_fpga\\test_output5_txt11.txt","r"); // 数字 11  (1)输入数据路径
end

always@(posedge clk)
begin
    if(ivalid == 1)begin// 当输入有效标志拉高时读取数据时，数据要准备好，否则数据会错位�???
            count_w  <= $fscanf(fp_i_0,"%b" ,din_0); // �???次读�???6个数�???
            count_w  <= $fscanf(fp_i_1,"%b" ,din_1);
            count_w  <= $fscanf(fp_i_2,"%b" ,din_2);
            count_w  <= $fscanf(fp_i_3,"%b" ,din_3);
            count_w  <= $fscanf(fp_i_4,"%b" ,din_4);
            count_w  <= $fscanf(fp_i_5,"%b" ,din_5);
            count_w  <= $fscanf(fp_i_6,"%b" ,din_6);
            count_w  <= $fscanf(fp_i_7,"%b" ,din_7);
            count_w  <= $fscanf(fp_i_8,"%b" ,din_8);
            count_w  <= $fscanf(fp_i_9,"%b" ,din_9);
            count_w  <= $fscanf(fp_i_10,"%b",din_10);
            count_w  <= $fscanf(fp_i_11,"%b",din_11);
            cnt_line <= cnt_line + 12;
            if(cnt_line == 9'd192) $display("picture read over");
            // $display("%d,%b",count_w,image_in);
            if(ovalid)begin
            $display("out: %d",dout);
            $finish;
            end
        end
    end

always #10 clk <= ~clk; 


endmodule