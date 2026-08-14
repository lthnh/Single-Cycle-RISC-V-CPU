`include "common.vh"

`define MUL_SHIFT_AND_ADD_IMPL

module mul(
  input wire [`WIDTH-1:0] operand_a_in,
  input wire [`WIDTH-1:0] operand_b_in,
  input wire clk,
  output wire [`WIDTH-1:0] result_out
);
`ifdef MUL_SHIFT_AND_ADD_IMPL
  reg [`WIDTH-1:0] accumulator;
  
  always @(posedge clk) begin

  end
`endif
endmodule
