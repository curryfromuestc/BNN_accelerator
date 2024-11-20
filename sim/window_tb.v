module window_tb();
    //输入
    reg clk;
    reg start;
    reg [7:0] din;
    reg state;
    //输出
    wire [39:0] taps;

    //文件指针
    integer fp_i;
    integer count_w;

    //读取行技术
    reg[10:0]cnt_line;

    //实例化
    window window_inst(
        .clk(clk),
        .start(start),
        .din(din),
        .state(state),
        .taps(taps)
    );
    //读取图片数据
    initial begin
         fp_i = $fopen("C:\\Users\\curry_yang\\code\\curry_code_summay\\rtl_works\\BNN_on_fpga\\test_image_txt.txt","r");
    end
    initial begin
        cnt_line = 0;
        clk = 0;
        start = 0;
        state = 0;
        #20;
        start = 1;
    end
    always @(posedge clk) begin
        begin
            count_w <= $fscanf(fp_i,"%b",din);
            cnt_line <= cnt_line + 1;
            if (cnt_line == 11'd784) $display("finish");
        end
    end
endmodule