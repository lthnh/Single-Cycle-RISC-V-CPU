module d_flip_flop(
  input wire D_in,
  input wire clk,
  input wire rst,
  output reg Q_out,
  output reg Qn_out
);
  always @(posedge clk or posedge rst) begin
    if (!rst) begin
      Q_out <= D_in;
      Qn_out <= ~D_in;
    end else begin
      Q_out <= 1'b0;
      Qn_out <= 1'b1;
    end
  end
endmodule

