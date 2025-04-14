module lfsr(
input clk,rst,
output reg [3:0]x 
);

always@(posedge clk)
if(rst) begin
 x=4'b0010;
 end
else begin 
 x={x[3]^x[0],x[3:1]};
 end
 endmodule

