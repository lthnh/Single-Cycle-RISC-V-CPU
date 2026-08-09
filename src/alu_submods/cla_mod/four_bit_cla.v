`include "common.vh"
`include "alu_submods/cla_mod/cla.vh"

module four_bit_cla(
  input wire [`CLA_SUBCOMPONENT_BIT_WIDTH-1:0] a_in, b_in,
  input wire c_in,
  output wire [`CLA_SUBCOMPONENT_BIT_WIDTH-1:0] s_out,
  output wire c_out
);
  wire [`CLA_SUBCOMPONENT_BIT_WIDTH-1:0] g_int;
  wire [`CLA_SUBCOMPONENT_BIT_WIDTH-1:0] p_int;
  wire [`CLA_SUBCOMPONENT_BIT_WIDTH:0] c_int;

  assign c_int[0] = c_in;

  modified_full_adder mfa[`CLA_SUBCOMPONENT_BIT_WIDTH-1:0] (
    .a_in (a_in),
    .b_in (b_in),
    .c_in (c_int[`CLA_SUBCOMPONENT_BIT_WIDTH-1:0]),
    .s_out(s_out),
    .g_out(g_int),
    .p_out(p_int)
  );

  four_bit_lookahead fbl (
    .g_in (g_int),
    .p_in (p_int),
    .c_in (c_in),
    .c_out(c_int[`CLA_SUBCOMPONENT_BIT_WIDTH:1])
  );

  assign c_out = c_int[`CLA_SUBCOMPONENT_BIT_WIDTH];
endmodule

