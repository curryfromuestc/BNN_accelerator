module CNN_top_tb ();
parameter cycle = 20;
reg clk;
reg rstn;
wire start;
reg signed[31:0] image_in;
wire [9:0]classes;
wire done;
wire conv1_done;
wire start_window;


integer fp_i;
integer count_w;
integer count_r;

reg [10:0] cnt_line;
reg [10:0] cnt_conv;
reg signed [31:0] conv_result_r [0:599];

CNN_top CNN_top_inst(
    .clk(clk),
    .rstn(rstn),
    .start(start),
    .din(image_in),
    .classes(classes),
    .done(done),
    .conv1_done(conv1_done),
    .din_ready(start_window)
);

initial begin
    clk = 1;
    rstn = 0;
    #20;
    rstn = 1;
end
assign start = (conv1_done == 1) ? 0 : 1;

initial begin
    fp_i = $fopen("C:\\Users\\21047\\code\\curry_code_summay\\rtl_works\\BNN_on_fpga\\test_image_txt.txt", "r");
end

always @(posedge clk) begin
    if(start_window == 1)
    begin
        count_w <= $fscanf(fp_i,"%b",image_in);
        cnt_line <= cnt_line + 1;
        if(cnt_line == 784) $display("image read done");
    end
end
integer i;
always @(posedge clk) begin
    if(done)
    begin
        for(i = 0; i <= 10; i = i + 1)begin
        // $display("classes[%d] = %d", i, classes[i]);
            $display("classes[%d] = %d", i, classes[i]);
            if(i == 10)
                $finish;
        end
    end
end
    
always #10 clk = ~clk;
    
endmodule