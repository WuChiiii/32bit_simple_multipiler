
module mul(
    input wire[31:0] A,
    input wire[31:0] B,
    input wire clk,
    input wire rst,
    output reg[63:0] result
);
    wire [31:0]tmp, overflowtmp;
    wire Cout;
    reg [5:0]count;

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
        if(rst) begin
            result=64'b0;
            count = 31;
        end else begin
        end
    end

    always @(posedge clk) begin
        if(count < 0) begin
        end else begin
            if(B[count]) begin
                result[31:0] = tmp;
                if(Cout) begin
                    result[63:32] = overflowtmp;
                end else begin
                end
            end else begin
            end
            if(count != 0) begin
                result = result << 1;
            end
            count = count - 1;
        end
    end

endmodule