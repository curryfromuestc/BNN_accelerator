module top_tb ( );
   

reg clk;
reg rstn;
reg start;
wire [7:0] image_in;
reg weight_fc_0_in;
reg weight_fc_1_in;
reg weight_fc_2_in;
reg weight_fc_3_in;
reg weight_fc_4_in;
reg weight_fc_5_in;
reg weight_fc_6_in;
reg weight_fc_7_in;
reg weight_fc_8_in;
reg weight_fc_9_in;
reg weight_conv_in;
reg [31:0] count_fc_0;
reg [31:0] count_fc_1;
reg [31:0] count_fc_2;
reg [31:0] count_fc_3;
reg [31:0] count_fc_4;
reg [31:0] count_fc_5;
reg [31:0] count_fc_6;
reg [31:0] count_fc_7;
reg [31:0] count_fc_8;
reg [31:0] count_fc_9;
reg [31:0] count_conv_1;
reg [31:0] count_conv_2;
wire weight_en_0;
wire weight_en_1;
reg [31:0]count_conv;
wire fc_ivalid;
wire done;
wire [3:0] classes_b;
reg [10:0] cnt_line;
integer count_w;
wire pic_din;

top top_inst(
    .image_in(pic_din),
    .weight_fc_0_in(weight_fc_0_in),
    .weight_fc_1_in(weight_fc_1_in),
    .weight_fc_2_in(weight_fc_2_in),
    .weight_fc_3_in(weight_fc_3_in),
    .weight_fc_4_in(weight_fc_4_in),
    .weight_fc_5_in(weight_fc_5_in),
    .weight_fc_6_in(weight_fc_6_in),
    .weight_fc_7_in(weight_fc_7_in),
    .weight_fc_8_in(weight_fc_8_in),
    .weight_fc_9_in(weight_fc_9_in),
    .weight_conv_in(weight_conv_in),
    .clk(clk),
    .rstn(rstn),
    .start(start),
    .fc_ivalid(fc_ivalid),
    .done(done),
    .classes_b(classes_b),
    .weight_en_0(weight_en_0),
    .weight_en_1(weight_en_1)
);

initial begin
    clk = 0;
    rstn = 0;
    start = 0;
    weight_fc_0_in = 0;
    weight_fc_1_in = 0;
    weight_fc_2_in = 0;
    weight_fc_3_in = 0;
    weight_fc_4_in = 0;
    weight_fc_5_in = 0;
    weight_fc_6_in = 0;
    weight_fc_7_in = 0;
    weight_fc_8_in = 0;
    weight_fc_9_in = 0;
    weight_conv_in = 0;
    cnt_line = 0;
    count_conv = 0;
    #20;
    rstn = 1;
    start = 1;
end

integer w_i_0,w_i_1,w_i_2,w_i_3,w_i_4,w_i_5,w_i_6,w_i_7,w_i_8,w_i_9;
integer count_r;
initial begin
    
    w_i_0 = $fopen("/home/fuc/Downloads/BNN_accelerator/train/test_array/test_fc1_weight_txt0.txt","r");
    
    w_i_1 = $fopen("/home/fuc/Downloads/BNN_accelerator/train/test_array/test_fc1_weight_txt1.txt","r");
    w_i_2 = $fopen("/home/fuc/Downloads/BNN_accelerator/train/test_array/test_fc1_weight_txt2.txt","r");
    w_i_3 = $fopen("/home/fuc/Downloads/BNN_accelerator/train/test_array/test_fc1_weight_txt3.txt","r");
    w_i_4 = $fopen("/home/fuc/Downloads/BNN_accelerator/train/test_array/test_fc1_weight_txt4.txt","r");
    w_i_5 = $fopen("/home/fuc/Downloads/BNN_accelerator/train/test_array/test_fc1_weight_txt5.txt","r");
    w_i_6 = $fopen("/home/fuc/Downloads/BNN_accelerator/train/test_array/test_fc1_weight_txt6.txt","r");
    w_i_7 = $fopen("/home/fuc/Downloads/BNN_accelerator/train/test_array/test_fc1_weight_txt7.txt","r");
    w_i_8 = $fopen("/home/fuc/Downloads/BNN_accelerator/train/test_array/test_fc1_weight_txt8.txt","r");
    w_i_9 = $fopen("/home/fuc/Downloads/BNN_accelerator/train/test_array/test_fc1_weight_txt9.txt","r");
end
always @(posedge clk) begin
    if(fc_ivalid)begin
        #0.1 count_fc_0 <= $fscanf(w_i_0,"%b",weight_fc_0_in);
        #0.1 count_fc_1 <= $fscanf(w_i_1,"%b",weight_fc_1_in);
        #0.1 count_fc_2 <= $fscanf(w_i_2,"%b",weight_fc_2_in);
        #0.1 count_fc_3 <= $fscanf(w_i_3,"%b",weight_fc_3_in);
        #0.1 count_fc_4 <= $fscanf(w_i_4,"%b",weight_fc_4_in);
        #0.1 count_fc_5 <= $fscanf(w_i_5,"%b",weight_fc_5_in);
        #0.1 count_fc_6 <= $fscanf(w_i_6,"%b",weight_fc_6_in);
        #0.1 count_fc_7 <= $fscanf(w_i_7,"%b",weight_fc_7_in);
        #0.1 count_fc_8 <= $fscanf(w_i_8,"%b",weight_fc_8_in);
        #0.1 count_fc_9 <= $fscanf(w_i_9,"%b",weight_fc_9_in);
    end
end


//integer fp_i;
//initial begin
//    fp_i = $fopen("D:/vivado_project/shishan/test_arry/test_image_txt.txt","r");
//end
//always @(posedge clk) begin
//    if (cnt_line < 785) begin
//        if(start == 1)begin
//            count_w <= $fscanf(fp_i,"%b",image_in);
//            cnt_line <= cnt_line + 1;
//            if(cnt_line == 784) $display("image read done");
//        end
//    end    
//end

reg [7:0]test_img[0:783];

initial begin
  $readmemb("/home/fuc/Downloads/BNN_accelerator/train/test_array/test_image_txt.txt", test_img);
end

//assign count_w = test_img[cnt_line];

reg [7:0]image_in_r;
always @(posedge clk ) begin
    if (cnt_line < 784) begin
        if(start == 1)begin
            image_in_r <= test_img[cnt_line];
            cnt_line <= cnt_line + 1;
            if(cnt_line == 784) $display("image read done");
        end
    end
end
assign image_in = image_in_r;
assign pic_din = (image_in > 127)? 1'b1:1'b0;

integer w_conv_i_0,w_conv_i_1;
initial begin
    w_conv_i_0 = $fopen("/home/fuc/Downloads/BNN_accelerator/train/test_array/test_conv1_weight_txt.txt","r");
    w_conv_i_1 = $fopen("/home/fuc/Downloads/BNN_accelerator/train/test_array/test_conv2_weight_txt.txt","r");
end

always @(posedge clk) begin
    if(weight_en_0&&count_conv < 32'd9)begin
        #0.1 count_conv_1 <= $fscanf(w_conv_i_0,"%b",weight_conv_in);
        count_conv <= count_conv + 1;
    end
    else if(weight_en_1&&count_conv < 32'd18)begin
        #0.1 count_conv_1 <= $fscanf(w_conv_i_0,"%b",weight_conv_in);
        count_conv <= count_conv + 1;
    end
    else if(weight_en_0||weight_en_1)begin
        #0.1 count_conv_2 <= $fscanf(w_conv_i_1,"%b",weight_conv_in);
        count_conv <= count_conv;
    end
end
always @(*)begin
    if(done)
    begin
        $display("classes = %d", classes_b);
        $finish;
    end
end

always #10 clk = ~clk;
    
string dump_file;
initial begin
`ifdef DUMP
    if($value$plusargs("FSDB=%s",dump_file))
        $display("dump_file = %s",dump_file);
    $fsdbDumpfile(dump_file);        
    $fsdbDumpvars(0, top_tb);
    $fsdbDumpMDA();
`endif
end

endmodule
