`include "common.vh"

module branch_target(
  input wire [`WIDTH-1:0] curr_instr_in,
  input wire [`WIDTH-1:0] instr_br_offset_in,
  output wire [`WIDTH-1:0] instr_br_to_out
);
  assign instr_br_to_out = curr_instr_in + instr_br_offset_in;
endmodule

