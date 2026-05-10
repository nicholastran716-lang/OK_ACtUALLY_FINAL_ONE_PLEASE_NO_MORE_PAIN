`timescale 1ns / 1ps
// ------------------------------------------------------------------
// WARNING: This file is used by the automated test suite. Do not
// modify it.
//
// This file also serves as a template for your own designs. To use
// it:
//   1. Copy the entire contents into a new file with a descriptive
//      name.
//   2. Delete the test logic below and replace it with your own
//      code.
//   3. In top_de1_soc, change the module name from user_top to your
//      new module name.
//
//   The board wrapper sets CYCLES_PER_SECOND; use this parameter in
//   your design wherever timing is needed.
// ------------------------------------------------------------------
`timescale 1ns / 1ps

module user_top_watch_v1 #(
    /* verilator lint_off UNUSEDPARAM */
    parameter int CYCLES_PER_SECOND = 50_000_000
    /* verilator lint_on UNUSEDPARAM */
) (
    input logic clk,
    input logic [3:0] button,
    input logic [9:0] sw,
    output logic [9:0] led,
    output logic [6:0] hours_disp,
    output logic [6:0] minutes_disp,
    output logic [6:0] seconds_disp,
    output logic blank_hours,
    output logic blank_minutes,
    output logic blank_seconds
);
  logic seconds_tick;
  logic seconds_edit;
  logic seconds_inc;
  logic seconds_dec;
  logic [5:0] seconds;

  restartable_rate_generator #(
      .CYCLE_COUNT(CYCLES_PER_SECOND)
  ) u_restartable_rate_generator (
      .clk (clk),
      .run (1'b1),
      .tick(seconds_tick)
  );

  editable_counter #(
      .N(60),
      .WIDTH(6)
  ) u_editable_counter_sec (
      .clk(clk),
      .tick(seconds_tick),
      .edit_mode(seconds_edit),
      .inc(seconds_inc),
      .dec(seconds_dec),
      .count(seconds)
  );


  logic minutes_tick;
  logic minutes_edit;
  logic minutes_inc;
  logic minutes_dec;
  logic [5:0] minutes;

  editable_counter #(
      .N(60),
      .WIDTH(6)
  ) u_editable_counter_min (
      .clk(clk),
      .tick(minutes_tick),
      .edit_mode(minutes_edit),
      .inc(minutes_inc),
      .dec(minutes_dec),
      .count(minutes)
  );

  logic hours_tick;
  logic hours_edit;
  logic hours_inc;
  logic hours_dec;
  logic [4:0] hours;

  editable_counter #(
      .N(24),
      .WIDTH(5)
  ) u_editable_counter_hour (
      .clk(clk),
      .tick(hours_tick),
      .edit_mode(hours_edit),
      .inc(hours_inc),
      .dec(hours_dec),
      .count(hours)
  );

  assign seconds_edit = 1'b0;
  assign minutes_edit = 1'b0;
  assign hours_edit = 1'b0;
  assign seconds_inc = 1'b0;
  assign seconds_dec = 1'b0;
  assign minutes_inc = 1'b0;
  assign minutes_dec = 1'b0;
  assign hours_inc = 1'b0;
  assign hours_dec = 1'b0;



  assign minutes_tick = seconds_tick && (seconds_disp == 7'd59);
  assign hours_tick = minutes_tick && (minutes_disp == 7'd59) && (seconds_disp == 7'd59);
  assign blank_hours = 1'b0;
  assign blank_minutes = 1'b0;
  assign blank_seconds = 1'b0;

  assign led = 10'b0;
  assign hours_disp = {2'b0, hours};
  assign minutes_disp = {1'b0, minutes};
  assign seconds_disp = {1'b0, seconds};


  /*
  //mode
  logic [2:0] mode_enable;
  edit_mode_selector u_edit_mode_selector (.clk(clk),
      .button(button[3]),
      .mode_enable(mode_enable)
  );

    //pwm
    logic pwm_out
    pwm_generator #(.PERIOD_CYCLES(CYCLES_PER_SECOND), .DUTY_CYCLES(CYCLES_PER_SECOND / 2)) u_pwm_generator (
        .clk(clk),
        .rst(1'b0),
        .pwm_out(pwm_out)
    );

`timescale 1ns / 1ps

module pwm_generator #(
    // Number of clock cycles in one PWM period
    parameter int PERIOD_CYCLES = 50_000_000,

    // Number of clock cycles output is high
    parameter int DUTY_CYCLES = 25_000_000
) (
    input  logic clk,
    input  logic rst,
    output logic pwm_out
);
  localparam int WIDTH = $clog2(PERIOD_CYCLES);
  logic [WIDTH - 1:0] counter;

  mod_n_counter #(
      .N(PERIOD_CYCLES),
      .WIDTH(WIDTH)
  ) u_counter (
      .clk(clk),
      .enable(1'b1),
      .rst(rst),
      .count(counter)
  );

  assign pwm_out = !(rst) && (counter < WIDTH'(DUTY_CYCLES));
endmodule
*/
endmodule
