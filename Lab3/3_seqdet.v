//----------------------------------------------------------------------------
// seqdet.v
// ---------------------------------------------------------------------------


module seqdet(clk, rst, din, out);
input clk, rst;
input din;
output reg out;
parameter S0=3'b000, S1=3'b001, S2=3'b010, S3=3'b011, S4=3'b100;
reg [3:0] state;

always @(negedge clk or negedge rst)
begin
   if(~rst) begin
	state <= S0;
	out <= 1'b0;
   end
   else begin
   case(state)

	S0: begin
		if(din==1) state <= S1;
		else ;
		out <= 1'b0;
	    end

	S1: begin
		if(din==1) state <= S2;
		else state <= S0;
		out <= 1'b0;
	    end

	S2: begin
		if(din==0) state <= S3;
		else if(din==1) state <= S2;
		else state <= S0;
		out <= 1'b0;
	    end

	S3: begin
		if(din==1) state <= S4;
		else state <= S0;
		out <= 1'b0;
	   end

	S4: begin
		if(din==1) begin
		   state <= S2;
		   out <= 1'b1;
		end
		else begin
		   state <= S0;
		   out <= 1'b0;
		end
	    end

   default: begin
		state <= S0;
		out <= 1'b0;
	    end

   endcase
   end
end

endmodule

