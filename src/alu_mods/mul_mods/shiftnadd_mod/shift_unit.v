module shift_unit(
  input wire s_in,
  input wire s_set_in,
  input wire clk,
  input wire rst,
  input wire set,
  output wire s_out,
  output wire sn_out
);
  wire D_int;

  d_flip_flop dff (
    .D_in  (D_int),
    .clk   (clk),
    .rst   (rst),
    .Q_out (s_out),
    .Qn_out(sn_out)
  );

  mux21 m21 (
    // The order is from right to left as defined by s_in [1:0]
    .s_in  ({s_set_in, s_in}),
    .sel_in(set),
    .s_out (D_int)
  );
endmodule

