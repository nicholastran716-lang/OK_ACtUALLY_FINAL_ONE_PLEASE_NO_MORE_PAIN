`include "rtl/mod_n_counter.sv"
`timescale 1ns / 1ps

module restartable_rate_generator #(
    parameter int CYCLE_COUNT = 2
) (
    input  logic clk,
    input  logic run,
    output logic tick
);
  logic tick_quantifier;
  logic running = 1'b0;

  always_ff @(posedge clk) running <= run;

  assign tick = running && tick_quantifier;

  generate
    if (CYCLE_COUNT > 1) begin : g_general
      localparam int CountWidth = $clog2(CYCLE_COUNT);
      logic rst_count;
      logic enable_count;
      logic [CountWidth - 1:0] count;

      mod_n_counter #(
          .N(CYCLE_COUNT),
          .WIDTH(CountWidth)
      ) u_count (
          .clk(clk),
          .enable(enable_count),
          .rst(rst_count),
          .count(count)
      );

      assign rst_count = !run;
      assign enable_count = run;
      assign tick_quantifier = (CountWidth'(CYCLE_COUNT - 1) == count);
    end else begin : g_special
      assign tick_quantifier = 1'b1;
    end
  endgenerate
endmodule
