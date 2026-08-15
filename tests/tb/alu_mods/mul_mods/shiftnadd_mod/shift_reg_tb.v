`include "common.vh"
`include "assert.vh"

module shift_reg_tb;
  reg [`WIDTH-1:0] n_in;
  reg clk, rstn, set;
  wire [`WIDTH-1:0] n_out;
  wire busy;

  shift_reg sr_dut (
    .n_in (n_in),
    .clk  (clk),
    .rstn (rstn),
    .set  (set),
    .n_out(n_out),
    .busy (busy)
  );

  initial fork
    $dumpvars();
    clk = 1'b0;
    set = 1'b0;
    rstn = 1'b0;
    #1 rstn = 1'b1;
  join

  initial begin
    forever #1 clk = ~clk;
  end

  integer i;
  initial begin
    #1 n_in = `WIDTH'b010100110011;
    #1 set = 1'b1;
    #2 set = 1'b0;
    for (i = 0; i < `WIDTH; i = i+1) begin
      `assert_eq(n_out, n_in << i)
      `assert_eq(busy, 1'b1)
      #2;
    end
    $display("%m is passed!");
    $finish;
  end
endmodule

