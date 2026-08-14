`include "common.vh"
`include "alu_submods/cla_mod/cla.vh"
`include "assert.vh"

module four_bit_cla_tb;
  reg [`CLA_SUBCOMPONENT_BIT_WIDTH-1:0] a_in, b_in;
  reg c_in;
  wire [`CLA_SUBCOMPONENT_BIT_WIDTH-1:0] s_out;
  wire c_out;

  four_bit_cla fbc_dut (
    .a_in (a_in),
    .b_in (b_in),
    .c_in (c_in),
    .s_out(s_out),
    .c_out(c_out)
  );

  reg [`CLA_SUBCOMPONENT_BIT_WIDTH:0] sum_ref;
  always @* begin : sum_ref_gen
    sum_ref = a_in + b_in + {{(`CLA_SUBCOMPONENT_BIT_WIDTH-1){1'b0}}, c_in};
  end

  integer i, j, k;
  initial begin : fbc_tb
    for (i = 0; i < 16; i = i+1) begin
      for (j = 0; j < 16; j = j+1) begin
        for (k = 0; k < 2; k = k+1) begin
          a_in = i[3:0]; b_in = j[3:0]; c_in = k[0];
          #1;
          `assert_eq(s_out, sum_ref[3:0])
          `assert_eq(c_out, sum_ref[4])
        end
      end
    end
    $display("[INFO] %m is passed!");
  end
endmodule
