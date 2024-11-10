module testbench;
    reg [31:0] A, B;
    wire [63:0] result;
    reg clk,rst;
    reg [5:0] count;
    integer i;
    mul alu(
        .A(A),
        .B(B),
        .result(result),
        .clk(clk),
        .rst(rst)
    );

    initial begin
        #10
        for ( i = 0; i < 33; i = i + 1) begin
            if(i==0)begin
                #5 clk = 0; rst =1 ; clk = 1; B = 32'h00000003; A = 32'h0000000F;
            end
            else begin
                #5 clk = 0; clk = 1; rst = 0;
            end  
        end
        if (result == 64'h000000000000002D) begin
            $display("Test 1 Passed: %d * %d = %d", A, B, result);
        end else begin
            $display("Test 1 Failed: %d * %d != %d (result: %d )", A, B, 15 * 3, result);
        end

        for ( i = 0; i < 33; i = i + 1) begin
            if(i==0)begin
                #5 clk = 0; rst =1 ; clk = 1; B = 32'h00000000; A = 32'h11111111;
            end
            else begin
                #5 clk = 0; clk = 1; rst = 0 ;
            end  
        end

        // 檢查結果     
        if (result == 64'h0000000000000000) begin
            $display("Test 2 Passed: %d * %d = %d", A, B, result);
        end else begin
            $display("Test 2 Failed: %d * %d != %d (result: %d)", A, B, 0, result);
        end

        $finish;
    end

    initial begin
        $dumpfile("waveform.vcd");  // 設定 VCD 文件名
        $dumpvars(0, testbench);     // 記錄所有信號
    end
endmodule