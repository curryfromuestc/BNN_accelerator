module maxpool(
    input wire clk,
    input wire rstn,
    input wire ivalid,
    input wire state,
    input wire signed [15:0] din,
    output ovalid,
    output wire signed[15:0] dout  
);

reg signed [15:0] data [0:23] ;
reg [6:0] ptr;
reg cnt;
reg signed [15:0] data_reg_0 ;
reg signed [15:0] data_reg_1 ;

//----------------------ptr地址指针递增----------------------
always @(posedge clk or negedge rstn) begin
    if(!rstn)begin
        ptr <= 7'b0000000;
    end
    else begin
        case(state)
            1'b0:begin
                if(ptr == 7'd47)
                    ptr <= 7'b0000000;
                else
                    if(!ivalid)
                        ptr <= ptr;
                    else
                        ptr <= ptr + 7'b0000001;
            end
            1'b1:begin
                if(ptr == 7'd16-1) // 2*8 两行
                    ptr <= 7'd0;
                else 
                    if(!ivalid)
                        ptr <= ptr;
                    else
                        ptr <= ptr + 7'd1;
            end
        endcase
    end
end
always@(posedge clk or negedge rstn)begin
	if(!rstn)
		cnt <= 0;
	else begin
		case(state)
			1'b0:begin
					if(ptr < 7'd25 - 1) //慢一拍
						cnt <= 0;
					else
						if(ivalid)
							cnt <= cnt + 1'b1;
						else
							cnt <= cnt;
				end
			1'b1:begin
					if(ptr <= 7'd7)
						cnt <= 0;
					else
						if(ivalid)
							cnt <= cnt + 1'b1;
						else
							cnt <= cnt;
				end
		endcase
	end
end
//----------------------数据存储----------------------
always @(posedge clk) begin
    case(state)
        1'b0:begin
            if(ptr <= 7'd23&&ivalid)
                data[ptr] <= din;
            else
                data[ptr] <= data[ptr];
        end
        1'b1:begin
            if(ptr <= 7'd7&&ivalid)
                data[ptr] <= din;
            else
                data[ptr]  <= data[ptr];
        end
    endcase
end
always@(posedge clk)begin
		case({state,cnt}) //！ 这里的 cnt是触发时的值，而不是计算后的值
		2'b00:begin
			if(ptr >= 7'd24)
			begin
				if(din>data[ptr-7'd24])
					data_reg_0 <= din;
				else
					data_reg_0 <= data[ptr-7'd24];
			end
			else
				data_reg_0 <= 0;
			end
		2'b01:begin
			if(ptr >= 7'd24)
			begin
				if(din>data[ptr-7'd24])
					data_reg_1 <= din;
				else
					data_reg_1 <= data[ptr-7'd24];
			end
			else
				data_reg_1 <= 0;
			end
		2'b10:begin
			if(ptr >= 7'd8)
			begin
				if(din>data[ptr-7'd8])
					data_reg_0 <= din;
				else
					data_reg_0 <= data[ptr-7'd8];
			end
			else
				data_reg_0 <= 0;
			end
		2'b11:begin
			if(ptr >= 7'd8)
			begin
				if(din>data[ptr-7'd8])
					data_reg_1 <= din;
				else
					data_reg_1 <= data[ptr-7'd8];
			end
			else
				data_reg_1 <= 0;
			end 
		default:begin
				data_reg_1 <= 0; 
				data_reg_0 <= 0;
				end         
		endcase
end
	// 打拍采沿
reg cnt_d;
always@(posedge clk)begin
    if(!rstn)
        cnt_d <= 0;
    else
        cnt_d <= cnt;
end

// cnt 为 1时，输出才是有效的，即 2*2 的kernel， cnt=1含义为第二行且为偶数位索引（从1计数）
//---------------------- 筛选输出数据----------------------
assign ovalid = ~cnt && cnt_d; //！ 采样下降沿
assign dout   = data_reg_1 > data_reg_0 ? data_reg_1 : data_reg_0;
endmodule