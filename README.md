# 乘法器設計

## 乘法器模組 (`mul`)

這是一個 32-bit 無符號乘法器，使用加法實現乘法運算。其內部模組包含一個 32-bit 加法器和多個全加器。

### `mul` 模組

```verilog
module mul(
    input wire[31:0] A,    // 被乘數
    input wire[31:0] B,    // 乘數
    input wire clk,         // 時鐘信號
    input wire rst,         // 重置信號
    output reg[63:0] result // 結果
);
32-bit 加法器 (Adder32)
Adder32 是一個 32-bit 加法器，輸入兩個 32-bit 數字 A 和 B，並輸出加法結果 Sum 和進位 Cout。

Adder32 模組
verilog
複製程式碼
module Adder32 (
    output Cout,            // 進位
    output [31:0] Sum,     // 加法結果
    input [31:0] A, B,     // 兩個加數
    input Cin              // 初始進位
);
1-bit 全加器 (Full_adder)
Full_adder 是一個 1-bit 全加器，接受兩個 1-bit 輸入 A 和 B，以及進位 Cin，並輸出加法結果 Sum 和進位 Cout。

Full_adder 模組
verilog
複製程式碼
module Full_adder (
    output Cout, Sum,      // 進位和加法結果
    input A, B, Cin       // 兩個輸入和初始進位
);
乘法器演算法
初始化各種暫存器為 0。
設置一個 counter 指向被乘數 B 的 32-bit 從 MSB（B[31]）開始。
如果當前 counter 指向的數字是 1，則將 A 的 32-bit 加到結果的最右邊（result[31:0]）。
如果加法溢位（Cout 為 1），將結果的左半邊（`result[63:32]）加 1。
每完成一次運算後，將 result 左移一位，若是最後一次運算則不再左移。
counter 右移一次（counter--）。
Testbench 設計
設計簡單的時鐘，挑選三個常數做乘法，觀察結果是否正確。

編輯指令
首先安裝 Icarus Verilog：

bash
複製程式碼
sudo apt install iverilog
編譯與執行
編譯指令：

bash
複製程式碼
iverilog -o mul_tb testbench.v mul.v Adder32.v Full_adder.v
運行模擬：

bash
複製程式碼
vvp mul_tb
查看波形
若結果出錯，可以使用 GTKWave 查看波形圖：

bash
複製程式碼
gtkwave waveform.vcd
注意事項
此乘法器為無號數乘法器，因此負數的結果將會是一個很大的正數。在將被乘數輸入到 mul 前，請先將 rst 設為 1，初始化內建的 count 和結果 result。