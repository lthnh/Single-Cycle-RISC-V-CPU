`include "common.vh"

`define RIPPLE_CARRY_ADDER_IMPL
//`define CARRY_LOOKAHEAD_IMPL

module addition(
  input wire [`WIDTH-1:0] operand_a_in, operand_b_in,
  input wire carry_in,
  output wire [`WIDTH-1:0] result,
  output wire carry_out
);
`ifdef RIPPLE_CARRY_ADDER_IMPL
  wire [`WIDTH:0] carry_int;

  assign carry_int[0] = carry_in;

  genvar i;
  for (i = 0; i < `WIDTH-1; i = i+1) begin: full_adder_chain
    full_adder fa (
      .a_in(operand_a_in[i]),
      .b_in(operand_b_in[i]),
      .c_in(carry_int[i]),
      .s_out(result[i]),
      .c_out(carry_int[i+1])
    );
  end

  assign carry_out = carry_int[`WIDTH];
`endif

`ifdef CARRY_LOOKAHEAD_IMPL
  // TODO
`endif
endmodule

