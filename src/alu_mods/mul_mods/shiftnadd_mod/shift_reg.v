`include "common.vh"

module shift_reg(
  input wire [`WIDTH-1:0] n_in,
  input wire clk,
  input wire rstn,
  input wire set,
  output wire [(2*`WIDTH)-1:0] n_out,
  output reg busy
);
  wire [(2*`WIDTH)-1:0] n_int;
  wire [2*`WIDTH:0] s_int;
  integer counter;

  assign n_int[`WIDTH-1:0] = n_in;
  assign n_int[(2*`WIDTH)-1:`WIDTH] = `WIDTH'b0;
  assign s_int[0] = 1'b0;

  genvar i;
  for (i = 0; i < 2*`WIDTH; i = i+1) begin : chain_shift_reg_unit
    shift_unit su (
      .s_in    (s_int[i]),
      .s_set_in(n_int[i]),
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

  assign n_out = s_int[2*`WIDTH:1];
endmodule

