
`timescale 1ns / 1ps

module cascade_counter #(
    parameter int N2 = 3,
    parameter int N1 = 4,
    parameter int N0 = 5,
    // Output port width
    parameter int W2 = 2,
    parameter int W1 = 2,
    parameter int W0 = 3
) (
    input logic clk,
    input logic rst,
    input logic enable,
    output logic [W2 -1:0] count2,
    output logic [W1 -1:0] count1,
    output logic [W0 -1:0] count0
);

  logic [W0 - 1:0] counting0;
  logic [W1 - 1:0] counting1;
  logic [W2 - 1:0] counting2;
  logic enable1;
  logic enable2;


  // module instantiation
  mod_n_counter #(
      .N(N0),
      .WIDTH(W0)
  ) u_mod_n_counter0 (
      .clk(clk),
      .enable(enable),
      .rst(rst),
      .count(counting0)
  );

  mod_n_counter #(
      .N(N1),
      .WIDTH(W1)
  ) u_mod_n_counter1 (
      .clk(clk),
      .enable(enable1),
      .rst(rst),
      .count(counting1)
  );

  mod_n_counter #(
      .N(N2),
      .WIDTH(W2)
  ) u_mod_n_counter2 (
      .clk(clk),
      .enable(enable2),
      .rst(rst),
      .count(counting2)
  );

  assign enable1 = enable && (counting0 == W0'(N0 - 1));
  assign enable2 = enable1 && (counting1 == W1'(N1 - 1));

  assign count0  = W0'(counting0);
  assign count1  = W1'(counting1);
  assign count2  = W2'(counting2);

endmodule
