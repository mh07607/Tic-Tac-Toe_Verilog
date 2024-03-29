`timescale 1ns/1ps

module pixel_gen2( 
input clk_d,
input [9:0] pixel_x,
input [9:0] pixel_y,
input video_on,
output reg [3:0] red=0,
output reg [3:0] green=0,
output reg [3:0] blue=0
);
reg on;
reg hor;
reg vert;
reg greater;

initial
    begin 
    hor=1;
    greater=0;
    end
    
always @(posedge clk_d) 
begin
    if (pixel_y==0)
        vert=0;
    else if (pixel_y==60)
        vert=1;
    else if (pixel_y==120)
        vert=0;
    else if (pixel_y==180)
        vert=1;
    else if (pixel_y==240)
        vert=0;
    else if (pixel_y==300)
        vert=1;    
    else if (pixel_y==360)
        vert=0;
    else if (pixel_y==420)
        vert=1;
end
always @(posedge clk_d) 
begin
        if (pixel_x>479)
            greater=1;
        else
            greater=0;
            if (pixel_x==0)
        hor=0;
    else if (pixel_x==60)
        hor=1;
    else if (pixel_x==120)
        hor=0;
    else if (pixel_x==180)
        hor=1;
    else if (pixel_x==240)
        hor=0;
    else if (pixel_x==300)
        hor=1;    
    else if (pixel_x==360)
        hor=0;
    else if (pixel_x==420)
        hor=1;

end

always @(posedge clk_d) 
begin
    on=hor^vert;
    red <= video_on? (greater? (4'h0):(on? 4'h0:4'hF)): (4'h0);
    green <= video_on? (greater? (4'hF):(on? 4'h0:4'hF)): (4'h0);
    blue <= video_on? (greater? (4'h0):(on? 4'h0:4'hF)): (4'h0);
end

endmodule