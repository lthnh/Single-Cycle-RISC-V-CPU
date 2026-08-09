`timescale 1ns/1ps

`include "assert.vh"

module half_adder_tb;
  reg a_in, b_in;
  wire s_out, c_out;

  half_adder ha_dut (
    .a_in (a_in),
    .b_in (b_in),
    .s_out(s_out),
    .c_out(c_out)
  );

  initial begin
    a_in = 0; b_in = 0;
    #1;
    `assert_eq(s_out, 0)
    `assert_eq(c_out, 0)
    a_in = 0; b_in = 1;
    #1;
    `assert_eq(s_out, 1)
    `assert_eq(c_out, 0)
    a_in = 1; b_in = 0;
    #1;
    `assert_eq(s_out, 1)
    `assert_eq(c_out, 0)
    a_in = 1; b_in = 1;
    #1;
    `assert_eq(s_out, 0)
    `assert_eq(c_out, 1)
    $display("[INFO] %m is passed!");
  end
endmodule
