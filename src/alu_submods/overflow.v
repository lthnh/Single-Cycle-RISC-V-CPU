module overflow(
  input wire operand_a_sign,
  input wire operand_b_sign,
  input wire result_sign,
  input wire [6:0] opcode,
  input wire [31:25] funct7,
  output reg overflow_signal
);

always @* begin
  case (opcode)
    7'b0110011, 7'b0010011: begin: ovf_add_addi_sub
      // positive + positive = negative or negative + negative = positive
      if (operand_a_sign == operand_b_sign && operand_a_sign == ~result_sign && ~funct7[30])
        overflow_signal = 1'b1;
      // positive - negative = negative or negative - positive = positive
      else if (operand_a_sign != operand_b_sign && operand_b_sign == result_sign && funct7[30])
        overflow_signal = 1'b1;
      else
        overflow_signal = 1'b0;
    end
    default:
      overflow_signal = 1'b0;
  endcase
end

endmodule

