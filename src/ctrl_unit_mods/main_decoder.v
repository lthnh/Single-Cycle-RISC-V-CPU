`define LW 7'b0000011
`define SW 7'b0100011
`define R_TYPE 7'b0110011
`define BEQ 7'b1100011
`define ADDI 7'b0010011
`define JAL 7'b1101111

module main_decoder(
  input wire [6:0] op_in,
  output reg [1:0] res_src_sel_out,
  output reg mem_write_out,
  output reg alu_src_sel_out,
  output reg [1:0] imm_src_sel_out,
  output reg reg_write_out,
  output reg br_out,
  output reg jmp_out,
  output reg [1:0] alu_op_out
);
  always @* begin
    case (op_in)
      `LW: begin
        reg_write_out = 1'b1;
        imm_src_sel_out = 2'b00;
        alu_src_sel_out = 1'b1;
        mem_write_out = 1'b0;
        res_src_sel_out = 2'b01;
        br_out = 2'b00;
        alu_op_out = 2'b00;
        jmp_out = 1'b0;
      end
      `SW: begin
        reg_write_out = 1'b0;
        imm_src_sel_out = 2'b01;
        alu_src_sel_out = 1'b1;
        mem_write_out = 1'b1;
        br_out = 1'b0;
        alu_op_out = 2'b00;
        jmp_out = 1'b0;
      end
      `R_TYPE: begin
        reg_write_out = 1'b1;
        alu_src_sel_out = 1'b0;
        mem_write_out = 1'b0;
        res_src_sel_out = 2'b00;
        br_out = 1'b0;
        alu_op_out = 2'b10;
        jmp_out = 1'b0;
      end
      `BEQ: begin
        reg_write_out = 1'b0;
        imm_src_sel_out = 2'b10;
        alu_src_sel_out = 1'b0;
        mem_write_out = 1'b0;
        br_out = 1'b1;
        alu_op_out = 2'b01;
        jmp_out = 1'b0;
      end
      `ADDI: begin
        reg_write_out = 1'b1;
        imm_src_sel_out = 2'b00;
        alu_src_sel_out = 1'b01;
        mem_write_out = 1'b0;
        res_src_sel_out = 2'b00;
        br_out = 1'b0;
        alu_op_out = 2'b10;
        jmp_out = 1'b0;
      end
      `JAL: begin
        reg_write_out = 1'b1;
        imm_src_sel_out = 2'b11;
        mem_write_out = 1'b0;
        res_src_sel_out = 2'b10;
        br_out = 1'b0;
        jmp_out = 1'b1;
      end
      default:;
    endcase
  end
endmodule

