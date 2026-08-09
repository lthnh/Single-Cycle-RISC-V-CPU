`include "common.vh"

module single_cycle_cpu(
  input wire clk_in
);
  wire [`WIDTH-1:0] addr_instr, curr_instr, imm_ext;

  program_counter pc (
    .addr_in (),
    .clk_in  (clk_in),
    .addr_out(addr_instr)
  );

  instruction_memory instr_mem (
    .addr_in  (addr_instr),
    .instr_out(curr_instr)
  );

  register_file reg_file (
    .addr1_in        (curr_instr[19:15]),
    .addr2_in        (addr2_in),
    .addr3_in        (addr3_in),
    .word_data3_in   (word_data3_in),
    .write_enable3_in(write_enable3_in),
    .clk_in          (clk_in),
    .word_data1_out  (word_data1_out),
    .word_data2_out  (word_data2_out)
  );

  immediate_sign_extend imm_sign_ext (
     .imm_in     (curr_instr[31:20]),
     .imm_ext_out(imm_ext)
   );
endmodule

module immediate_sign_extend(
  input wire [11:0] imm_in,
  output wire [`WIDTH-1:0] imm_ext_out
);
  assign imm_ext_out = { {20{imm_in[11]}}, imm_in };
endmodule

