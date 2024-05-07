// Scale my time to nano second
`timescale 1ns/1ns

module GENERIC_ARRAY_tb #(
    parameter NO_ROWS_TB     = 10,
    parameter NO_BITS_DIV_TB = 5 
)();

localparam MUL = 1'b0,
           DIV = 1'b1;

// DUT Signals
reg  [NO_ROWS_TB - 1 : 0] Y_tb;
reg  [NO_BITS_DIV_TB - 1 : 0] X_tb;
reg  MUL_BAR_tb;
wire [NO_ROWS_TB + NO_BITS_DIV_TB - 2 : 0] OUTPUT_tb;
wire [NO_ROWS_TB - 1 : 0] Q_tb;

// DUT Instantiation
GENERIC_ARRAY DUT(
    .Y(Y_tb),
    .X(X_tb),
    .MUL_BAR(MUL_BAR_tb),
    .REM_MUL_OUT(OUTPUT_tb),
    .Q(Q_tb)
);

initial begin

    // Save Waveform
    $dumpfile("GENERIC_ARRAY.vcd");
    $dumpvars;

    // Initialization
    Initialize();

    // Y = 2 & X = 2 --> OUT = 4
    Multiplication('b10,'b10);

    if(OUTPUT_tb == 'b0100)
        $display("TEST 1 IS PASSED :) ");
    else
        $display("TEST 1 IS FAILED :( ");

    // Y = 4 & X = 2 --> OUT = 8
    Multiplication('b100,'b10);

    if(OUTPUT_tb == 'b1000)
        $display("TEST 2 IS PASSED :) ");
    else
        $display("TEST 2 IS FAILED :( ");

    // Y = 4 & X = 2 --> Q = 2 & R = 0
    Division('b100,'b10);

    if(OUTPUT_tb == 'b000 && Q_tb == 'b10)
        $display("TEST 3 IS PASSED :) ");
    else
        $display("TEST 3 IS FAILED :( ");

    // Y = 5 & X = 2 --> Q = 2 & R = 1
    Division('b101,'b10);

    if(OUTPUT_tb == 'b001 && Q_tb == 'b10)
        $display("TEST 4 IS PASSED :) ");
    else
        $display("TEST 4 IS FAILED :( ");

    // Y = 9 & X = 3 --> Q = 3 & R = 0
    Division('b1001,'b11);

    if(OUTPUT_tb == 'b000 && Q_tb == 'b11)
        $display("TEST 5 IS PASSED :) ");
    else
        $display("TEST 5 IS FAILED :( ");

    // Y = 8 & X = 3 --> Q = 2 & R = 2
    Division('b1000,'b11);

    if(OUTPUT_tb == 'b010 && Q_tb == 'b10)
        $display("TEST 6 IS PASSED :) ");
    else
        $display("TEST 6 IS FAILED :( ");

    // Y = 15 & X = 2 --> Q = 7 & R = 1
    Division('b1111,'b10);

    if(OUTPUT_tb == 'b001 && Q_tb == 'b111)
        $display("TEST 7 IS PASSED :) ");
    else
        $display("TEST 7 IS FAILED :( ");

    // Y = 15 & X = 3 --> OUT = 45
    Multiplication('b1111,'b11);

    if(OUTPUT_tb == 'd45)
        $display("TEST 8 IS PASSED :) ");
    else
        $display("TEST 8 IS FAILED :( ");

    // Y = 15 & X = 4 --> Q = 3 & R = 3
    Division('b1111,'b100);

    if(OUTPUT_tb == 'b011 && Q_tb == 'b011)
        $display("TEST 9 IS PASSED :) ");
    else
        $display("TEST 9 IS FAILED :( ");

    // Y = 21 & X = 15 --> OUT = 315
    Multiplication('b10101,'b01111);

    if(OUTPUT_tb == 'd315)
        $display("TEST 10 IS PASSED :) ");
    else
        $display("TEST 10 IS FAILED :( ");

    // Y = 21 & X = 15 --> Q = 1 & R = 6
    Division('b10101,'b01111);

    if(OUTPUT_tb == 'b0110 && Q_tb == 'b01)
        $display("TEST 11 IS PASSED :) ");
    else
        $display("TEST 11 IS FAILED :( ");

    // Y = 119 & X = 13 --> Q = 1 & R = 2
    Division('b1110111,'b01101);

    if(OUTPUT_tb == 'b010 && Q_tb == 'b1001)
        $display("TEST 12 IS PASSED :) ");
    else
        $display("TEST 12 IS FAILED :( ");

    // Y = 119 & X = 15 --> Q = 7 & R = 14
    Division('b1110111,'b01111);

    if(OUTPUT_tb == 'd14 && Q_tb == 'b111)
        $display("TEST 13 IS PASSED :) ");
    else
        $display("TEST 13 IS FAILED :( ");

    // Y = 21 & X = 13 --> Q = 1 & R = 8
    Division('b10101,'b01101);

    if(OUTPUT_tb == 'b1000 && Q_tb == 'b001)
        $display("TEST 14 IS PASSED :) ");
    else
        $display("TEST 14 IS FAILED :( ");

    // Y = 31 & X = 15 --> OUT = 465
    Multiplication('b11111,'b01111);

    if(OUTPUT_tb == 'd465)
        $display("TEST 15 IS PASSED :) ");
    else
        $display("TEST 15 IS FAILED :( ");

    // Y = 365 & X = 15 --> Q = 24 & R = 5
    Division('b01_0110_1101,'b01111);

    if(OUTPUT_tb == 'b0101 && Q_tb == 'd24)
        $display("TEST 16 IS PASSED :) ");
    else
        $display("TEST 16 IS FAILED :( ");

    // Y = 511 & X = 11 --> Q = 46 & R = 5
    Division('b01_1111_1111,'b01011);

    if(OUTPUT_tb == 'b0101 && Q_tb == 'd46)
        $display("TEST 17 IS PASSED :) ");
    else
        $display("TEST 17 IS FAILED :( ");

    // Y = 341 & X = 8 --> Q = 42 & R = 5
    Division('b01_0101_0101,'b01000);

    if(OUTPUT_tb == 'b0101 && Q_tb == 'd42)
        $display("TEST 18 IS PASSED :) ");
    else
        $display("TEST 18 IS FAILED :( ");

    // Y = 31 & X = 9 --> OUT = 279
    Multiplication('b11111,'b01001);

    if(OUTPUT_tb == 'd279)
        $display("TEST 19 IS PASSED :) ");
    else
        $display("TEST 19 IS FAILED :( ");

    // Y = 23 & X = 8 --> OUT = 184
    Multiplication('b10111,'b01000);

    if(OUTPUT_tb == 'd184)
        $display("TEST 20 IS PASSED :) ");
    else
        $display("TEST 20 IS FAILED :( ");



    /********************************** Corner Cases For: MUL Mode **********************************/

    // zero * zero
    // Y = 0 & X = 0 --> OUT = 0
    Multiplication('b0,'b0);

    if(OUTPUT_tb == 'b0)
        $display("Corner case: zero * zero IS PASSED :) ");
    else
        $display("Corner case: zero * zero IS FAILED :( ");

    // (max multiplicand x max multiplier)
    // Y = 31 & X = 31 --> OUT = 961 
    Multiplication('b11111,'b11111);

    if(OUTPUT_tb == 'd961)
        $display("Corner case: max multiplicand x max multiplier IS PASSED :) ");
    else
        $display("Corner case: max multiplicand x max multiplier IS FAILED :( ");

    
    // (max multiplicand x zero)
    // Y = 31 & X = 0 --> OUT = 0 
    Multiplication('b11111,'b0);

    if(OUTPUT_tb == 'b0)
        $display("Corner case: max multiplicand x zero IS PASSED :) ");
    else
        $display("Corner case: max multiplicand x zero IS FAILED :( ");

    
    /********************************** Corner Cases For: DIV Mode **********************************/

    // Divide 1 by 1
    // Y = 1 & X = 1 --> Q = 1 & R = 0
    Division('b1,'b1);

    if(OUTPUT_tb == 'b0 && Q_tb == 'b1)
        $display("Corner case: Divide 1 by 1 IS PASSED :) ");
    else
        $display("Corner case: Divide 1 by 1 IS FAILED :( ");

    // max dividend by max divisor
    // Y = 1023 & X = 15 --> Q = 68 & R = 3
    Division('b11_1111_1111,'b01111);

    if(OUTPUT_tb == 'b11 && Q_tb == 'd68)
        $display("Corner case: max dividend by max divisor IS PASSED :) ");
    else
        $display("Corner case: max dividend by max divisor IS FAILED :( ");

    // max dividend by 1
    // Y = 1023 & X = 1 --> Q = 1023 & R = 0
    Division('b11_1111_1111,'b1);

    if(OUTPUT_tb == 'b0 && Q_tb == 'd1023)
        $display("Corner case: max dividend by 1 IS PASSED :) ");
    else
        $display("Corner case: max dividend by 1 IS FAILED :( ");

    // 1 by max divisor
    // Y = 1 & X = 15 --> Q = 0 & R = 1
    Division('b1,'b1111);

    if(OUTPUT_tb == 'b1 && Q_tb == 'b0)
        $display("Corner case: 1 by max divisor IS PASSED :) ");
    else
        $display("Corner case: 1 by max divisor IS FAILED :( ");
    
    // Y < X
    // Y = 3 & X = 15 --> Q = 0 & R = 3
    Division('b11,'b1111);

    if(OUTPUT_tb == 'b11 && Q_tb == 'b0)
        $display("Corner case: Y < X IS PASSED :) ");
    else
        $display("Corner case: Y < X IS FAILED :( ");

    // Divide by 0 --> Expected Infinity
    // Y = 3 & X = 0 --> Q = Infinity & R = 3
    Division('b0011,'b0);

    if(OUTPUT_tb == 'b011 && Q_tb == 'b11_1111_1111)
        $display("Corner case: Divide by 0 IS PASSED :) ");
    else
        $display("Corner case: Divide by 0 IS FAILED :( ");

    

    $stop;
end

/********************************** TASKS **********************************/

// Initialize task
task Initialize;
    begin
        MUL_BAR_tb = MUL;
        Y_tb = 'b000;
        X_tb = 'b000;
    end
endtask

task Multiplication;
input [NO_ROWS_TB - 1 : 0]     Y;
input [NO_BITS_DIV_TB - 1 : 0] X;
    begin 
        MUL_BAR_tb = MUL;
        Y_tb = Y;
        X_tb = X;
        #200;
    end
endtask

task Division;
input [NO_ROWS_TB - 1 : 0]     Y;
input [NO_BITS_DIV_TB - 1 : 0] X;
    begin 
        MUL_BAR_tb = DIV;
        Y_tb = Y;
        X_tb = X;
        #200;
    end
endtask

endmodule



