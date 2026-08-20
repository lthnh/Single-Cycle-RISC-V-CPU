`include "common.vh"

module mux21_32b(
  input wire [`WIDTH-1:0] a_in,
  input wire [`WIDTH-1:0] b_in,
  input wire sel_in,
  output reg [`WIDTH-1:0] s_out
);

  always @* begin
    if (sel_in)
      s_out = b_in;
    else
      s_out = a_in;
  end

endmodule
