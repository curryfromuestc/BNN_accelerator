module onehot2b(
    input wire [9:0] classes,
    output reg [3:0] classes_b
);

always @(*) begin
    case(classes)
        10'b0000000001: classes_b = 4'b0001;
        10'b0000000010: classes_b = 4'b0010;
        10'b0000000100: classes_b = 4'b0011;
        10'b0000001000: classes_b = 4'b0100;
        10'b0000010000: classes_b = 4'b0101;
        10'b0000100000: classes_b = 4'b0110;
        10'b0001000000: classes_b = 4'b0111;
        10'b0010000000: classes_b = 4'b1000;
        10'b0100000000: classes_b = 4'b1001;
        10'b1000000000: classes_b = 4'b1010;
        default: classes_b = 4'b0000;
    endcase
end

endmodule