module top(
    input clk,
    input reset,
    output [31:0] WriteData,
    output [31:0] DataAdr,
    output MemWrite
);

    wire [31:0] PC;
    wire [31:0] Instr;
    wire [31:0] ReadData;

    // instantiate processor and memories
    riscvsingle rvsingle(
        .clk(clk),
        .reset(reset),
        .PC(PC),
        .Instr(Instr),
        .MemWrite(MemWrite),
        .ALUResult(DataAdr),
        .WriteData(WriteData),
        .ReadData(ReadData)
    );

    imem imem_inst(
        .a(PC),
        .rd(Instr)
    );

    dmem dmem_inst(
        .clk(clk),
        .we(MemWrite),
        .a(DataAdr),
        .wd(WriteData),
        .rd(ReadData)
    );

endmodule
