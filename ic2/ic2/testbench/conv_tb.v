module conv_tb();

    parameter cycle = 20;
    reg clk;
    reg rstn;
    reg start_conv;
    reg signed[15:0] image_in;
    reg start_window;
    reg state;
    wire [79:0] taps;
    reg weight_en;
    reg weight_c;
    reg weight;
    wire [15:0] conv_result;
    wire conv_done;
    wire conv_ovalid;

    integer fp_i;
    integer count_w;

    reg [10:0] cnt_line;
    reg [10:0] cnt_conv;
    reg signed [15:0] conv_result_r [0:599];
    
    conv conv_inst(
        .clk(clk),
        .rstn(rstn),
        .start(start_conv),
        .weight_en(weight_en),
        .weight(weight_c),
        .taps(taps),
        .state(state),
        .dout(conv_result),
        .ovalid(conv_ovalid),
        .done(conv_done)
    );
    window window_inst(
        .clk(clk),
        .start(start_window),
        .din(image_in),
        .state(state),
        .taps(taps)
    );

    string dump_file;
    initial begin
    `ifdef DUMP
        if($value$plusargs("FSDB=%s",dump_file))
            $display("dump_file = %s",dump_file);
        $fsdbDumpfile(dump_file);        
        $fsdbDumpvars(0, conv_tb);
        $fsdbDumpMDA();
    `endif
    end
    initial begin
        clk = 1;
        rstn = 0;
        state = 0;
        cnt_conv = 0;
        //weight_c = 0;
        #20;
        rstn = 1;
        start_conv = 1;
        weight_en = 1;
        #(cycle*25);
        weight_en = 0;
    end
    always @(*) begin
        weight_c = weight;
    end
    
    integer w_i;
    integer count_r;
    initial begin
        w_i = $fopen("/home/ygl/code/ic2/test_conv1_weight_txt.txt", "r");
    end
    always @(posedge clk) begin
        if(weight_en == 1)begin
            count_r <= $fscanf(w_i,"%b",weight);
        end
    end

    initial begin
        cnt_line = 0;
        start_window = 0;
        #(20+10*cycle);
        start_window = 1;
    end

    initial begin
        fp_i = $fopen("/home/ygl/code/ic2/test_image_txt.txt", "r");
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
    integer display_line = 0;
    always @(posedge clk) begin
        if(conv_ovalid&& !conv_done)
        begin
            conv_result_r[cnt_conv] =  conv_result; 
			cnt_conv = cnt_conv + 1;
        end
        else begin
            if(conv_done) // 以24x24二维矩阵形式打印卷积结果
			begin
				conv_result_r[cnt_conv] =  conv_result; // 最后一个结果，conv_ovalid 和 conv_done均为 1
				//$display("cnt_conv: %d  ", cnt_conv);
				$display("conv complete");
				if(state == 0)
				begin
					for(i=0;i<576;i=i+1)
					begin 
						if(i == 0) $write("%d :", display_line);
						
						$write("%d ", conv_result_r[i]); // $write 不会自动换行
						
						if((i+1)%24 == 0)// 添加行号并换行
						begin
							$display(" "); // 每行 24 个数据
							display_line = display_line + 1;
							$write("%d :", display_line);
						end
					end	
                    $finish;
				end
				else if(state == 1)
				begin
					for(i=0;i<64;i=i+1)
					begin
						if(i == 0) $write("%d :", display_line);
						
						$write("%d ", conv_result_r[i]); // $write 不会自动换行
						
						if((i+1)%8 == 0)// 添加行号并换行
						begin
							$display(" "); // 每行 24 个数据
							display_line = display_line + 1;
							$write("%d :", display_line);
						end
					end	
                    $finish;
				end
				
			end
        end
    end
    always #10 clk <= ~clk; 
endmodule