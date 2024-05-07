// Scale my time to nano second
`timescale 1ns/1ns

module CELL_1_tb();

// DUT Signals 
reg  Y_ROW_tb;
reg  X_IN_tb;
reg  P_tb;
reg  MUL_BAR_tb;
reg  C_CP_R_tb;
reg  C_CP_RP_tb;
wire C_OUT_tb;
wire OUT_tb;

// DUT Instantiation
CELL_1 DUT(
    .Y_ROW(Y_ROW_tb),
    .X_IN(X_IN_tb),
    .P(P_tb),
    .MUL_BAR(MUL_BAR_tb),
    .C_CP_R(C_CP_R_tb),
    .C_CP_RP(C_CP_RP_tb),
    .C_OUT(C_OUT_tb),
    .OUT(OUT_tb)
);

initial begin

    // Save Waveform
    $dumpfile("CELL_1.vcd");
    $dumpvars;

    // Initialization
    Initialize();

    MUL_BAR_tb = 1'b0;
    Y_ROW_tb = 'b001;
    X_IN_tb  = 'b001;
    P_tb     = 'b0;
    C_CP_R_tb  = 'b0;
    C_CP_RP_tb = 'b0;
    #20;

    if(OUT_tb == 'b1 && C_OUT_tb == 'b0)
        $display("TEST 1 IS PASSED :) ");
    else
        $display("TEST 1 IS FAILED :( ");

    MUL_BAR_tb = 1'b0;
    Y_ROW_tb = 'b001;
    X_IN_tb  = 'b000;
    P_tb     = 'b0;
    C_CP_R_tb  = 'b0;
    C_CP_RP_tb = 'b0;
    #20;

    if(OUT_tb == 'b0 && C_OUT_tb == 'b0)
        $display("TEST 2 IS PASSED :) ");
    else
        $display("TEST 2 IS FAILED :( ");

    MUL_BAR_tb = 1'b0;
    Y_ROW_tb = 'b001;
    X_IN_tb  = 'b001;
    P_tb     = 'b0;
    C_CP_R_tb  = 'b0;
    C_CP_RP_tb = 'b1;
    #20;

    if(OUT_tb == 'b0 && C_OUT_tb == 'b1)
        $display("TEST 3 IS PASSED :) ");
    else
        $display("TEST 3 IS FAILED :( ");

    MUL_BAR_tb = 1'b1;
    Y_ROW_tb = 'b001;
    X_IN_tb  = 'b001;
    P_tb     = 'b1;
    C_CP_R_tb  = 'b0;
    C_CP_RP_tb = 'b0;
    #20;

    if(OUT_tb == 'b1 && C_OUT_tb == 'b0)
        $display("TEST 4 IS PASSED :) ");
    else
        $display("TEST 4 IS FAILED :( ");

    MUL_BAR_tb = 1'b1;
    Y_ROW_tb = 'b001;
    X_IN_tb  = 'b001;
    P_tb     = 'b0;
    C_CP_R_tb  = 'b1;
    C_CP_RP_tb = 'b0;
    #20;

    if(OUT_tb == 'b1 && C_OUT_tb == 'b1)
        $display("TEST 5 IS PASSED :) ");
    else
        $display("TEST 5 IS FAILED :( ");

    $stop;
end

/********************************** TASKS **********************************/

// Initialize task
task Initialize;
    begin
        MUL_BAR_tb = 1'b0;
        Y_ROW_tb = 'b000;
        X_IN_tb  = 'b000;
        P_tb     = 'b0;
        C_CP_R_tb  = 'b0;
        C_CP_RP_tb = 'b0;

    end
endtask

endmodule
