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

