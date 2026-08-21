`include "common.vh"
`include "assert.vh"

module instruction_memory_tb;
  reg [`WIDTH-1:0] addr_in, instr_in;
  reg prog_enable_in, clk_in;
  wire [`WIDTH-1:0] instr_out;

  instruction_memory im_dut (
    .addr_in       (addr_in),
    .clk_in        (clk_in),
    .prog_enable_in(prog_enable_in),
    .instr_in      (instr_in),
    .instr_out     (instr_out)
  );

  initial fork
    $dumpvars();
    clk_in = 0;
    forever #1 clk_in = ~clk_in;
  join

  integer i, j;
  initial begin
    prog_enable_in = 1'b1;
    for (i = 0; i < 256; i = i+1) begin
      @(negedge clk_in);
      addr_in = $unsigned(i);
      instr_in = $unsigned(i);
    end
    @(negedge clk_in);
    prog_enable_in = 1'b0;
    for (j = 0; j < 256; j = j+1) begin
      @(negedge clk_in);
      addr_in = $unsigned(j);
      @(posedge clk_in);
      `assert_eq(instr_out, j)
    end
    $display("%m is passed!");
    $finish;
  end
endmodule
