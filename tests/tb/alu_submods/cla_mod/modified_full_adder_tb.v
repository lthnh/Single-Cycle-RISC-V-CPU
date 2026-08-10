`include "common.vh"
`include "assert.vh"

module modified_full_adder_tb;
  reg a_in, b_in, c_in;
  wire s_out, g_out, p_out;

  modified_full_adder mdf_dut (
    .a_in (a_in),
    .b_in (b_in),
    .c_in (c_in),
    .s_out(s_out),
    .g_out(g_out),
    .p_out(p_out)
  );

  reg [1:0] sum_ref;
  reg s_ref, g_ref, p_ref;
  always @* begin
    sum_ref = a_in + b_in + c_in;
    s_ref = sum_ref[0];
    g_ref = a_in & b_in;
    p_ref = (a_in | b_in) & c_in;
  end

  integer i;
  initial begin
    for (i = 0; i < 8; i = i+1) begin
      a_in = i[0]; b_in = i[1]; c_in = i[2];
      #1;
      `assert_eq(s_out, s_ref)
      `assert_eq(g_out, g_ref)
      `assert_eq(p_out, p_ref)
    end
    $display("[INFO] %m is passed!");
  end
endmodule
