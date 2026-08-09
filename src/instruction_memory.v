`include "common.vh"

`define INSTR_MEM_SIZE 256

module instruction_memory(
  input wire [`WIDTH-1:0] addr_in,
  output wire [`WIDTH-1:0] instr_out
);
  reg [`WIDTH-1:0] instr_mem[0:`INSTR_MEM_SIZE-1];

  initial begin : instr_mem_init
    integer i;
    for (i = 0; i < `INSTR_MEM_SIZE; i++)
      instr_mem[i] = `WIDTH'b0;
  end

  assign instr_out = instr_mem[addr_in];
endmodule

