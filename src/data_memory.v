`include "common.vh"

`define DATA_MEM_SIZE 512

module data_memory(
  input wire [`WIDTH-1:0] addr_in,
  input wire [`WIDTH-1:0] write_data_in,
  input wire write_enable_in,
  input wire clk_in,
  output wire [`WIDTH-1:0] read_data_out
);
  reg [`WIDTH-1:0] data_mem[`DATA_MEM_SIZE-1:0];

  assign read_data_out = data_mem[addr_in];

  always @(posedge clk_in) begin
    if (write_enable_in) data_mem[addr_in] <= write_data_in;
  end
endmodule

