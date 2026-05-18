`timescale 1ns / 1ps

module stopwatch_control (
    input  logic clk,
    input  logic rise_start_stop,
    input  logic rise_lap,
    output logic counter_rst = '0,
    output logic counter_enable = '0,
    output logic lap_hold = '0
);

  logic counter_enable_next;
  logic counter_rst_next;
  logic lap_hold_next;

  always_ff @(posedge clk) begin
    counter_enable <= counter_enable_next;
    counter_rst <= counter_rst_next;
    lap_hold <= lap_hold_next;
  end

  logic valid_start;
  logic valid_lap;

  //check if start is valid
  assign valid_start = rise_start_stop && !rise_lap;
  assign valid_lap = !rise_start_stop && rise_lap;

  // check next state
  assign counter_enable_next = valid_start ? !counter_enable : counter_enable;
  assign counter_rst_next = !counter_rst && !counter_enable && valid_lap && !lap_hold;


  always_comb begin
    lap_hold_next = lap_hold;
    if (valid_lap) begin
      if (!counter_enable && !lap_hold) begin
        lap_hold_next = '0;
      end else lap_hold_next = !lap_hold;
    end
  end

endmodule
