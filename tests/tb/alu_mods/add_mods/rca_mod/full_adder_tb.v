`include "common.vh"
`include "assert.vh"

module full_adder_tb;
  reg a_in, b_in, c_in;
  wire s_out, c_out;

  wire [1:0] sum_ref;

  assign sum_ref = a_in + b_in + c_in;

  full_adder fa_dut (
    .a_in (a_in),
    .b_in (b_in),
    .c_in (c_in),
    .s_out(s_out),
    .c_out(c_out)
  );

  integer i;
  initial begin
    for (i = 0; i < 8; i = i+1) begin
      a_in = i[0]; b_in = i[1]; c_in = i[2];
      #1;
      `assert_eq(s_out, sum_ref[0])
      `assert_eq(c_out, sum_ref[1])
    end
    $display("[INFO] %m is passed!");
  end
endmodule
