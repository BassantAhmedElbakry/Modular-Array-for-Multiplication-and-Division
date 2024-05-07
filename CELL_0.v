module CELL_0(
    input  wire Y_ROW,
    input  wire X_IN,
    input  wire P,
    input  wire IN_PREV,
    input  wire MUL_BAR,
    input  wire C_CP_R,
    input  wire C_CP_RP,
    output wire C_OUT,
    output wire OUT 
);

wire MUX_OUT_0, MUX_OUT_1;

FA U0(
    .A(IN_PREV),
    .B(MUX_OUT_0),
    .Cin(MUX_OUT_1),
    .SUM(OUT),
    .Carry(C_OUT)
);

MUX U1(
    .Y_ROW(Y_ROW),
    .X_IN(X_IN),
    .P(P),
    .MUL_BAR(MUL_BAR),
    .OUT(MUX_OUT_0)
);

MUX_CIN U2(
    .C_CP_R(C_CP_R),
    .C_CP_RP(C_CP_RP),
    .MUL_BAR(MUL_BAR),
    .OUT(MUX_OUT_1)
);

endmodule
