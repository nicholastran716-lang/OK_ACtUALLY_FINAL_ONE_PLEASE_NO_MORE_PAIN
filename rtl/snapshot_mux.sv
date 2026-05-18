`timescale 1ns / 1ps

module snapshot_mux #(
    parameter int WIDTH = 1
) (
    input logic clk,
    input logic hold,
    input logic [WIDTH -1:0] d,
    output logic [WIDTH -1:0] q
);
  logic [WIDTH - 1:0] temp_d = 0;

  always_comb begin
    if (hold) q = temp_d;
    else q = d;
  end

  always_ff @(posedge clk) begin
    if (!hold) temp_d <= d;
  end

endmodule
