`include "alu_submods/cla_mod/cla.vh"

module four_bit_lookahead(
  input wire [`CLA_SUBCOMPONENT_BIT_WIDTH-1:0] g_in, p_in,
  input wire c_in,
  output reg [`CLA_SUBCOMPONENT_BIT_WIDTH:1] c_out
);
  always @* begin
    c_out[1] = g_in[0] | (p_in[0] & c_in);
    c_out[2] = g_in[1] | (p_in[1] & g_in[0]) | (p_in[1] & p_in[0] & c_in);
    c_out[3] = g_in[2] | (p_in[2] & g_in[1]) | (p_in[2] & p_in[1] & g_in[0]) | (p_in[2] & p_in[1] & p_in[0] & c_in);
    c_out[4] = g_in[3] | (p_in[3] & g_in[2]) | (p_in[3] & p_in[2] & g_in[1]) | (p_in[3] & p_in[2] & p_in[1] & g_in[0]) | (p_in[3] & p_in[2] & p_in[1] & p_in[0] & c_in);
  end
endmodule

