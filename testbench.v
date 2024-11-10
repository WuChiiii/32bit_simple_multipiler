module testbench;
    reg [31:0] A, B;
    wire [63:0] result;
    reg clk;
    reg [5:0] count;
    integer i;
    mul alu(
        .A(A),
        .B(B),
        .clkcount(count),
        .result(result),
        .clk(clk)
    );
    always @(posedge clk) begin
        if (count < 32) begin
            count = count + 1;
        end
    end
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  
    end

    initial begin
        A = 32'h0000000F;  // 15
        B = 32'h00000003;  // 3
        count = 0;
        #10
        for ( i = 0; i < 32; i = i + 1) begin
            @(posedge clk);  
        end
        if (result == 64'h000000000000002D) begin
            $display("Test 1 Passed: %d * %d = %d", A, B, result);
        end else begin
            $display("Test 1 Failed: %d * %d != %d (result: %d count: %d)", A, B, 15 * 3, result,count);
        end

        A = 32'h00000010;  // 16
        B = 32'h00000004;  // 4
        count = 0;
        #10;               

        // 等待 32 個 clock cycles
        for ( i = 0; i < 32; i = i + 1) begin
            @(posedge clk); 
        end

        // 檢查結果
        if (result == 64'h0000000000000040) begin
            $display("Test 2 Passed: %d * %d = %d", A, B, result);
        end else begin
            $display("Test 2 Failed: %d * %d != %d (result: %d)", A, B, 16 * 4, result);
        end
    end

    initial begin
        $dumpfile("waveform.vcd");  // 設定 VCD 文件名
        $dumpvars(0, testbench);     // 記錄所有信號
    end
endmodule