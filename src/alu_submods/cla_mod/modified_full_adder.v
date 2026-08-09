module modified_full_adder(
  input wire a_in, b_in, c_in,
  output reg s_out, g_out, p_out
);
  always @* begin
    s_out = a_in ^ b_in ^ c_in;
    g_out = a_in & b_in;
    p_out = (a_in | b_in) & c_in;
  end
endmodule

