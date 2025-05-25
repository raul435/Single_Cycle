module regfile (
    input clk,
    input WE3,
    input [4:0] A1, A2, A3,
    input [31:0] WD3,
    output reg [31:0] RD1, RD2
);

reg [31:0] REG [31:0];

// Lectura combinacional
always @(*) begin
    RD1 = REG[A1];
    RD2 = REG[A2];
end

// Escritura en flanco de reloj
always @(posedge clk) begin
    if (WE3 && (A3 != 0)) begin
        REG[A3] <= WD3;
    end
end

endmodule
