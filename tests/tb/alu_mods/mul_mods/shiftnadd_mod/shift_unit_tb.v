`include "common.vh"
`include "assert.vh"

module shift_unit_tb;
  reg s_in, s_set_in, clk, rstn, set;
  wire s_out, sn_out;

  shift_unit su_dut (
    .s_in    (s_in),
    .s_set_in(s_set_in),
    .clk     (clk),
    .rstn    (rstn),
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
    rstn = 1'b0;
    #1 rstn = 1'b1;
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

