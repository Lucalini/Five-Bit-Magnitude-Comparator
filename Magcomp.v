`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/10/2023 12:04:02 PM
// Design Name: 
// Module Name: Magcomp
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Magcomp(
    input [4:0] A,
    input [4:0] B,
    input CLK
    
    );
    
    assign sign = A[4] & B[4];
    wire eq;
    
    
    nb_twos_comp twos_a(
    .a (A),
    .a_min(a_twos)
    );
    
     nb_twos_comp twos_b(
    .a (B),
    .a_min(b_twos)
    );
    
    mux_2t1_nb mux_a(
    .D0 (A),
    .D1 (a_twos),
    .SEL (A[4]),
    .D_OUT(a_out)
    );
    
    mux_2t1_nb mux_b(
    .D0 (B),
    .D1 (b_twos),
    .SEL (B[4]),
    .D_OUT(b_out)
    );
    
    comp_nb compare(
    .a (a_out),
    .b (b_out),
    .eq (eq)
    );
    
    
    univ_sseg my_univ_sseg (
     .cnt1    (a_out), 
     .cnt2    (), 
     .valid   (eq), 
     .dp_en   (), 
     .dp_sel  (), 
     .mod_sel (00), 
     .sign    (sign), 
     .clk     (CLK), 
     .ssegs   (segs), 
     .disp_en (an)    ); 
     
     
    univ_sseg display(
    .cnt1(a_out),
    .valid(eq),
    .sign(sign),
    .mod_sel (00),
    .ssegs (segments),
    .disp_en(anodes)
    
    );
    
endmodule
