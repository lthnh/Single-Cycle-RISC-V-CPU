`timescale  1ns/1ps

`include "common.vh"
`include "assert.vh"

`undef RIPPLE_CARRY_ADDER_IMPL
`undef CARRY_LOOKAHEAD_ADDER_IMPL

`define RIPPLE_CARRY_ADDER_IMPL
`define SAMPLE_SIZE 100

module add_rca_impl_tb;
  reg [`WIDTH-1:0] operand_a_in, operand_b_in;
  reg carry_in;
  wire [`WIDTH-1:0] result;
  wire carry_out;

  add add_dut (
    .operand_a_in(operand_a_in),
    .operand_b_in(operand_b_in),
    .carry_in    (carry_in),
    .result      (result),
    .carry_out   (carry_out)
  );

  wire [`WIDTH:0] sum_ref;

  assign sum_ref = operand_a_in + operand_b_in + {{`WIDTH-1{1'b0}}, carry_in};

  integer signed i, j;
  initial begin : ari_tb
    for (i = 0; i < `SAMPLE_SIZE; i = i+1) begin
      for (j = 0; j < 2; j = j+1) begin
        operand_a_in = $unsigned($random); operand_b_in = $unsigned($random); carry_in = j[0];
        #1;
        `assert_eq_fmt(result, sum_ref[`WIDTH-1:0], %d)
        `assert_eq_fmt(carry_out, sum_ref[`WIDTH], %d)
      end
    end
    $display("[INFO] %m is passed!");
  end
endmodule
