module MUX_FA_OUT(
    input  wire FA_OUT,
    input  wire MUL_BAR,
    output reg  M_OUT
);

localparam MUL = 0,
           DIV = 1;

always @(*) begin
    case(MUL_BAR)
        MUL: M_OUT = FA_OUT;
        DIV: M_OUT = 1'b0 ; 
    endcase
end

endmodule


