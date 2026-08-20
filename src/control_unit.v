module control_unit(
  input wire zero_in,
  input wire [6:0] op_in,
  input wire [14:12] funct3_in,
  input wire funct7_bit5_in,
  output wire pc_src_sel_out,
  output wire [1:0] res_src_sel_out,
  output wire mem_write_out,
  output wire alu_src_sel_out,
  output wire [1:0] imm_src_sel_out,
  output wire reg_write_out,
  output wire [2:0] opctrl_out
);
  wire br_int, jmp_int;
  wire [1:0] alu_op_int;

  assign pc_src_sel_out = (zero_in & br_int) | jmp_int;

  main_decoder m_dec (
    .op_in          (op_in),
    .res_src_sel_out(res_src_sel_out),
    .mem_write_out  (mem_write_out),
    .alu_src_sel_out(alu_src_sel_out),
    .imm_src_sel_out(imm_src_sel_out),
    .reg_write_out  (reg_write_out),
    .br_out         (br_int),
    .jmp_out        (jmp_int),
    .alu_op_out     (alu_op_int)
  );

  alu_decoder alu_dec (
    .alu_op_in     (alu_op_int),
    .op_in         (op_in),
    .funct3_in     (funct3_in),
    .funct7_bit5_in(funct7_bit5_in),
    .opctrl_out    (opctrl_out)
  );
endmodule

