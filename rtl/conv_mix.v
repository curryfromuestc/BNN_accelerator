module conv_mix(
    input wire clk,
    input wire rstn,
    input wire start,
    input wire signed[15:0] din,
    input wire state,
    input wire weight_en,//！ 权重有效信号
    input weight,//！ 以比特权重
    output signed [15:0] dout,//！ 卷积输出
    output ovalid,//！ 输出有效信号
    output done//！ 卷积运算完成信号
);

reg start_window;
reg [7:0] cnt;
wire [79:0] taps;

always @(posedge clk) begin
    if (!rstn) begin
        cnt <= 8'd0;
        start_window <= 1'b0;
    end else begin
        if (state == 1'b0) begin
            if (cnt < 8'd9&&start&&(!start_window)) begin
                cnt <= cnt + 1;
                start_window <= 1'b0;
            end else begin
                cnt <= 0;
                start_window <= start;
            end
        end else begin
            if (cnt < 8'd89&&start&&(!start_window)) begin
                cnt <= cnt + 1;
                start_window <= 1'b0;
            end else begin
                cnt <= 0;
                start_window <= start;
            end
        end
    end
end

conv conv_inst(
    .clk(clk),
    .rstn(rstn),
    .start(start),
    .weight_en(weight_en),
    .weight(weight),
    .taps(taps),
    .state(state),
    .dout(dout),
    .ovalid(ovalid),
    .done(done)
);
window window_inst(
    .clk(clk),
    .start(start_window),
    .din(din),
    .state(state),
    .taps(taps)
);


endmodule