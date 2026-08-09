module full_adder(
  input wire a_in, b_in, c_in,
  output wire s_out, c_out
);
  wire s_int, c_int, c2_int;

  half_adder ha1 (
    .a_in (a_in),
    .b_in (b_in),
    .s_out(s_int),
    .c_out(c_int) // c_int (carry_internal) = a & b
  );

  half_adder ha2 (
    .a_in (s_int),
    .b_in (c_in),
    .s_out(s_out),
    .c_out(c2_int) // c2_int (carry2_internal) = (a ^ b) & c_in
  );

  // c_out derivation is a & b | (a | b) & c_in
  // but we have equivalence a & b | (a ^ b) & c_in
  assign c_out = c_int | c2_int;
endmodule

