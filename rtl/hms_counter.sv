`timescale 1ns / 1ps

module hms_counter #(
    parameter int N_HOURS   = 24,  // number of hours
    parameter int N_MINUTES = 60,  // number of minutes
    parameter int N_SECONDS = 60,  // number of seconds

    // Output port widths
    parameter int W_HOURS   = 5,
    parameter int W_MINUTES = 6,
    parameter int W_SECONDS = 6
) (
    input logic clk,
    input logic enable,
    output logic [W_HOURS - 1:0] hours,
    output logic [W_MINUTES - 1:0] minutes,
    output logic [W_SECONDS - 1:0] seconds
);
  logic [0:0] second_rollover;
  logic [0:0] minute_rollover;

  localparam logic [W_SECONDS - 1:0] Nseconds = W_SECONDS'(N_SECONDS - 1);
  localparam logic [W_MINUTES - 1:0] Nminutes = W_MINUTES'(N_MINUTES - 1);

  up_down_counter #(
      .MAX  (N_SECONDS - 1),
      .WIDTH(W_SECONDS)
  ) u_second (
      .clk(clk),
      .enable(enable),
      .up(1'b1),
      .count(seconds)
  );
  up_down_counter #(
      .MAX  (N_MINUTES - 1),
      .WIDTH(W_MINUTES)
  ) u_minute (
      .clk(clk),
      .enable(second_rollover),
      .up(1'b1),
      .count(minutes)
  );
  up_down_counter #(
      .MAX  (N_HOURS - 1),
      .WIDTH(W_HOURS)
  ) u_hour (
      .clk(clk),
      .enable(minute_rollover),
      .up(1'b1),
      .count(hours)
  );

  // takes into accounting rounding issues: i.e. in N-minuts is 60, so from 0 to 59. But at exactly 60, it should roll over to 0.
  assign second_rollover = enable && (seconds == Nseconds);
  assign minute_rollover = (minutes == Nminutes) && second_rollover;

endmodule

