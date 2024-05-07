module MUX_CIN(
    input  wire C_CP_R,
    input  wire C_CP_RP,
    input  wire MUL_BAR,
    output reg  OUT
);

localparam MUL = 0,
           DIV = 1;

always @(*) begin
    case(MUL_BAR)
        MUL: OUT = C_CP_RP;
        DIV: OUT = C_CP_R ; 
    endcase
end

endmodule

