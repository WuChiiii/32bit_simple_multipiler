
module mul(
    input wire[31:0] A,
    input wire[31:0] B,
    input wire clk,
    input wire [5:0]clkcount,
    output reg[63:0] result
);
    wire [31:0]tmp, overflowtmp;
    wire Cout;

Adder32 plus(
    .Cout(Cout),
    .A(A),
    .B(result[31:0]),
    .Sum(tmp),
    .Cin(1'b0)
);

Adder32 overflow(
    .A(result[63:32]),
    .B(1),
    .Sum(overflowtmp),
    .Cin(1'b0)
);
    always @(*) begin
        if(clkcount == 0) begin
            result=64'b0;
        end else begin
        end
    end

    always @(posedge clk) begin
        if(clkcount > 32) begin
        end else begin
            result = result << 1;
            if(B[32-clkcount]) begin
                result[31:0] = tmp;
                if(Cout) begin
                    result[63:32] = overflowtmp;
                end else begin
                end
            end else begin
            end
        end
    end

endmodule