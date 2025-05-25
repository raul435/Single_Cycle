module alu (
    input [31:0] srcA, srcB,
    input [2:0] alucontrol,
    output reg [31:0] aluresult,
    output reg zero
);
    always @(*) begin
        case (alucontrol)
            3'b000: aluresult = srcA + srcB;           // ADD
            3'b001: aluresult = srcA - srcB;           // SUB
            3'b010: aluresult = srcA << srcB[4:0];     // SLL (shift left logical)
            3'b011: aluresult = ($signed(srcA) < $signed(srcB)) ? 1 : 0; // SLT (signed less than)
            3'b100: aluresult = srcA ^ srcB;           // XOR
            3'b101: aluresult = srcA | srcB;           // OR
            3'b110: aluresult = srcA & srcB;           // AND
            default: aluresult = 32'b0;
        endcase

        zero = (aluresult == 0) ? 1'b1 : 1'b0;
    end
endmodule
