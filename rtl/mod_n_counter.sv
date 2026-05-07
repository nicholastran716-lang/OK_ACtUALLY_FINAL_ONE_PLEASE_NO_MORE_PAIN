`timescale 1ns / 1ps

module mod_n_counter #(
    parameter int N = 4,
    parameter int WIDTH = 2
) (
    input logic clk,
    input logic enable,
    input logic rst,
    output logic [WIDTH - 1:0] count
);
  localparam logic [WIDTH - 1:0] MaxCount = WIDTH'(N - 1);
  logic [WIDTH - 1:0] next_count;
  initial count = 0;

  always_ff @(posedge clk) begin
    if (rst) begin
      count <= 0;
    end else if (enable) begin
      count <= next_count;
    end
  end

  always_comb begin
    next_count = count;
    if (enable) begin
      if (count == MaxCount) begin
        next_count = 0;
      end else begin
        next_count = count + 1;
      end
    end
  end

endmodule
