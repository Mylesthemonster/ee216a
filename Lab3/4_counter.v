//----------------------------------------------------------------------------
// counter.v
// ---------------------------------------------------------------------------



module counter(clk, rst, trigger, count1);
input clk, rst;
input trigger;
reg [5:0] count;
output  [5:0] count1;

always @(negedge rst or posedge clk)
begin
   if(!rst) count <= 0;
   else if(trigger==1) count <= count+1;
   else ;
end
assign count1 = count;
endmodule

