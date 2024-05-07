// Scale my time to nano second
`timescale 1ns/1ns

module FA_tb();

// DUT Signals 
reg  A_tb;
reg  B_tb;
reg  Cin_tb;
wire SUM_tb;
wire Carry_tb;

// DUT Instantiation
FA DUT(
    .A(A_tb),
    .B(B_tb),
    .Cin(Cin_tb),
    .SUM(SUM_tb),
    .Carry(Carry_tb)
);

initial begin

    A_tb = 1;
    B_tb = 1;
    Cin_tb = 0;
    #20;

    if(SUM_tb == 0 && Carry_tb == 1)
        $display("TEST 1 IS PASSED :) ");
    else
        $display("TEST 1 IS FAILED :( ");

    A_tb = 1;
    B_tb = 1;
    Cin_tb = 1;
    #20;

    if(SUM_tb == 1 && Carry_tb == 1)
        $display("TEST 2 IS PASSED :) ");
    else
        $display("TEST 2 IS FAILED :( ");

    A_tb = 1;
    B_tb = 0;
    Cin_tb = 0;
    #20;

    if(SUM_tb == 1 && Carry_tb == 0)
        $display("TEST 3 IS PASSED :) ");
    else
        $display("TEST 3 IS FAILED :( ");

    A_tb = 0;
    B_tb = 0;
    Cin_tb = 0;
    #20;

    if(SUM_tb == 0 && Carry_tb == 0)
        $display("TEST 4 IS PASSED :) ");
    else
        $display("TEST 4 IS FAILED :( ");

    $stop;
end

endmodule

