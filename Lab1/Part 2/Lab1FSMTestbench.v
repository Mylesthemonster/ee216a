//--------------------------------------------------------------------
//		Timescale
//		Means that if you do #1 in the initial block of your
//		testbench, time is advanced by 1ns instead of 1ps
//--------------------------------------------------------------------
`timescale 1ns / 1ps

//--------------------------------------------------------------------
//		The Lab1FSM Testbench.
//--------------------------------------------------------------------
module Lab1FSMTestbench();

	//----------------------------------------------------------------
	//		Parameters
	//----------------------------------------------------------------
	parameter ResetValue	= 2'b01;
	parameter HalfCycle		= 5;			//Half of the Clock Period is 5 ns
	localparam Cycle		= 2*HalfCycle;	//The length of the entire Clock Period
	
	
	//----------------------------------------------------------------
	//		Signal Declarations
	//----------------------------------------------------------------
	reg				Clock, Reset, In;
	wire			Out;
	wire[2:0]		State;
	integer 		i, j;
	reg [0:7] 		TestValues [0:7];
	
	
	//----------------------------------------------------------------
	//		FSM Model
	//----------------------------------------------------------------
	Lab1FSM		DUT(.Clock(Clock), .Reset(Reset), .In(In), .Out(Out), .State(State));


	//---------------------------------------------------------------
	//		Clock Source
	//---------------------------------------------------------------
	initial Clock =			1'b0;
	always #(HalfCycle) Clock =	~Clock;
	

	//----------------------------------------------------------------
	//		Test Stimulus
	//----------------------------------------------------------------
	initial begin
		#(10*Cycle);	//PLEASE LEAVE THIS HERE! This is required because the
						//simulation model of an FDRSE flip flop will not respond
						//to any inputs for the first 100ns of simulation
		
		
		// Read the file "TestValues.txt" and put the values
		// in 'TestValueArray'
		$readmemb("TextValues.txt", TestValues);
		
		// Outer for loop iterates through each 8- bit chunk
		for (i = 0; i < 8; i = i + 1) begin
			// Inner for loop iterates through each bit
			for (j = 0; j < 8; j = j + 1) begin
				$display ("TextValues[%d][%d] = %b", i, j, TestValues[i][j]);
			end
		end
	
	end
endmodule
