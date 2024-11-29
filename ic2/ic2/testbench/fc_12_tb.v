module fc_12_tb ();
reg clk;
reg rstn;
reg ivalid;
reg din_0;
reg din_1;
reg din_2;
reg din_3;
reg din_4;
reg din_5;
reg din_6;
reg din_7;
reg din_8;
reg din_9;
reg din_10;
reg din_11;
reg weight,weight_ff0,weight_ff1;
reg weight_en;
// 输出
wire ovalid;
wire signed [15:0]dout;
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
integer i;
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
    .weight(weight),
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
    # 20; //  ???周期后填充权重数据，共需 ???192个时钟周期，192x20
    rstn = 1;
    for (i = 0; i < 12; i = i + 1) begin
        weight_en = 1;
        # (144*20);//  ???始填充数 ???
        weight_en = 0;
        # (20);
        ivalid = 1;
        # (20*12);
        ivalid = 0;  
    end
    
end

integer w_i;
integer count_r;

initial begin
    w_i = $fopen("/home/ygl/code/BNN_accelerator/train/test_array/weight.txt", "r");
end
always @(posedge clk) begin
    weight_ff0 <= weight;
    weight_ff1 <= weight_ff0;
    if(weight_en) begin
        count_r = $fscanf(w_i,"%b",weight);
        //$display("weight: %b",weight);
    end
    if(ovalid)begin
            $display("out: %d",dout);
            $finish;
        end
end

initial
begin
    fp_i_0 = $fopen("/home/ygl/code/BNN_accelerator/train/test_array/output_file_1.txt","r"); // 数字 0  (1)输入数据路径
    
    fp_i_1 = $fopen("/home/ygl/code/BNN_accelerator/train/test_array/output_file_2.txt","r"); // 数字 1  (1)输入数据路径
    fp_i_2 = $fopen("/home/ygl/code/BNN_accelerator/train/test_array/output_file_3.txt","r"); // 数字 2  (1)输入数据路径
    fp_i_3 = $fopen("/home/ygl/code/BNN_accelerator/train/test_array/output_file_4.txt","r"); // 数字 3  (1)输入数据路径
    fp_i_4 = $fopen("/home/ygl/code/BNN_accelerator/train/test_array/output_file_5.txt","r"); // 数字 4  (1)输入数据路径
    fp_i_5 = $fopen("/home/ygl/code/BNN_accelerator/train/test_array/output_file_6.txt","r"); // 数字 5  (1)输入数据路径
    fp_i_6 = $fopen("/home/ygl/code/BNN_accelerator/train/test_array/output_file_7.txt","r"); // 数字 6  (1)输入数据路径
    fp_i_7 = $fopen("/home/ygl/code/BNN_accelerator/train/test_array/output_file_8.txt","r"); // 数字 7  (1)输入数据路径
    fp_i_8 = $fopen("/home/ygl/code/BNN_accelerator/train/test_array/output_file_9.txt","r"); // 数字 8  (1)输入数据路径
    fp_i_9 = $fopen("/home/ygl/code/BNN_accelerator/train/test_array/output_file_10.txt","r"); // 数字 9  (1)输入数据路径
    fp_i_10 = $fopen("/home/ygl/code/BNN_accelerator/train/test_array/output_file_11.txt","r"); // 数字 10  (1)输入数据路径
    fp_i_11 = $fopen("/home/ygl/code/BNN_accelerator/train/test_array/output_file_12.txt","r"); // 数字 11  (1)输入数据路径
end

always@(posedge clk)
begin
    if(ivalid == 1)begin// 当输入有效标志拉高时读取数据时，数据要准备好，否则数据会错位 ???
            count_w  <= $fscanf(fp_i_0,"%b" ,din_0); //  ???次读 ???6个数 ???
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
            cnt_line <= cnt_line + 1;
            if(cnt_line == 9'd143) $display("picture read over");
            //$display("%d",count_w);
            
        end
    end

always #10 clk <= ~clk; 


endmodule