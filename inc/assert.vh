`ifndef TESTBENCH_VH
`define TESTBENCH_VH

`define assert_eq(signal, value) \
  if (signal !== value) begin \
    $display("[INFO] ASSERTION FAILED in %m: expected signal to be %b, but actual %b", signal, value); \
    $finish; \
  end

`endif
