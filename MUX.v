module MUX(
    input  wire Y_ROW,
    input  wire X_IN,
    input  wire P,
    input  wire MUL_BAR,
    output reg  OUT
);

localparam MUL = 0,
           DIV = 1;

always @(*) begin
    case(MUL_BAR)
        MUL: OUT = Y_ROW & X_IN;
        DIV: OUT = X_IN  ^ P   ; 
    endcase
end

endmodule
