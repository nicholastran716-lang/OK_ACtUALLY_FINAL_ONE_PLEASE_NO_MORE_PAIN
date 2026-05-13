
`timescale 1ns / 1ps
module up_down_counter_rst #(
    parameter int MAX   = 2,
    parameter int WIDTH = 2
) (
    input logic clk,
    input logic rst,
    input logic enable,
    input logic up,
    output logic [WIDTH -1:0] count
);

  // Fix: Ensure Max is explicitly the size of WIDTH to prevent comparison issues
  localparam logic [WIDTH - 1:0] Max = WIDTH'(MAX);
  logic [WIDTH - 1 : 0] next_count;

  // Use a single initial for clarity
  initial count = WIDTH'(0);

  always_ff @(posedge clk) begin
    if (rst) begin
      count <= WIDTH'(0);
    end else if (enable) begin
      count <= next_count;
    end
  end

  always_comb begin
    if (up) begin
      // Logic Check: If count is already at Max, wrap to 0
      if (count >= Max) begin
        next_count = WIDTH'(0);
      end else begin
        next_count = count + WIDTH'(1);
      end
    end else begin


      // Logic Check: If count is at 0, wrap to Max
      if (count == WIDTH'(0)) begin
        next_count = Max;
      end else begin
        next_count = count - WIDTH'(1);
      end
    end

  end
endmodule

