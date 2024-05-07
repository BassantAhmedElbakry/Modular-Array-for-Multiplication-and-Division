module FA_CELL(
    input  wire X,
    input  wire R,
    input  wire C_IN,
    input  wire MUL_BAR,
    input  wire R_IN,
    output wire C_OUT,
    output reg  R_OUT 
);

wire FA_OUT_1; 
reg  MUX_OUT_1;

FA U1(
    .A(X),
    .B(R),
    .Cin(C_IN),
    .SUM(FA_OUT_1),
    .Carry(C_OUT)
);

localparam OUT_REMENDER   = 1'b0,
           FULL_ADDER_OUT = 1'b1;

localparam MUL = 0,
           DIV = 1;           

always @(*) begin
    case(R_IN)
        OUT_REMENDER:   MUX_OUT_1 = R;
        FULL_ADDER_OUT: MUX_OUT_1 = FA_OUT_1;
    endcase
end

always @(*) begin
    case(MUL_BAR)
        MUL: R_OUT = R;
        DIV: R_OUT = MUX_OUT_1;
    endcase
end
endmodule
