`include "common.vh"

`define INSTR_MEM_SIZE 256

module instruction_memory(
  input wire [`WIDTH-1:0] addr_in,
  input wire prog_enable_in,
  input wire [`WIDTH-1:0] instr_in,
  input wire clk_in,
  output wire [`WIDTH-1:0] instr_out
);
  reg [`WIDTH-1:0] instr_mem[0:`INSTR_MEM_SIZE-1];

  always @(posedge clk_in) begin
    if (prog_enable_in) instr_mem[addr_in] = instr_in;
  end

  assign instr_out = instr_mem[addr_in];
endmodule

