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
        $dumpfile("waveform.vcd");  
        $dumpvars(0, testbench);    
    end

    initial begin
        #10
        for ( i = 0; i < 33; i = i + 1) begin
            if(i==0)begin
                #5 clk = 0; rst =1 ; #5 clk = 1; B = 32'h00000003; A = 32'h0000000F;
            end
            else begin
                #5 clk = 0; #5 clk = 1; rst = 0;
            end  
        end
        
        // 3 * 15
        if (result == 64'h000000000000002D) begin
            $display("Test 1 Passed: %d * %d = %d", A, B, result);
        end else begin
            $display("Test 1 Failed: %d * %d != %d (result: %d )", A, B, 15 * 3, result);
        end

        for ( i = 0; i < 33; i = i + 1) begin
            if(i==0)begin
                #5 clk = 0; rst =1 ; #5 clk = 1; B = 32'h00000000; A = 32'h11111111;
            end
            else begin
                #5 clk = 0; #5 clk = 1; rst = 0 ;
            end  
        end
        //0 * 最大數 
        if (result == 64'h0000000000000000) begin
            $display("Test 2 Passed: %d * %d = %d", A, B, result);
        end else begin
            $display("Test 2 Failed: %d * %d != %d (result: %d)", A, B, 0, result);
        end

        for ( i = 0; i < 33; i = i + 1) begin
            if(i==0)begin
                #5 clk = 0; rst =1 ; #5 clk = 1; B = 32'h0000007D; A = 32'h0000004E;
            end
            else begin
                #5 clk = 0; #5 clk = 1; rst = 0 ;
            end  
        end
        //125 * 78
        if (result == 64'h0000000000002616) begin
            $display("Test 2 Passed: %d * %d = %d", A, B, result);
        end else begin
            $display("Test 2 Failed: %d * %d != %d (result: %d)", A, B, 9750, result);
        end

        $finish;
    end

   
endmodule