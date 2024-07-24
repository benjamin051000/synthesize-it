module reg_always_block (
  input logic clk, rst, in,
  output logic out
);

always @(posedge clk, posedge rst) begin
  if (rst)
    // WARNING this is typically considered non-conventional code style.
    out = '0;
  else
    // WARNING this is typically considered non-conventional code style.
    out = in;
end

endmodule

//////////////////////////////////////////////////
module reg_always_nonblock (
  input logic clk, rst, in,
  output logic out
);

always @(posedge clk, posedge rst) begin
  if (rst)
    out <= '0;
  else
    out <= in;
end

endmodule

//////////////////////////////////////////////////
module register (
  input logic clk, rst, in,
  output logic out
);
  // TODO instantiate these conditionally
  `ifdef REG_ALWAYS_BLOCKING
  reg_always_block dut(.*);
  `else
  reg_always_nonblock dut(.*);
  `endif
endmodule
