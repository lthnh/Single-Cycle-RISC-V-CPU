`include "common.vh"
`include "alu.vh"
`include "alu_submods/cla_mod/cla.vh"

module add(
  input wire [`WIDTH-1:0] operand_a_in, operand_b_in,
  input wire carry_in,
  output wire [`WIDTH-1:0] result,
  output wire carry_out
);
`ifdef RIPPLE_CARRY_ADDER_IMPL
  wire [`WIDTH:0] carry_int;

  assign carry_int[0] = carry_in;

  genvar i;
  for (i = 0; i < `WIDTH; i = i+1) begin: full_adder_chain
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

`ifdef CARRY_LOOKAHEAD_ADDER_IMPL

  wire [`WIDTH/`CLA_SUBCOMPONENT_BIT_WIDTH:0] carry_int;

  assign carry_int[0] = carry_in;

  genvar i;
  for (i = 0; i < `WIDTH/`CLA_SUBCOMPONENT_BIT_WIDTH; i = i+1) begin : carry_lookahead_chain
    localparam idx_start = i*`CLA_SUBCOMPONENT_BIT_WIDTH;
    localparam idx_end = i*`CLA_SUBCOMPONENT_BIT_WIDTH + 3;
    four_bit_cla fbc (
      .a_in (operand_a_in[idx_end:idx_start]),
      .b_in (operand_b_in[idx_end:idx_start]),
      .c_in (carry_int[i]),
      .s_out(result[idx_end:idx_start]),
      .c_out(carry_int[i+1])
    );
  end

  assign carry_out = carry_int[`WIDTH/`CLA_SUBCOMPONENT_BIT_WIDTH];
`endif
endmodule

