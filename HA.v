module HA(
    input  wire A,
    input  wire B,
    output reg  S,
    output reg  Carry
);

always @(*) begin
    {Carry,S} = A + B;
end

endmodule
