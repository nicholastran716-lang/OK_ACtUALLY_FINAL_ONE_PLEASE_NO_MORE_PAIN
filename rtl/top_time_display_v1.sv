`include "rtl/restartable_rate_generator.sv"
`include "rtl/hms_counter.sv"
`include "rtl/binary_to_bcd.sv"
`include "rtl/seven_segment.sv"
`timescale 1ns / 1ps


module top_time_display_v1 #(
    parameter int CYCLES_PER_SECOND = 50_000_000
) (
    input logic CLOCK_50,
    input logic [1:0] SW,
    output logic [6:0] HEX5,
    output logic [6:0] HEX4,
    output logic [6:0] HEX3,
    output logic [6:0] HEX2,
    output logic [6:0] HEX1,
    output logic [6:0] HEX0
);
  // check if capital or not
  localparam int ActiveLow = 1;

  logic tick, tick_1hz, tick_25hz, tick_1khz, tick_50mhz;
  logic [4:0] hours;
  logic [5:0] minutes, seconds;
  logic [3:0] hours_units, hours_tens;
  logic [3:0] minutes_units, minutes_tens;
  logic [3:0] seconds_units, seconds_tens;

  seven_segment #(
      .ACTIVE_LOW(ActiveLow)
  ) u_HEX0 (
      .digit(seconds_units),
      .blank(1'b0),
      .segments(HEX0)
  );
  seven_segment #(
      .ACTIVE_LOW(ActiveLow)
  ) u_HEX1 (
      .digit(seconds_tens),
      .blank(1'b0),
      .segments(HEX1)
  );
  seven_segment #(
      .ACTIVE_LOW(ActiveLow)
  ) u_HEX2 (
      .digit(minutes_units),
      .blank(1'b0),
      .segments(HEX2)
  );
  seven_segment #(
      .ACTIVE_LOW(ActiveLow)
  ) u_HEX3 (
      .digit(minutes_tens),
      .blank(1'b0),
      .segments(HEX3)
  );
  seven_segment #(
      .ACTIVE_LOW(ActiveLow)
  ) u_HEX4 (
      .digit(hours_units),
      .blank(1'b0),
      .segments(HEX4)
  );
  seven_segment #(
      .ACTIVE_LOW(ActiveLow)
  ) u_HEX5 (
      .digit(hours_tens),
      .blank(1'b0),
      .segments(HEX5)
  );

  // rate generator
  restartable_rate_generator #(
      .CYCLE_COUNT(CYCLES_PER_SECOND)
  ) u_restartable_rate_generator_1Hz (
      .clk (CLOCK_50),
      .run (1'b1),
      .tick(tick_1hz)
  );
  restartable_rate_generator #(
      .CYCLE_COUNT(CYCLES_PER_SECOND / 25)
  ) u_restartable_rate_generator_25Hz (
      .clk (CLOCK_50),
      .run (1'b1),
      .tick(tick_25hz)
  );
  restartable_rate_generator #(
      .CYCLE_COUNT(CYCLES_PER_SECOND / 1000)
  ) u_restartable_rate_generator_1kHz (
      .clk (CLOCK_50),
      .run (1'b1),
      .tick(tick_1khz)
  );
  restartable_rate_generator #(
      .CYCLE_COUNT(CYCLES_PER_SECOND / 50_000_000)
  ) u_restartable_rate_generator_50MHz (
      .clk (CLOCK_50),
      .run (1'b1),
      .tick(tick_50mhz)
  );

  // hms_counter
  hms_counter u_hms_counter (
      .clk(CLOCK_50),
      .enable(tick),
      .hours(hours),
      .minutes(minutes),
      .seconds(seconds)
  );


  binary_to_bcd u_bcd_s (
      .bin ({1'b0, seconds}),
      .tens(seconds_tens),
      .ones(seconds_units)
  );


  binary_to_bcd u_bcd_m (
      .bin ({1'b0, minutes}),
      .tens(minutes_tens),
      .ones(minutes_units)
  );


  binary_to_bcd u_bcd_h (
      .bin ({2'b00, hours}),
      .tens(hours_tens),
      .ones(hours_units)
  );

  always_comb begin
    unique case (SW)
      2'b00:   tick = tick_1hz;
      2'b01:   tick = tick_25hz;
      2'b10:   tick = tick_1khz;
      2'b11:   tick = tick_50mhz;
      default: tick = 1'b1;
    endcase
  end


endmodule
