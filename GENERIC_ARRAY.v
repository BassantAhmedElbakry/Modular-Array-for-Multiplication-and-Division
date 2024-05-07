module GENERIC_ARRAY#(
    parameter NO_ROWS     = 10,
    parameter NO_BITS_DIV = 5 
)(
    input  wire [NO_ROWS - 1 : 0] Y,
    input  wire [NO_BITS_DIV - 1 : 0] X,
    input  wire MUL_BAR,
    output wire [13 : 0] REM_MUL_OUT,
    output wire [NO_ROWS - 1 : 0] Q
);

wire [((NO_BITS_DIV - 1) * NO_ROWS) - 1 : 0] C_OUTPUT; 
wire [35 : 0] OUT_INTERNAL;
wire [NO_BITS_DIV - 1 : 0] CIN;
wire [13 : 0] OUTPUT;

assign REM_MUL_OUT[13 : 5] = OUTPUT[13 : 5];


// First Column (CELL_1)
CELL_1 U0(
    .Y_ROW(Y[0]),
    .X_IN(X[0]),
    .P(Q[1]),
    .MUL_BAR(MUL_BAR),
    .C_CP_R(Q[1]),
    .C_CP_RP(1'b0),
    .C_OUT(C_OUTPUT[0]),
    .OUT(OUTPUT[0])
);

CELL_1 U1(
    .Y_ROW(Y[1]),
    .X_IN(X[0]),
    .P(Q[2]),
    .MUL_BAR(MUL_BAR),
    .C_CP_R(Q[2]),
    .C_CP_RP(C_OUTPUT[0]),
    .C_OUT(C_OUTPUT[1]),
    .OUT(OUT_INTERNAL[0])
);

CELL_1 U2(
    .Y_ROW(Y[2]),
    .X_IN(X[0]),
    .P(Q[3]),
    .MUL_BAR(MUL_BAR),
    .C_CP_R(Q[3]),
    .C_CP_RP(C_OUTPUT[1]),
    .C_OUT(C_OUTPUT[2]),
    .OUT(OUT_INTERNAL[1])
);

CELL_1 U3(
    .Y_ROW(Y[3]),
    .X_IN(X[0]),
    .P(Q[4]),
    .MUL_BAR(MUL_BAR),
    .C_CP_R(Q[4]),
    .C_CP_RP(C_OUTPUT[2]),
    .C_OUT(C_OUTPUT[3]),
    .OUT(OUT_INTERNAL[2])
);

CELL_1 U4(
    .Y_ROW(Y[4]),
    .X_IN(X[0]),
    .P(Q[5]),
    .MUL_BAR(MUL_BAR),
    .C_CP_R(Q[5]),
    .C_CP_RP(C_OUTPUT[3]),
    .C_OUT(C_OUTPUT[4]),
    .OUT(OUT_INTERNAL[3])
);

CELL_1 U5(
    .Y_ROW(Y[5]),
    .X_IN(X[0]),
    .P(Q[6]),
    .MUL_BAR(MUL_BAR),
    .C_CP_R(Q[6]),
    .C_CP_RP(C_OUTPUT[4]),
    .C_OUT(C_OUTPUT[5]),
    .OUT(OUT_INTERNAL[4])
);

CELL_1 U6(
    .Y_ROW(Y[6]),
    .X_IN(X[0]),
    .P(Q[7]),
    .MUL_BAR(MUL_BAR),
    .C_CP_R(Q[7]),
    .C_CP_RP(C_OUTPUT[5]),
    .C_OUT(C_OUTPUT[6]),
    .OUT(OUT_INTERNAL[5])
);

CELL_1 U7(
    .Y_ROW(Y[7]),
    .X_IN(X[0]),
    .P(Q[8]),
    .MUL_BAR(MUL_BAR),
    .C_CP_R(Q[8]),
    .C_CP_RP(C_OUTPUT[6]),
    .C_OUT(C_OUTPUT[7]),
    .OUT(OUT_INTERNAL[6])
);

CELL_1 U8(
    .Y_ROW(Y[8]),
    .X_IN(X[0]),
    .P(Q[9]),
    .MUL_BAR(MUL_BAR),
    .C_CP_R(Q[9]),
    .C_CP_RP(C_OUTPUT[7]),
    .C_OUT(C_OUTPUT[8]),
    .OUT(OUT_INTERNAL[7])
);

CELL_1 U9(
    .Y_ROW(Y[9]),
    .X_IN(X[0]),
    .P(1'b1),
    .MUL_BAR(MUL_BAR),
    .C_CP_R(1'b1),
    .C_CP_RP(C_OUTPUT[8]),
    .C_OUT(C_OUTPUT[9]),
    .OUT(OUT_INTERNAL[8])
);

// Second Column (CELL_0)
CELL_0 U10(
    .Y_ROW(Y[0]),
    .X_IN(X[1]),
    .P(Q[1]),
    .IN_PREV(OUT_INTERNAL[0]),
    .MUL_BAR(MUL_BAR),
    .C_CP_R(C_OUTPUT[0]),
    .C_CP_RP(1'b0),
    .C_OUT(C_OUTPUT[10]),
    .OUT(OUTPUT[1])
);

CELL_0 U11(
    .Y_ROW(Y[1]),
    .X_IN(X[1]),
    .P(Q[2]),
    .IN_PREV(OUT_INTERNAL[1]),
    .MUL_BAR(MUL_BAR),
    .C_CP_R(C_OUTPUT[1]),
    .C_CP_RP(C_OUTPUT[NO_ROWS]),
    .C_OUT(C_OUTPUT[NO_ROWS + 1]),
    .OUT(OUT_INTERNAL[9]) 
);

CELL_0 U12(
    .Y_ROW(Y[2]),
    .X_IN(X[1]),
    .P(Q[3]),
    .IN_PREV(OUT_INTERNAL[2]),
    .MUL_BAR(MUL_BAR),
    .C_CP_R(C_OUTPUT[2]),
    .C_CP_RP(C_OUTPUT[NO_ROWS + 1]),
    .C_OUT(C_OUTPUT[NO_ROWS + 2]),
    .OUT(OUT_INTERNAL[10])
);

CELL_0 U13(
    .Y_ROW(Y[3]),
    .X_IN(X[1]),
    .P(Q[4]),
    .IN_PREV(OUT_INTERNAL[3]),
    .MUL_BAR(MUL_BAR),
    .C_CP_R(C_OUTPUT[3]),
    .C_CP_RP(C_OUTPUT[NO_ROWS + 2]),
    .C_OUT(C_OUTPUT[NO_ROWS + 3]),
    .OUT(OUT_INTERNAL[11])
);

CELL_0 U14(
    .Y_ROW(Y[4]),
    .X_IN(X[1]),
    .P(Q[5]),
    .IN_PREV(OUT_INTERNAL[4]),
    .MUL_BAR(MUL_BAR),
    .C_CP_R(C_OUTPUT[4]),
    .C_CP_RP(C_OUTPUT[NO_ROWS + 3]),
    .C_OUT(C_OUTPUT[NO_ROWS + 4]),
    .OUT(OUT_INTERNAL[12])
);

CELL_0 U15(
    .Y_ROW(Y[5]),
    .X_IN(X[1]),
    .P(Q[6]),
    .IN_PREV(OUT_INTERNAL[5]),
    .MUL_BAR(MUL_BAR),
    .C_CP_R(C_OUTPUT[5]),
    .C_CP_RP(C_OUTPUT[NO_ROWS + 4]),
    .C_OUT(C_OUTPUT[NO_ROWS + 5]),
    .OUT(OUT_INTERNAL[13])
);

CELL_0 U16(
    .Y_ROW(Y[6]),
    .X_IN(X[1]),
    .P(Q[7]),
    .IN_PREV(OUT_INTERNAL[6]),
    .MUL_BAR(MUL_BAR),
    .C_CP_R(C_OUTPUT[6]),
    .C_CP_RP(C_OUTPUT[NO_ROWS + 5]),
    .C_OUT(C_OUTPUT[NO_ROWS + 6]),
    .OUT(OUT_INTERNAL[14])
);

CELL_0 U17(
    .Y_ROW(Y[7]),
    .X_IN(X[1]),
    .P(Q[8]),
    .IN_PREV(OUT_INTERNAL[7]),
    .MUL_BAR(MUL_BAR),
    .C_CP_R(C_OUTPUT[7]),
    .C_CP_RP(C_OUTPUT[NO_ROWS + 6]),
    .C_OUT(C_OUTPUT[NO_ROWS + 7]),
    .OUT(OUT_INTERNAL[15])
);

CELL_0 U18(
    .Y_ROW(Y[8]),
    .X_IN(X[1]),
    .P(Q[9]),
    .IN_PREV(OUT_INTERNAL[8]),
    .MUL_BAR(MUL_BAR),
    .C_CP_R(C_OUTPUT[8]),
    .C_CP_RP(C_OUTPUT[NO_ROWS + 7]),
    .C_OUT(C_OUTPUT[NO_ROWS + 8]),
    .OUT(OUT_INTERNAL[16])
);

CELL_0 U19(
    .Y_ROW(Y[9]),
    .X_IN(X[1]),
    .P(1'b1),
    .IN_PREV(1'b0),
    .MUL_BAR(MUL_BAR),
    .C_CP_R(C_OUTPUT[9]),
    .C_CP_RP(C_OUTPUT[NO_ROWS + 8]),
    .C_OUT(C_OUTPUT[NO_ROWS + 9]), //19
    .OUT(OUT_INTERNAL[17])
);

// Third Column (CELL_0)
CELL_0 U20(
    .Y_ROW(Y[0]),
    .X_IN(X[2]),
    .P(Q[1]),
    .IN_PREV(OUT_INTERNAL[9]), //(NO_ROWS - 1) 
    .MUL_BAR(MUL_BAR),
    .C_CP_R(C_OUTPUT[10]), //NO_ROWS
    .C_CP_RP(1'b0),  
    .C_OUT(C_OUTPUT[20]),
    .OUT(OUTPUT[2]) 
);

CELL_0 U21(
    .Y_ROW(Y[1]),
    .X_IN(X[2]),
    .P(Q[2]),
    .IN_PREV(OUT_INTERNAL[10]),  
    .MUL_BAR(MUL_BAR),
    .C_CP_R(C_OUTPUT[11]), 
    .C_CP_RP(C_OUTPUT[20]),  
    .C_OUT(C_OUTPUT[21]),
    .OUT(OUT_INTERNAL[18]) 
);

CELL_0 U22(
    .Y_ROW(Y[2]),
    .X_IN(X[2]),
    .P(Q[3]),
    .IN_PREV(OUT_INTERNAL[11]),  
    .MUL_BAR(MUL_BAR),
    .C_CP_R(C_OUTPUT[12]), 
    .C_CP_RP(C_OUTPUT[21]),  
    .C_OUT(C_OUTPUT[22]),
    .OUT(OUT_INTERNAL[19]) 
);

CELL_0 U23(
    .Y_ROW(Y[3]),
    .X_IN(X[2]),
    .P(Q[4]),
    .IN_PREV(OUT_INTERNAL[12]),  
    .MUL_BAR(MUL_BAR),
    .C_CP_R(C_OUTPUT[13]), 
    .C_CP_RP(C_OUTPUT[22]),  
    .C_OUT(C_OUTPUT[23]),
    .OUT(OUT_INTERNAL[20]) 
);

CELL_0 U24(
    .Y_ROW(Y[4]),
    .X_IN(X[2]),
    .P(Q[5]),
    .IN_PREV(OUT_INTERNAL[13]),  
    .MUL_BAR(MUL_BAR),
    .C_CP_R(C_OUTPUT[14]), 
    .C_CP_RP(C_OUTPUT[23]),  
    .C_OUT(C_OUTPUT[24]),
    .OUT(OUT_INTERNAL[21]) 
);

CELL_0 U25(
    .Y_ROW(Y[5]),
    .X_IN(X[2]),
    .P(Q[6]),
    .IN_PREV(OUT_INTERNAL[14]),  
    .MUL_BAR(MUL_BAR),
    .C_CP_R(C_OUTPUT[15]), 
    .C_CP_RP(C_OUTPUT[24]),  
    .C_OUT(C_OUTPUT[25]),
    .OUT(OUT_INTERNAL[22]) 
);

CELL_0 U26(
    .Y_ROW(Y[6]),
    .X_IN(X[2]),
    .P(Q[7]),
    .IN_PREV(OUT_INTERNAL[15]),  
    .MUL_BAR(MUL_BAR),
    .C_CP_R(C_OUTPUT[16]), 
    .C_CP_RP(C_OUTPUT[25]),  
    .C_OUT(C_OUTPUT[26]),
    .OUT(OUT_INTERNAL[23]) 
);

CELL_0 U27(
    .Y_ROW(Y[7]),
    .X_IN(X[2]),
    .P(Q[8]),
    .IN_PREV(OUT_INTERNAL[16]),  
    .MUL_BAR(MUL_BAR),
    .C_CP_R(C_OUTPUT[17]), 
    .C_CP_RP(C_OUTPUT[26]),  
    .C_OUT(C_OUTPUT[27]),
    .OUT(OUT_INTERNAL[24]) 
);

CELL_0 U28(
    .Y_ROW(Y[8]),
    .X_IN(X[2]),
    .P(Q[9]),
    .IN_PREV(OUT_INTERNAL[17]),  
    .MUL_BAR(MUL_BAR),
    .C_CP_R(C_OUTPUT[18]), 
    .C_CP_RP(C_OUTPUT[27]),  
    .C_OUT(C_OUTPUT[28]),
    .OUT(OUT_INTERNAL[25]) 
);

CELL_0 U29(
    .Y_ROW(Y[9]),
    .X_IN(X[2]),
    .P(1'b1),
    .IN_PREV(1'b0),  
    .MUL_BAR(MUL_BAR),
    .C_CP_R(C_OUTPUT[19]), 
    .C_CP_RP(C_OUTPUT[28]),  
    .C_OUT(C_OUTPUT[29]),
    .OUT(OUT_INTERNAL[26]) 
);

// Fourth Column (CELL_0)
CELL_0 U30(
    .Y_ROW(Y[0]),
    .X_IN(X[3]),
    .P(Q[1]),
    .IN_PREV(OUT_INTERNAL[18]),  
    .MUL_BAR(MUL_BAR),
    .C_CP_R(C_OUTPUT[20]), 
    .C_CP_RP(1'b0),  
    .C_OUT(C_OUTPUT[30]),
    .OUT(OUTPUT[3]) 
);

CELL_0 U31(
    .Y_ROW(Y[1]),
    .X_IN(X[3]),
    .P(Q[2]),
    .IN_PREV(OUT_INTERNAL[19]),  
    .MUL_BAR(MUL_BAR),
    .C_CP_R(C_OUTPUT[21]), 
    .C_CP_RP(C_OUTPUT[30]),  
    .C_OUT(C_OUTPUT[31]),
    .OUT(OUT_INTERNAL[27]) 
);

CELL_0 U32(
    .Y_ROW(Y[2]),
    .X_IN(X[3]),
    .P(Q[3]),
    .IN_PREV(OUT_INTERNAL[20]),  
    .MUL_BAR(MUL_BAR),
    .C_CP_R(C_OUTPUT[22]), 
    .C_CP_RP(C_OUTPUT[31]),  
    .C_OUT(C_OUTPUT[32]),
    .OUT(OUT_INTERNAL[28]) 
);

CELL_0 U33(
    .Y_ROW(Y[3]),
    .X_IN(X[3]),
    .P(Q[4]),
    .IN_PREV(OUT_INTERNAL[21]),  
    .MUL_BAR(MUL_BAR),
    .C_CP_R(C_OUTPUT[23]), 
    .C_CP_RP(C_OUTPUT[32]),  
    .C_OUT(C_OUTPUT[33]),
    .OUT(OUT_INTERNAL[29]) 
);

CELL_0 U34(
    .Y_ROW(Y[4]),
    .X_IN(X[3]),
    .P(Q[5]),
    .IN_PREV(OUT_INTERNAL[22]),  
    .MUL_BAR(MUL_BAR),
    .C_CP_R(C_OUTPUT[24]), 
    .C_CP_RP(C_OUTPUT[33]),  
    .C_OUT(C_OUTPUT[34]),
    .OUT(OUT_INTERNAL[30]) 
);

CELL_0 U35(
    .Y_ROW(Y[5]),
    .X_IN(X[3]),
    .P(Q[6]),
    .IN_PREV(OUT_INTERNAL[23]),  
    .MUL_BAR(MUL_BAR),
    .C_CP_R(C_OUTPUT[25]), 
    .C_CP_RP(C_OUTPUT[34]),  
    .C_OUT(C_OUTPUT[35]),
    .OUT(OUT_INTERNAL[31]) 
);

CELL_0 U36(
    .Y_ROW(Y[6]),
    .X_IN(X[3]),
    .P(Q[7]),
    .IN_PREV(OUT_INTERNAL[24]),  
    .MUL_BAR(MUL_BAR),
    .C_CP_R(C_OUTPUT[26]), 
    .C_CP_RP(C_OUTPUT[35]),  
    .C_OUT(C_OUTPUT[36]),
    .OUT(OUT_INTERNAL[32]) 
);

CELL_0 U37(
    .Y_ROW(Y[7]),
    .X_IN(X[3]),
    .P(Q[8]),
    .IN_PREV(OUT_INTERNAL[25]),  
    .MUL_BAR(MUL_BAR),
    .C_CP_R(C_OUTPUT[27]), 
    .C_CP_RP(C_OUTPUT[36]),  
    .C_OUT(C_OUTPUT[37]),
    .OUT(OUT_INTERNAL[33]) 
);

CELL_0 U38(
    .Y_ROW(Y[8]),
    .X_IN(X[3]),
    .P(Q[9]),
    .IN_PREV(OUT_INTERNAL[26]),  
    .MUL_BAR(MUL_BAR),
    .C_CP_R(C_OUTPUT[28]), 
    .C_CP_RP(C_OUTPUT[37]),  
    .C_OUT(C_OUTPUT[38]),
    .OUT(OUT_INTERNAL[34]) 
);

CELL_0 U39(
    .Y_ROW(Y[9]),
    .X_IN(X[3]),
    .P(1'b1),
    .IN_PREV(1'b0),  
    .MUL_BAR(MUL_BAR),
    .C_CP_R(C_OUTPUT[29]), 
    .C_CP_RP(C_OUTPUT[38]),  
    .C_OUT(C_OUTPUT[39]),
    .OUT(OUT_INTERNAL[35]) 
);

// Fifth Column (1 CELL_0 + 9 CELLs_2)
CELL_0 U40(
    .Y_ROW(Y[0]),
    .X_IN(X[4]),
    .P(Q[1]),
    .IN_PREV(OUT_INTERNAL[27]),  
    .MUL_BAR(MUL_BAR),
    .C_CP_R(C_OUTPUT[30]), 
    .C_CP_RP(1'b0),  
    .C_OUT(Q[0]),
    .OUT(OUTPUT[4]) 
);

CELL_2 U41(
    .Y_ROW(Y[1]),
    .X_IN(X[4]),
    .P(Q[2]),
    .IN_PREV(OUT_INTERNAL[28]),  
    .MUL_BAR(MUL_BAR),
    .C_CP_R(C_OUTPUT[31]), 
    .C_CP_RP(Q[0]),  
    .C_OUT(Q[1]),
    .OUT(OUTPUT[5]) 
);

CELL_2 U42(
    .Y_ROW(Y[2]),
    .X_IN(X[4]),
    .P(Q[3]),
    .IN_PREV(OUT_INTERNAL[29]),  
    .MUL_BAR(MUL_BAR),
    .C_CP_R(C_OUTPUT[32]), 
    .C_CP_RP(Q[1]),  
    .C_OUT(Q[2]),
    .OUT(OUTPUT[6]) 
);

CELL_2 U43(
    .Y_ROW(Y[3]),
    .X_IN(X[4]),
    .P(Q[4]),
    .IN_PREV(OUT_INTERNAL[30]),  
    .MUL_BAR(MUL_BAR),
    .C_CP_R(C_OUTPUT[33]), 
    .C_CP_RP(Q[2]),  
    .C_OUT(Q[3]),
    .OUT(OUTPUT[7]) 
);

CELL_2 U44(
    .Y_ROW(Y[4]),
    .X_IN(X[4]),
    .P(Q[5]),
    .IN_PREV(OUT_INTERNAL[31]),  
    .MUL_BAR(MUL_BAR),
    .C_CP_R(C_OUTPUT[34]), 
    .C_CP_RP(Q[3]),  
    .C_OUT(Q[4]),
    .OUT(OUTPUT[8]) 
);

CELL_2 U45(
    .Y_ROW(Y[5]),
    .X_IN(X[4]),
    .P(Q[6]),
    .IN_PREV(OUT_INTERNAL[32]),  
    .MUL_BAR(MUL_BAR),
    .C_CP_R(C_OUTPUT[35]), 
    .C_CP_RP(Q[4]),  
    .C_OUT(Q[5]),
    .OUT(OUTPUT[9]) 
);

CELL_2 U46(
    .Y_ROW(Y[6]),
    .X_IN(X[4]),
    .P(Q[7]),
    .IN_PREV(OUT_INTERNAL[33]),  
    .MUL_BAR(MUL_BAR),
    .C_CP_R(C_OUTPUT[36]), 
    .C_CP_RP(Q[5]),  
    .C_OUT(Q[6]),
    .OUT(OUTPUT[10]) 
);

CELL_2 U47(
    .Y_ROW(Y[7]),
    .X_IN(X[4]),
    .P(Q[8]),
    .IN_PREV(OUT_INTERNAL[34]),  
    .MUL_BAR(MUL_BAR),
    .C_CP_R(C_OUTPUT[37]), 
    .C_CP_RP(Q[6]),  
    .C_OUT(Q[7]),
    .OUT(OUTPUT[11]) 
);

CELL_2 U48(
    .Y_ROW(Y[8]),
    .X_IN(X[4]),
    .P(Q[9]),
    .IN_PREV(OUT_INTERNAL[35]),  
    .MUL_BAR(MUL_BAR),
    .C_CP_R(C_OUTPUT[38]), 
    .C_CP_RP(Q[7]),  
    .C_OUT(Q[8]),
    .OUT(OUTPUT[12]) 
);

CELL_2 U49(
    .Y_ROW(Y[9]),
    .X_IN(X[4]),
    .P(1'b1),
    .IN_PREV(1'b0),  
    .MUL_BAR(MUL_BAR),
    .C_CP_R(C_OUTPUT[39]), 
    .C_CP_RP(Q[8]),  
    .C_OUT(Q[9]),
    .OUT(OUTPUT[13]) 
);

// The Last CELL [FA + 2 MUXs]
FA_CELL U50(
    .X(X[0]),
    .R(OUTPUT[0]),
    .C_IN(1'b0),
    .MUL_BAR(MUL_BAR),
    .R_IN(OUTPUT[4]),
    .C_OUT(CIN[0]),
    .R_OUT(REM_MUL_OUT[0])
);

FA_CELL U51(
    .X(X[1]),
    .R(OUTPUT[1]),
    .C_IN(CIN[0]),
    .MUL_BAR(MUL_BAR),
    .R_IN(OUTPUT[4]),
    .C_OUT(CIN[1]),
    .R_OUT(REM_MUL_OUT[1])
);

FA_CELL U52(
    .X(X[2]),
    .R(OUTPUT[2]),
    .C_IN(CIN[1]),
    .MUL_BAR(MUL_BAR),
    .R_IN(OUTPUT[4]),
    .C_OUT(CIN[2]),
    .R_OUT(REM_MUL_OUT[2])
);

FA_CELL U53(
    .X(X[3]),
    .R(OUTPUT[3]),
    .C_IN(CIN[2]),
    .MUL_BAR(MUL_BAR),
    .R_IN(OUTPUT[4]),
    .C_OUT(CIN[3]),
    .R_OUT(REM_MUL_OUT[3])
);

FA_CELL U54(
    .X(X[4]),
    .R(OUTPUT[4]),
    .C_IN(CIN[3]),
    .MUL_BAR(MUL_BAR),
    .R_IN(OUTPUT[4]),
    .C_OUT(CIN[4]),
    .R_OUT(REM_MUL_OUT[4])
);

endmodule