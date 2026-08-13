module overflow(
  input wire operand_a_sign_in,
  input wire operand_b_sign_in,
  input wire result_sign_in,
  input wire [6:0] opcode_in,
  input wire [31:25] funct7_in,
  output reg overflow_signal_out
);

always @* begin
  case (opcode_in)
    7'b0110011, 7'b0010011: begin: ovf_add_addi_sub
      // positive + positive = negative or negative + negative = positive
      if (operand_a_sign_in == operand_b_sign_in && operand_a_sign_in == ~result_sign_in && ~funct7_in[30])
        overflow_signal_out = 1'b1;
      // positive - negative = negative or negative - positive = positive
      else if (operand_a_sign_in != operand_b_sign_in && operand_b_sign_in == result_sign_in && funct7_in[30])
        overflow_signal_out = 1'b1;
      else
        overflow_signal_out = 1'b0;
    end
    default:
      overflow_signal_out = 1'b0;
  endcase
end

endmodule

