module MUX_IN_PREV(
    input  wire Y_ROW,
    input  wire MUL_BAR,
    output reg  OUT
);

localparam MUL = 0,
           DIV = 1;

always @(*) begin
    case(MUL_BAR)
        MUL: OUT = 0;
        DIV: OUT = Y_ROW ; 
    endcase
end

endmodule


