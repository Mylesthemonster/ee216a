//----------------------------------------------------------------------------
// clk_mux.v
// ---------------------------------------------------------------------------

module clk_mux(clk1, clk2, sel_clk, clk_out);
input clk1, clk2;
input sel_clk;
output reg clk_out;

always @(clk1 or clk2)
begin
   if(sel_clk)
	clk_out = clk2;
   else
	clk_out = clk1;
end
endmodule
