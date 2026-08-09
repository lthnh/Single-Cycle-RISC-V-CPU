module four_bit_lookahead;
  reg g_in, p_in;
  wire c_in;
  wire [4:1] c_out;

  four_bit_lookahead four_bit_lookahead (
    .g_in (g_in),
    .p_in (p_in),
    .c_in (c_in),
    .c_out(c_out)
  );

endmodule
