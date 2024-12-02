`timescale 1ns / 1ps

// File: Testbench.v
// Author: Michelle Lynch
// Copyright Michelle Lynch 2024

module Testbench;

parameter HDISP = 6;//Display resolutions
parameter VDISP = 2;//""
parameter HFP = 1;//Front porches
parameter VFP = 1;//""
parameter HPW = 1;//Sync pulse width
parameter VPW = 1;//""
parameter HLIM = 10;//Horizontal + vertical limits
parameter VLIM = 6;//""
parameter COUNTER_WIDTH = 3;//Controls internal counter
parameter COUNT_FROM = 0;
parameter COUNT_TO = 3;
parameter COUNT_RESET = 3;
parameter T = 10;//Defines the clock period.

reg clk, rst;
wire hsync, vsync, vid_on;
wire [10:0] row, col;
wire [3:0] red, green, blue;

//Generates the VGA sync singals and caclulates the pixel position, while 
//determining whether the current pixel is visable.
VGASync #(.HDISP(HDISP), .VDISP(VDISP), .HFP(HFP), .VFP(VFP),
          .HPW(HPW), .VPW(VPW), .HLIM(HLIM), .VLIM(VLIM)) i_VGASync 
         (.clk25(clk), .rst(rst), .hsync(hsync), .vsync(vsync), 
          .vid_on(vid_on), .row(row), .col(col));
//Generates the colour values for the red, green and blue outputs.
ColourStripes #(.COUNTER_WIDTH(COUNTER_WIDTH), .COUNT_TO(COUNT_TO),
              .COUNT_FROM(COUNT_FROM), .COUNT_RESET(COUNT_RESET)) i_colour_stripes
    (.clk(clk), .rst(rst), .red(red), .green(green), .blue(blue));
   

//ColourCycle #(.COUNTER_WIDTH(COUNTER_WIDTH), .COUNT_TO(COUNT_TO),
      //        .COUNT_FROM(COUNT_FROM), .COUNT_RESET(COUNT_RESET)) i_colour_cycle
  //  (.clk(clk), .rst(rst), .red(red), .green(green), .blue(blue));
   
// TB Clock
always begin//Generates clock signal with period of T, the clock alternates between 0 and 1, with each state lasting half a period.
    clk = 1'b0;
    #(T/2);//Wait for half the clock period
    clk = 1'b1;
    #(T/2);//Wait for the other half of the clock period
end

// TB Reset
initial begin
    rst = 1'b1;//Sets the reset signal to 1
    repeat(2) begin
        @(negedge clk);//Waits for 2 negative edges to simulate a reset period.
    end
    rst = 1'b0;//After waiting it deactivates the rset allowing the test to continue normally.
end
endmodule
