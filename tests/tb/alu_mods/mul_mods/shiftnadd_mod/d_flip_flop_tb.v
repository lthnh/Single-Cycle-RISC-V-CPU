`include "common.vh"
`include "assert.vh"

module d_flip_flop_tb;
  reg D_in, clk, rstn;
  wire Q_out, Qn_out;

  d_flip_flop dff_dut (
    .D_in  (D_in),
    .clk   (clk),
    .rstn   (rstn),
    .Q_out (Q_out),
    .Qn_out(Qn_out)
  );

  initial begin
    $dumpvars(0, dff_dut);
    D_in = 1'b0;
    clk = 1'b0;
    rstn = 1'b0;
    #1;
    rstn = 1'b1;
  end

  initial begin
    forever begin
      #1 clk = ~clk;
    end
  end

  initial begin
    #3;
    D_in = 1'b1;
    #2;
    D_in = 1'b0;
    #2;
    D_in = 1'b1;
    #2;
    rstn = 1'b0;
  end

  initial begin
    #4;
    `assert_eq(Q_out, 1'b1)
    #2;
    `assert_eq(Q_out, 1'b0)
    #2;
    `assert_eq(Q_out, 1'b1)
    #2;
    `assert_eq(Q_out, 1'b0)
    $display("%m is passed!");
    $finish;
  end
endmodule
