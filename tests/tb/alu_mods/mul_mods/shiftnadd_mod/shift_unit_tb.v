`include "common.vh"
`include "assert.vh"

module shift_unit_tb;
  reg s_in, s_set_in, clk, rst, set;
  wire s_out, sn_out;

  shift_unit su_dut (
    .s_in    (s_in),
    .s_set_in(s_set_in),
    .clk     (clk),
    .rst     (rst),
    .set     (set),
    .s_out   (s_out),
    .sn_out  (sn_out)
  );

  initial fork
    $dumpvars(0, su_dut);
    s_in = 1'b0;
    s_set_in = 1'b0;
    clk = 1'b0;
    set = 1'b0;
    rst = 1'b1;
    #1 rst = 1'b0;
    forever #1 clk = ~clk;
  join

  initial begin
    #2 s_in = 1'b1;
    #2 `assert_eq(s_out, 1'b1)
    set = 1'b1;
    #2 `assert_eq(s_out, 1'b0)
    $display("%m is passed!");
    $finish;
  end
endmodule

