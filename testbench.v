module testbench;

  reg clk;
  reg reset;
  wire [31:0] WriteData, DataAdr;
  wire MemWrite;

  // Instancia del dispositivo bajo prueba (DUT)
  top dut(
    .clk(clk),
    .reset(reset),
    .WriteData(WriteData),
    .DataAdr(DataAdr),
    .MemWrite(MemWrite)
  );

  // Inicialización del test
  initial begin
    reset = 1;
    #22;
    reset = 0;
  end

  // Generación de reloj
  always begin
    clk = 1; #5;
    clk = 0; #5;
  end

  // Verificación de resultados
  always @(negedge clk) begin
    if (MemWrite) begin
      if (DataAdr === 100 && WriteData === 25) begin
        $display("Simulation succeeded");
        $stop;
      end else if (DataAdr !== 96) begin
        $display("Simulation failed");
        $stop;
      end
    end
  end

endmodule
