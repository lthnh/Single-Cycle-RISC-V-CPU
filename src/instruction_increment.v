`include "common.vh"

module instruction_increment(
  input wire [`WIDTH-1:0] curr_instr_in,
  output wire [`WIDTH-1:0] curr_plus_four_instr_out
);
  assign curr_plus_four_instr_out = curr_instr_in + 4;
endmodule
