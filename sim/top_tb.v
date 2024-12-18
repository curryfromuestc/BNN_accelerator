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
    #2o;
    rstn = 1;
    start = 1;
end

integer w_i_0,w_i_1,w_i_2,w_i_3,w_i_4,w_i_5,w_i_6,w_i_7,w_i_8,w_i_9;
integer count_r;
initial begin
    w_i_0 = $fopen("weight_fc_0.txt","r");//对应test_fc1_weight_txt0.txt
    w_i_1 = $fopen("weight_fc_1.txt","r");
    w_i_2 = $fopen("weight_fc_2.txt","r");
    w_i_3 = $fopen("weight_fc_3.txt","r");
    w_i_4 = $fopen("weight_fc_4.txt","r");
    w_i_5 = $fopen("weight_fc_5.txt","r");
    w_i_6 = $fopen("weight_fc_6.txt","r");
    w_i_7 = $fopen("weight_fc_7.txt","r");
    w_i_8 = $fopen("weight_fc_8.txt","r");
    w_i_9 = $fopen("weight_fc_9.txt","r");
end
always @(posedge clk) begin
    if(fc_ivalid)begin
        weight_fc_0_in <= $fscanf(w_i_0,"%b");
        weight_fc_1_in <= $fscanf(w_i_1,"%b");
        weight_fc_2_in <= $fscanf(w_i_2,"%b");
        weight_fc_3_in <= $fscanf(w_i_3,"%b");
        weight_fc_4_in <= $fscanf(w_i_4,"%b");
        weight_fc_5_in <= $fscanf(w_i_5,"%b");
        weight_fc_6_in <= $fscanf(w_i_6,"%b");
        weight_fc_7_in <= $fscanf(w_i_7,"%b");
        weight_fc_8_in <= $fscanf(w_i_8,"%b");
        weight_fc_9_in <= $fscanf(w_i_9,"%b");
    end
end

integer fp_i;
initial begin
    fp_i = $fopen("test_image_txt.txt","r");
end
always @(posedge clk) begin
    if(start == 1)begin
        count_w <= $fscanf(fp_i,"%b",image_in);
        cnt_line <= cnt_line + 1;
        if(cnt_line == 784) $display("image read done");
    end
end

assign pic_din = ~image_in[7];

integer w_conv_i_0,w_conv_i_1;
initial begin
    w_conv_i_0 = $fopen("test_weight_conv_0.txt","r");
    w_conv_i_1 = $fopen("test_weight_conv_1.txt","r");
end

always @(posedge clk) begin
    if(weight_en_0&&count_conv < 32'd9)begin
        weight_conv_in <= $fscanf(w_conv_i_0,"%b");
        count_conv <= count_conv + 1;
    end
    else if(weight_en_1&&count_conv < 32'd18)begin
        weight_conv_in <= $fscanf(w_conv_i_0,"%b");
        count_conv <= count_conv + 1;
    end
    else if(weight_en_0||weight_en_1)begin
        weight_conv_in <= $fscanf(w_conv_i_1,"%b");
    end
end

integer i;
always @(posedge clk) begin
    if(done)
    begin
        $display("classes = %d", i, classes_b[i]);
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