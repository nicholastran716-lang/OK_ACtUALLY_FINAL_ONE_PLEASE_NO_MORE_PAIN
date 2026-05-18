`timescale 1ns / 1ps
module user_top_stopwatch_v1 #(
    /* verilator lint_off UNUSEDPARAM */
    parameter int CYCLES_PER_SECOND = 50_000_000
    /* verilator lint_on UNUSEDPARAM */
) (
    input logic clk,
    /* verilator lint_off UNUSED */
    input logic [3:0] button,
    input logic [9:0] sw,
    /* verilator lint_on UNUSED */
    output logic [9:0] led,
    output logic [6:0] hours_disp,
    output logic [6:0] minutes_disp,
    output logic [6:0] seconds_disp,
    output logic blank_hours,
    output logic blank_minutes,
    output logic blank_seconds
);

  assign led = '0;
  assign blank_hours = 0;
  assign blank_minutes = 0;
  assign blank_seconds = 0;

  logic rise0;
  logic rise1;
  rising_edge_detector u_button_0 (
      .clk(clk),
      .sig_in(button[0]),
      .rise(rise0)
  );
  rising_edge_detector u_button_1 (
      .clk(clk),
      .sig_in(button[1]),
      .rise(rise1)
  );

  logic lap_hold;
  logic [6:0] minutes;
  logic [5:0] seconds;
  logic [6:0] centiseconds;
  snapshot_mux #(
      .WIDTH(21)
  ) u_snapshot_mux (
      .clk(clk),
      .hold(lap_hold),
      .d({minutes, 1'b0, seconds, centiseconds}),
      .q({hours_disp, minutes_disp, seconds_disp})
  );

  logic counter_rst;
  logic counter_enable;
  stopwatch_control u_stopwatch_control (
      .clk(clk),
      .rise_start_stop(rise0),
      .rise_lap(rise1),
      .counter_rst(counter_rst),
      .counter_enable(counter_enable),
      .lap_hold(lap_hold)
  );

  stopwatch_counter #(
      .CYCLES_PER_SECOND(CYCLES_PER_SECOND)
  ) u_stopwatch_counter (
      .clk(clk),
      .rst(counter_rst),
      .enable(counter_enable),
      .minutes(minutes),
      .seconds(seconds),
      .centiseconds(centiseconds)
  );

endmodule
