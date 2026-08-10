`ifndef TESTBENCH_VH
`define TESTBENCH_VH

`define assert_eq(signal, value) \
  if (signal !== value) begin \
    $display("[INFO] ASSERTION FAILED in %m: expected signal to be %b, but actual %b", value, signal); \
    $finish; \
  end

`define assert_eq_fmt(signal, value, format) \
  if (signal !== value) begin \
    $display("[INFO] ASSERTION FAILED in %m: expected signal to be format, but actual format", value, signal); \
    $finish; \
  end

`endif
