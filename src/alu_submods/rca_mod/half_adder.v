module half_adder(
  input wire a_in, b_in,
  output reg s_out, c_out
);
  always @* begin
    s_out = a_in ^ b_in;
    c_out = a_in & b_in;
  end
endmodule
