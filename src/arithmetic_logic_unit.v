`include "common.vh"

`define ALU_OP_SIZE 3 // We will begin by implementing only 5 basic instructions: add, sub, and, or, slt.
`define ADD `ALU_OP_SIZE'b000
`define SUB `ALU_OP_SIZE'b001
`define AND `ALU_OP_SIZE'b010
`define OR  `ALU_OP_SIZE'b011
`define LT  `ALU_OP_SIZE'b101

module arithmetic_logic_unit(
  input wire [`WIDTH-1:0] operand_a_in, operand_b_in,
  input wire [`ALU_OP_SIZE-1:0] operation_control_in,
  output reg [`WIDTH-1:0] result_out,
  output reg zero
);

  always @* begin
    case (operation_control_in)
      `ADD: result_out = operand_a_in + operand_b_in;
      `SUB: begin
        result_out = operand_a_in - operand_b_in;
        if (result_out == 0)
          zero = 1'b1;
        else
          zero = 1'b0;
      end
      `AND: result_out = operand_a_in & operand_b_in;
      `OR : result_out = operand_a_in | operand_b_in;
      `LT : result_out = {`WIDTH{operand_a_in < operand_b_in}};
      default:;
    endcase
  end

endmodule
