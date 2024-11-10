# 乘法器設計

## 乘法器模組 (`mul`)

這是一個 32-bit 無號數乘法器，使用加法實現乘法運算。其內部模組包含一個 32-bit 加法器和多個全加器。

### `mul` 模組

```verilog
module mul(
    input wire[31:0] A,
    input wire[31:0] B,
    input wire clk,
    input wire rst,
    output reg[63:0] result
);
```
### 32bit的加法器模組
```verilog
module Adder32 (
    output Cout, 
    output [31:0] Sum,
    input [31:0] A, B,
    input Cin
);
```

### 全加器模組
```verilog
module Full_adder (
    output Cout, Sum,
    input A, B, Cin
);
```

## 乘法器演算法
1.先初始化各種暫存器為0

2.設置一個counter去指向被乘數B的32bit，從MSB(B[31])開始

3.如果當下counter指向的數字是1，那我就把A的32bit加到result的最右邊(result[31:0])

4.如果加法溢位了(Cout為1)，將result左半邊(result[63:32])加1

5.判斷完一次將result左移一次，若是最後一次運算則不移

6.counter右移(counter--)

## testbench設計
設計簡單的clock，挑選三個常數做乘法，觀察結果是否正確

## compile & run
首先要下載iverilog: sudo apt iverilog

### 編譯指令
iverilog -o mul_tb testbench.v mul.v Adder32.v Full_adder.v

vvp mul_tb

### 波形圖指令
可用來觀看輸出訊號結果

gtkwave waveform.vcd

## 使用注意事項
此乘法器為無號數乘法器，因此負數的結果將會是一個很大的正數，再將成數被乘數輸入進去mul前要注意先將rst設乘1初始化內建的count以及結果result。