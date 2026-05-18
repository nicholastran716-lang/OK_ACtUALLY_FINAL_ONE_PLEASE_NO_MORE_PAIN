
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
  logic [WIDTH - 1 : 0] next_count;

  // Use a single initial for clarity
  initial count = WIDTH'(0);

  always_ff @(posedge clk) begin

    if (enable) count <= next_count;
    if (rst) count <= '0;
  end

  always_comb begin
    next_count = count;
    if (up) begin
      next_count = (count < WIDTH'(MAX)) ? count + WIDTH'(1) : WIDTH'(0);
    end else begin
      next_count = (count > WIDTH'(0)) ? count - WIDTH'(1) : WIDTH'(MAX);
    end
  end
endmodule

