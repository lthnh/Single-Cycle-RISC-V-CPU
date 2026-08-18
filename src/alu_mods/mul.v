`include "common.vh"

`define MUL_SHIFT_AND_ADD_IMPL

module mul(
  input wire [`WIDTH-1:0] operand_a_in,
  input wire [`WIDTH-1:0] operand_b_in,
  input wire clk,
  input wire rstn,
  output wire [(2*`WIDTH)-1:0] result_out,
  output wire busy
);
`ifdef MUL_SHIFT_AND_ADD_IMPL
  reg set;
  reg [(2*`WIDTH)-1:0] accumulator;
  wire [(2*`WIDTH)-1:0] operand_a_int;
  integer counter;

  shift_reg shift_reg (
    .n_in (operand_a_in),
    .clk  (clk),
    .rstn (rstn),
    .set  (set),
    .n_out(operand_a_int),
    .busy (busy)
  );

  always @(negedge rstn) begin
    if (!rstn) begin
      accumulator <= 2*`WIDTH'b0;
      counter <= 0; 
    end
  end
  
  always @* begin
    if (rstn && !busy)
      set = 1'b1;
    else
      set = 1'b0;
  end

  always @(posedge clk) begin
    if (counter < `WIDTH && rstn && busy && !set) begin
      if (operand_b_in[counter] == 1'b1) accumulator <= accumulator + operand_a_int;
      counter <= counter + 1;
    end else 
      counter <= 0;
  end


  assign result_out = accumulator;
`endif
endmodule
