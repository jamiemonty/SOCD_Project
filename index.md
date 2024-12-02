---
layout: home
title: FPGA VGA Driver Project
tags: fpga vga verilog
categories: demo
---
Jamie Montgomery - G00419525
## **VGA Design**
Hello and welcome to my blog on the FPGA VGA Driver Project for System on Chip Design & Verification.
### **Project Set-Up**
The project was set up using Vivado, I imported files from Moodle and added these into Vivado. After everything was imported I adjusted the output clock frequency to 25MHz, this is to match the timing requirements of the VGA signal and the VGA Sync.
<img src="CLKFrequency.png">
<img src="https://github.com/jamiemonty/SOCD_Project/blob/main/SOCD%20Project/SOCD_Project%20Summary.png">
### **Template Code**
The first Verilog template would be the VGA Sync, the purpose of this is to generate horizontal and vertical sync signals for the VGA Display. It also tracks the current position of the display (rows and columns) and indicates if the pixel being displayed is in the resolution. For my project the resolution has been set to 640x480. 
<img src="https://github.com/jamiemonty/SOCD_Project/blob/main/SOCD%20Project/VGA%20Sync.png">

Another Verilog module called VGATop is designed to control the VGA output. If vid_on, a signal indicating whether the current pixel is within the visable area of the VGA display, is 1 (the pixel is visable) the RGB values for that pixel are passed to the colour outputs. If vid_on is 0, the RGB outputs are set to 0.
<img src="https://github.com/jamiemonty/SOCD_Project/blob/main/SOCD%20Project/VGATop.png">
Reference to how VGA works: https://www.asic-world.com/verilog/verilog_one_day.html
### **Simulation**
The testbench generates a clock signal (25MHz) and period defined by T. At the beginning of the simulation the rst is asserted to initialise the design. After 2 clock cycles the rst is deasserted and the design starts as normal. VGA sync and the ColourStripes modules work together to generate a VGA sync signal, determines the colour of each pixel. The testbench observes the colour values and pixel coordinates. When the simulation runs, it generates the outputs based on the VGA timing and color logic. The testbench captures the output signal. You can observe how the design behaves under these conditions.
<p float="left">
  <img src="https://github.com/jamiemonty/SOCD_Project/blob/main/SOCD%20Project/ColourStripesSimulation.png" width="48%" />
  <img src="https://github.com/jamiemonty/SOCD_Project/blob/main/SOCD%20Project/Testbench%20explanation.png" width="48%" />
</p>

### ****Synthesis****
The synthesis process converts a high-level description of the digital system into a netlist. This netlist consists of lower-level components as shown in the image below. 
<p float="left">
  <img src="https://github.com/jamiemonty/SOCD_Project/blob/main/SOCD%20Project/VGA%20Synthesis%20Nets.png" width="48%" />
  <img src="https://github.com/jamiemonty/SOCD_Project/blob/main/SOCD%20Project/logic-gates.png" width="48%" />
</p>

### **Implementation**
The implementation process converts high level designs to a working hardware design that can be tested on the physical target. It involves placement, routing and timing analysis.
<img src="https://github.com/jamiemonty/SOCD_Project/blob/main/SOCD%20Project/schematic%20.png">
### **Demonstration**
<img src="https://github.com/jamiemonty/SOCD_Project/blob/main/SOCD%20Project/ColourStripes.jpg">
This is an image of the VGA Colour Stripes code woroking, I adapted the colourCycle testbench and VGA Top so the VGA Stripes would work.

## **My VGA Design Edit**
My design idea would be to integrate the colour cycle VGA with the colour stripes VGA and have these 11 colours iterate in a loop on the screen horizontally. This adaption could prove to be tough as the code will have to be closely analysed to know what parts of each VGA code to integrate.
Introduce your own design idea. Consider how complex/achievabble this might be or otherwise. Reference any research you do online (use hyperlinks).
### **Code Adaptation**
Briefly show how you changed the template code to display a different image. Demonstrate your understanding. Guideline: 1-2 short paragraphs.
### **Simulation**
Show how you simulated your own design. Are there any things to note? Demonstrate your understanding. Add a screenshot. Guideline: 1-2 short paragraphs.
### **Synthesis**
Describe the synthesis & implementation outputs for your design, are there any differences to that of the original design? Guideline 1-2 short paragraphs.
### **Demonstration**
If you get your own design working on the Basys3 board, take a picture! Guideline: 1-2 sentences.
