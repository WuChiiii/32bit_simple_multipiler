module Adder32 (
    output Cout, 
    output [31:0] Sum,
    input [31:0] A, B,
    input Cin
);
    wire [31:1] ctemp;
    Full_adder F0(ctemp[1], Sum[0], A[0], B[0], Cin);
    Full_adder F1(ctemp[2], Sum[1], A[1], B[1], ctemp[1]);
    Full_adder F2(ctemp[3], Sum[2], A[2], B[2], ctemp[2]);
    Full_adder F3(ctemp[4], Sum[3], A[3], B[3], ctemp[3]);
    Full_adder F4(ctemp[5], Sum[4], A[4], B[4], ctemp[4]);
    Full_adder F5(ctemp[6], Sum[5], A[5], B[5], ctemp[5]);
    Full_adder F6(ctemp[7], Sum[6], A[6], B[6], ctemp[6]);
    Full_adder F7(ctemp[8], Sum[7], A[7], B[7], ctemp[7]);
    Full_adder F8(ctemp[9], Sum[8], A[8], B[8], ctemp[8]);
    Full_adder F9(ctemp[10], Sum[9], A[9], B[9], ctemp[9]);
    Full_adder F10(ctemp[11], Sum[10], A[10], B[10], ctemp[10]);
    Full_adder F11(ctemp[12], Sum[11], A[11], B[11], ctemp[11]);
    Full_adder F12(ctemp[13], Sum[12], A[12], B[12], ctemp[12]);
    Full_adder F13(ctemp[14], Sum[13], A[13], B[13], ctemp[13]);
    Full_adder F14(ctemp[15], Sum[14], A[14], B[14], ctemp[14]);
    Full_adder F15(ctemp[16], Sum[15], A[15], B[15], ctemp[15]);
    Full_adder F16(ctemp[17], Sum[16], A[16], B[16], ctemp[16]);
    Full_adder F17(ctemp[18], Sum[17], A[17], B[17], ctemp[17]);
    Full_adder F18(ctemp[19], Sum[18], A[18], B[18], ctemp[18]);
    Full_adder F19(ctemp[20], Sum[19], A[19], B[19], ctemp[19]);
    Full_adder F20(ctemp[21], Sum[20], A[20], B[20], ctemp[20]);
    Full_adder F21(ctemp[22], Sum[21], A[21], B[21], ctemp[21]);
    Full_adder F22(ctemp[23], Sum[22], A[22], B[22], ctemp[22]);
    Full_adder F23(ctemp[24], Sum[23], A[23], B[23], ctemp[23]);
    Full_adder F24(ctemp[25], Sum[24], A[24], B[24], ctemp[24]);
    Full_adder F25(ctemp[26], Sum[25], A[25], B[25], ctemp[25]);
    Full_adder F26(ctemp[27], Sum[26], A[26], B[26], ctemp[26]);
    Full_adder F27(ctemp[28], Sum[27], A[27], B[27], ctemp[27]);
    Full_adder F28(ctemp[29], Sum[28], A[28], B[28], ctemp[28]);
    Full_adder F29(ctemp[30], Sum[29], A[29], B[29], ctemp[29]);
    Full_adder F30(ctemp[31], Sum[30], A[30], B[30], ctemp[30]);
    Full_adder F31(Cout,     Sum[31], A[31], B[31], ctemp[31]);
endmodule