`include "common.vh"
`include "assert.vh"

`define SAMPLE_SIZE 100

module mul_tb;
  reg [`WIDTH-1:0] operand_a_in, operand_b_in;
  reg clk, rstn;
  wire [(2*`WIDTH)-1:0] result_out;
  wire busy;

  wire [(2*`WIDTH)-1:0] result_ref;

  mul m_dut (
    .operand_a_in(operand_a_in),
    .operand_b_in(operand_b_in),
    .clk         (clk),
    .rstn        (rstn),
    .result_out  (result_out),
    .busy        (busy)
  );

  assign result_ref = operand_a_in * operand_b_in;

  initial fork
    $dumpvars(0, mul_tb);
    rstn = 1'b1;
    clk = 1'b0;
    forever #1 clk = ~clk;
  join

  integer i;
  initial begin
    for (i = 0; i < `SAMPLE_SIZE; i = i+1) begin
      @(negedge clk);
      operand_a_in = $unsigned($random);
      operand_b_in = $unsigned($random);
      rstn = 1'b0;
      @(negedge clk);
      rstn = 1'b1;
      @(posedge busy);
      @(negedge busy);
      `assert_eq(result_out, result_ref)
    end
    $display("%m is passed!");
    $finish;
  end
endmodule

