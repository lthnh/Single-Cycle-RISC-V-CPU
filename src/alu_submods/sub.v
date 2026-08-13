`include "common.vh"

module sub(
  input wire [`WIDTH-1:0] operand_a_in, operand_b_in,
  output wire [`WIDTH-1:0] result_out,
  output wire borrow_out
);
  localparam borrow_int = 1'b1;

  wire [`WIDTH-1:0] operand_b_int;

  assign operand_b_int = ~operand_b_in;

  add a32b (
    .operand_a_in(operand_a_in),
    .operand_b_in(operand_b_int),
    .carry_in    (borrow_int),
    .result_out  (result_out),
    .carry_out   (borrow_out)
  );
endmodule
