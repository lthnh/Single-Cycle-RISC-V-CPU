`include "common.vh"

module program_counter (
  input wire [`WIDTH-1:0] addr_in,
  input wire clk_in,
  output reg [`WIDTH-1:0] addr_out
);
  always @(posedge clk_in) begin
    addr_out <= addr_in;
  end
endmodule

