`include "common.vh"
`include "assert.vh"

`define SAMPLE_SIZE 100

module program_counter_tb;
  reg [`WIDTH-1:0] addr_in;
  reg clk_in;
  wire [`WIDTH-1:0] addr_out;

  program_counter pc_dut (
    .addr_in (addr_in),
    .clk_in  (clk_in),
    .addr_out(addr_out)
  );

  initial fork
    $dumpvars();
    clk_in = 1'b0;
    forever #1 clk_in = ~clk_in;
  join

  integer i;
  initial begin
    for (i = 0; i < `SAMPLE_SIZE; i = i+1) begin
      addr_in = $unsigned($random);
      @(negedge clk_in);
      `assert_eq(addr_out, addr_in)
    end
    $display("%m is passed!");
    $finish;
  end
endmodule
