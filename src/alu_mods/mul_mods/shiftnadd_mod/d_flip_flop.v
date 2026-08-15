module d_flip_flop(
  input wire D_in, clk, rstn,
  output reg Q_out, 
  output wire Qn_out
);
  assign Qn_out = ~Q_out;

  always @(posedge clk or negedge rstn) begin
    if (rstn) begin
      Q_out <= D_in;
    end else begin
      Q_out <= 1'b0;
    end
  end
endmodule

