module FA(
    input  wire A,
    input  wire B,
    input  wire Cin,
    output wire SUM,
    output wire Carry
);

wire IN_1,C_0,C_1;

HA HA_0(
    .A(A),
    .B(B),
    .S(IN_1),
    .Carry(C_0)
);

HA HA_1(
    .A(IN_1),
    .B(Cin),
    .S(SUM),
    .Carry(C_1)
);

assign Carry = C_0 | C_1;

endmodule
