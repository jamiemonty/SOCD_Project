---
layout: home
title: FPGA VGA Driver Project
tags: fpga vga verilog
categories: demo
---

Hello and welcome to my blog on the FPGA VGA Driver Project for System on Chip Design & Verification.

## **VGA Design**
### **Project Set-Up**
The project was set up using Vivado, I imported files from Moodle and added these into Vivado. After everything was imported I adjusted the output clock frequency to 25MHz, this is to match the timing requirements of the VGA signal and the VGA Sync.
<img src="https://github.com/jamiemonty/SOCD_Project/blob/main/SOCD%20Project/CLK%20Frequency.png">
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
Describe the synthesis and implementation processes. Consider including 1/2 useful screenshot(s). Guideline: 1/2 short paragraphs.
### **Demonstration**
Perhaps add a picture of your demo. Guideline: 1/2 sentences.

## **My VGA Design Edit**
Introduce your own design idea. Consider how complex/achievabble this might be or otherwise. Reference any research you do online (use hyperlinks).
### **Code Adaptation**
Briefly show how you changed the template code to display a different image. Demonstrate your understanding. Guideline: 1-2 short paragraphs.
### **Simulation**
Show how you simulated your own design. Are there any things to note? Demonstrate your understanding. Add a screenshot. Guideline: 1-2 short paragraphs.
### **Synthesis**
Describe the synthesis & implementation outputs for your design, are there any differences to that of the original design? Guideline 1-2 short paragraphs.
### **Demonstration**
If you get your own design working on the Basys3 board, take a picture! Guideline: 1-2 sentences.

## **More Markdown Basics**
This is a paragraph. Add an empty line to start a new paragraph.

Font can be emphasised as *Italic* or **Bold**.

Code can be highlighted by using `backticks`.

Hyperlinks look like this: [GitHub Help](https://help.github.com/).

A bullet list can be rendered as follows:
- vectors
- algorithms
- iterators

Images can be added by uploading them to the repository in a /docs/assets/images folder, and then rendering using HTML via githubusercontent.com as shown in the example below.

<img src="https://raw.githubusercontent.com/melgineer/fpga-vga-verilog/main/docs/assets/images/VGAPrjSrcs.png">
