`timescale 1ns / 1ps

module rising_edge_detector (
    input clk,
    input sig_in,
    output reg rise
);
  reg sign_in_before;

  always @(posedge clk) begin
    sign_in_before <= sig_in;
  end

  assign rise = sig_in && !sign_in_before;
endmodule
