`timescale 1ns/1ps

`include "alu_submods/cla_mod/cla.vh"
`include "assert.vh"

module four_bit_lookahead_tb;
  reg [`CLA_SUBCOMPONENT_BIT_WIDTH-1:0] g_in, p_in;
  reg c_in;
  wire [4:1] c_out;

  four_bit_lookahead fbl_dut (
    .g_in (g_in),
    .p_in (p_in),
    .c_in (c_in),
    .c_out(c_out)
  );

  wire [`CLA_SUBCOMPONENT_BIT_WIDTH:0] c_ref;

  assign c_ref[0] = c_in;

  genvar i;
  for (i = 0; i < `CLA_SUBCOMPONENT_BIT_WIDTH; i = i+1) begin : c_ref_gen
    assign c_ref[i+1] = g_in[i] | (p_in[i] & c_ref[i]);
  end

  integer j, k, f;
  initial begin : fbl_tb
    for (f = 0; f < 16; f = f+1) begin
      for (j = 0; j < 16; j = j+1) begin
        for (k = 0; k < 2; k = k+1) begin
          g_in = f[3:0]; p_in = j[3:0]; c_in = k[0];
          #1;
          `assert_eq(c_out[1], c_ref[1])
          `assert_eq(c_out[2], c_ref[2])
          `assert_eq(c_out[3], c_ref[3])
          `assert_eq(c_out[4], c_ref[4])
        end
      end
    end
    $display("[INFO] %m is passed!");
  end
endmodule
