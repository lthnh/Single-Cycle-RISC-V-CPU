`include "common.vh"
`include "assert.vh"

`define CARRY_LOOKAHEAD_ADDER_IMPL

`define SAMPLE_SIZE 100

module sub_tb;
  reg [`WIDTH-1:0] operand_a_in, operand_b_in;
  wire [`WIDTH-1:0] result_out;
  wire borrow_out;

  sub s_dut (
    .operand_a_in (operand_a_in),
    .operand_b_in (operand_b_in),
    .result_out   (result_out),
    .borrow_out   (borrow_out)
  );

  wire [`WIDTH:0] diff_ref;
  assign diff_ref = operand_a_in - operand_b_in;

  integer i;
  initial begin : s_adder_impl_agnostic_tb
    for (i = 0; i < `SAMPLE_SIZE; i = i+1) begin
      operand_a_in = $unsigned($random); operand_b_in = $unsigned($random);
      #1;
      `assert_eq_fmt(result_out, diff_ref[`WIDTH-1:0], %d)
      `assert_eq_fmt(~borrow_out, diff_ref[`WIDTH], %b)
      // borrow_out is negated as
      // a >= b => a - b + 2^n causes overflow => carry appears
      // a < b => a - b + 2^n can't cause overflow => no carry
    end
    $display("[INFO] %m is passed!");
  end
endmodule
