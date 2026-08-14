module mux21(
  input wire [1:0] s_in,
  input wire sel_in,
  output reg s_out
);
  always @* begin
    if (!sel_in)
      s_out <= s_in[0];
    else
      s_out <= s_in[1];
  end
endmodule

