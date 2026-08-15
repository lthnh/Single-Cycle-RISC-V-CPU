`include "common.vh"

module shift_reg(
  input wire [`WIDTH-1:0] n_in,
  input wire clk,
  input wire rstn,
  input wire set,
  output wire [`WIDTH-1:0] n_out,
  output reg busy
);
  wire [`WIDTH:0] s_int;
  integer counter;

  assign s_int[0] = 1'b0;

  genvar i;
  for (i = 0; i < `WIDTH; i = i+1) begin : chain_shift_reg_unit
    shift_unit su (
      .s_in    (s_int[i]),
      .s_set_in(n_in[i]),
      .clk     (clk),
      .rstn    (rstn),
      .set     (set),
      .s_out   (s_int[i+1]),
      .sn_out  ()
    );
  end

  always @(posedge clk) begin
    if (set) begin
      counter = `WIDTH;
      busy = 1'b1;
    end else begin
      if (counter > 0)
        counter = counter - 1;
      else
        busy = 1'b0;
    end
  end

  assign n_out = s_int[`WIDTH:1];
endmodule

