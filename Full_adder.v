module Full_adder (
    output Cout, Sum,
    input A, B, Cin
);
    assign Cout = (A & B) | (B & Cin) | (A & Cin);
    assign Sum = A ^ B ^ Cin;
endmodule