`include "common.vh"

`define DATA_MEM_SIZE 512

module data_memory(
  input wire [`WIDTH-1:0] addr_in,
  input wire [`WIDTH-1:0] write_data_in,
  input wire write_enable_in,
  input wire clk_in,
  output reg [`WIDTH-1:0] read_data_out
);
  reg [`WIDTH-1:0] data_mem[`DATA_MEM_SIZE];

  initial begin : data_mem_init
    integer i;
    for (i = 0; i < `DATA_MEM_SIZE; i = i+1)
      data_mem[i] <= 0;
  end

  assign read_data_out = data_mem[addr_in];
  always @(posedge clk_in) begin
    if (write_enable_in) data_mem[addr_in] <= write_data_in;
  end
endmodule

