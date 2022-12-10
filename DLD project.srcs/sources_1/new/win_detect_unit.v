`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/16/2022 08:56:19 AM
// Design Name: 
// Module Name: win_detect_unit
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
module winner_detector(input [1:0] p1,p2,p3,p4,p5,p6,p7,p8,p9, p10, p11, p12, p13, p14, p15, p16, output wire winner, output wire [1:0]who);
wire win1,win2,win3,win4,win5,win6,win7,win8,win9, win10, win11, win12, win13, win14, win15, win16;
wire [1:0] who1,who2,who3,who4,who5,who6,who7,who8, who9, who10, who11, who12, who13, who14, who15, who16;

//horizontal
winner_detect_3 u1(p1,p2,p3,win1,who1);// (1,2,3)
winner_detect_3 u2(p2,p3,p4,win2,who2);
winner_detect_3 u3(p5,p6,p7,win3,who3);// (5,6,7)
winner_detect_3 u4(p6,p7,p8,win4,who4);
winner_detect_3 u5(p9,p10,p11,win5,who5);
winner_detect_3 u6(p10,p11,p12,win6,who6);
winner_detect_3 u7(p13,p14,p15,win7,who7);
winner_detect_3 u8(p14,p15,p16,win8,who8);

//vertical
winner_detect_3 u9(p1,p5,p9,win9,who9);
winner_detect_3 u10(p5,p9,p13,win10,who10);
winner_detect_3 u11(p2,p6,p10,win11,who11);
winner_detect_3 u12(p6,p10,p14,win12,who1);
winner_detect_3 u13(p3,p7,p11,win13,who13);
winner_detect_3 u14(p7,p11,p14,win14,who14);
winner_detect_3 u15(p4,p8,p12,win15,who15);
winner_detect_3 u16(p8,p12,p16,win16,who16);

//diagonal
winner_detect_3 u17(p1,p6,p11,win16,who17);
winner_detect_3 u18(p6,p11,16 ,win16,who18);
winner_detect_3 u19(p5,p10,p15,win16,who16);
winner_detect_3 u20(p2,p7,p12,win16,who16);


assign winner = (((((((((((((((win1 | win2) | win3) | win4) | win5) | win6) | win7) | win8)|win9)|win10)|win11)|win12)|win13)|win14)|win15)|win16);
assign who = (((((((who1 | who2) | who3) | who4) | who5) | who6) | who7) | who8);
endmodule 

