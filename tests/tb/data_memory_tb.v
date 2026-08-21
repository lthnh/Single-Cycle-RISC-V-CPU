`include "common.vh"
`include "assert.vh"

module data_memory_tb;
  reg [`WIDTH-1:0] addr_in, write_data_in;
  reg write_enable_in, clk_in;
  wire [`WIDTH-1:0] read_data_out;

  data_memory dm_dut (
    .addr_in        (addr_in),
    .write_data_in  (write_data_in),
    .write_enable_in(write_enable_in),
    .clk_in         (clk_in),
    .read_data_out  (read_data_out)
  );

  integer i;
  initial fork
    $dumpvars();
    clk_in = 1'b0;
    forever #1 clk_in = ~clk_in;
  join

  initial begin
    write_enable_in = 1'b1;
    for (i = 0; i < 512; i = i+1) begin
      @(negedge clk_in);
      addr_in = $unsigned(i);
      write_data_in = $unsigned(i);
    end
    @(negedge clk_in);
    write_enable_in = 1'b0;
    for (i = 0; i < 512; i = i+1) begin
      @(negedge clk_in);
      addr_in = $unsigned(i);
      @(posedge clk_in);
      `assert_eq(read_data_out, $unsigned(i))
    end
    $display("%m is passed!");
    $finish;
  end
endmodule
