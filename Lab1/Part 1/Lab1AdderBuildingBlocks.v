// Lab1AdderBuildingBlocks.v
`timescale  1 ps / 1 ps


// GND module
module GND(G);

    output G;

	assign G = 1'b0;

endmodule


// LUT2 module
module LUT2 (O, I0, I1);

    parameter INIT = 4'h0;

    input I0, I1;

    output O;

    reg  O;
    wire [1:0] s;

    assign s = {I1, I0};

    always @(s)
       if ((s[1]^s[0] ==1) || (s[1]^s[0] ==0))
           O = INIT[s];
         else if ((INIT[0] == INIT[1]) && (INIT[2] == INIT[3]) && (INIT[0] == INIT[2])) 
           O = INIT[0];
         else if ((s[1] == 0) && (INIT[0] == INIT[1]))
           O = INIT[0];
         else if ((s[1] == 1) && (INIT[2] == INIT[3])) 
           O = INIT[2];
         else if ((s[0] == 0) && (INIT[0] == INIT[2])) 
           O = INIT[0];
         else if ((s[0] == 1) && (INIT[1] == INIT[3]))
           O = INIT[1];
         else
           O = 1'bx;
endmodule


// LUT4 module
module LUT4 (O, I0, I1, I2, I3);

  parameter INIT = 16'h0000;

  input I0, I1, I2, I3;

  output O;

  reg O;
  reg tmp;

  always @(  I3 or  I2 or  I1 or  I0 )  begin
 
    tmp =  I0 ^ I1  ^ I2 ^ I3;

    if ( tmp == 0 || tmp == 1)

        O = INIT[{I3, I2, I1, I0}];

    else 
    
      O =  lut4_mux4 ( {lut4_mux4 ( INIT[15:12], {I1, I0}),
                          lut4_mux4 ( INIT[11:8], {I1, I0}),
                          lut4_mux4 ( INIT[7:4], {I1, I0}),
                          lut4_mux4 ( INIT[3:0], {I1, I0}) }, {I3, I2});
  end

  function lut4_mux4;
  input [3:0] d;
  input [1:0] s;
   
  begin

       if ((s[1]^s[0] ==1) || (s[1]^s[0] ==0))
           
           lut4_mux4 = d[s];

         else if ((d[0] === d[1]) && (d[2] === d[3]) && (d[0] === d[2])) 
           lut4_mux4 = d[0];
         else if ((s[1] == 0) && (d[0] === d[1]))
           lut4_mux4 = d[0];
         else if ((s[1] == 1) && (d[2] === d[3])) 
           lut4_mux4 = d[2];
         else if ((s[0] == 0) && (d[0] === d[2])) 
           lut4_mux4 = d[0];
         else if ((s[0] == 1) && (d[1] === d[3]))
           lut4_mux4 = d[1];
         else
           lut4_mux4 = 1'bx;
   end
  endfunction

endmodule


// LUT5 module
module LUT5 (O, I0, I1, I2, I3, I4);

  parameter INIT = 32'h00000000;

  input I0, I1, I2, I3, I4;

  output O;

  reg O;
  reg tmp;

  always @( I4 or I3 or  I2 or  I1 or  I0 )  begin
 
    tmp =  I0 ^ I1  ^ I2 ^ I3 ^ I4;

    if ( tmp == 0 || tmp == 1)

        O = INIT[{I4, I3, I2, I1, I0}];

    else 
    
      O =  lut4_mux4 ( 
                        { lut6_mux8 ( INIT[31:24], {I2, I1, I0}),
                          lut6_mux8 ( INIT[23:16], {I2, I1, I0}),
                          lut6_mux8 ( INIT[15:8], {I2, I1, I0}),
                          lut6_mux8 ( INIT[7:0], {I2, I1, I0}) }, { I4, I3});
  end

  function lut6_mux8;
  input [7:0] d;
  input [2:0] s;
   
  begin

       if ((s[2]^s[1]^s[0] ==1) || (s[2]^s[1]^s[0] ==0))
           
           lut6_mux8 = d[s];

         else
           if ( ~(|d))
                 lut6_mux8 = 1'b0;
           else if ((&d))
                 lut6_mux8 = 1'b1;
           else if (((s[1]^s[0] ==1'b1) || (s[1]^s[0] ==1'b0)) && (d[{1'b0,s[1:0]}]===d[{1'b1,s[1:0]}]))
                 lut6_mux8 = d[{1'b0,s[1:0]}];
           else if (((s[2]^s[0] ==1) || (s[2]^s[0] ==0)) && (d[{s[2],1'b0,s[0]}]===d[{s[2],1'b1,s[0]}]))
                 lut6_mux8 = d[{s[2],1'b0,s[0]}];
           else if (((s[2]^s[1] ==1) || (s[2]^s[1] ==0)) && (d[{s[2],s[1],1'b0}]===d[{s[2],s[1],1'b1}]))
                 lut6_mux8 = d[{s[2],s[1],1'b0}];
           else if (((s[0] ==1) || (s[0] ==0)) && (d[{1'b0,1'b0,s[0]}]===d[{1'b0,1'b1,s[0]}]) &&
              (d[{1'b0,1'b0,s[0]}]===d[{1'b1,1'b0,s[0]}]) && (d[{1'b0,1'b0,s[0]}]===d[{1'b1,1'b1,s[0]}]))
                 lut6_mux8 = d[{1'b0,1'b0,s[0]}];
           else if (((s[1] ==1) || (s[1] ==0)) && (d[{1'b0,s[1],1'b0}]===d[{1'b0,s[1],1'b1}]) &&
              (d[{1'b0,s[1],1'b0}]===d[{1'b1,s[1],1'b0}]) && (d[{1'b0,s[1],1'b0}]===d[{1'b1,s[1],1'b1}]))
                 lut6_mux8 = d[{1'b0,s[1],1'b0}];
           else if (((s[2] ==1) || (s[2] ==0)) && (d[{s[2],1'b0,1'b0}]===d[{s[2],1'b0,1'b1}]) &&
              (d[{s[2],1'b0,1'b0}]===d[{s[2],1'b1,1'b0}]) && (d[{s[2],1'b0,1'b0}]===d[{s[2],1'b1,1'b1}]))
                 lut6_mux8 = d[{s[2],1'b0,1'b0}];
           else
                 lut6_mux8 = 1'bx;
   end
  endfunction


  function lut4_mux4;
  input [3:0] d;
  input [1:0] s;
   
  begin

       if ((s[1]^s[0] ==1) || (s[1]^s[0] ==0))

           lut4_mux4 = d[s];

         else if ((d[0] === d[1]) && (d[2] === d[3])  && (d[0] === d[2]) )
           lut4_mux4 = d[0];
         else if ((s[1] == 0) && (d[0] === d[1]))
           lut4_mux4 = d[0];
         else if ((s[1] == 1) && (d[2] === d[3]))
           lut4_mux4 = d[2];
         else if ((s[0] == 0) && (d[0] === d[2]))
           lut4_mux4 = d[0];
         else if ((s[0] == 1) && (d[1] === d[3]))
           lut4_mux4 = d[1];
         else
           lut4_mux4 = 1'bx;

   end
  endfunction

endmodule


// LUT6 module
module LUT6 (O, I0, I1, I2, I3, I4, I5);

  parameter INIT = 64'h0000000000000000;

  input I0, I1, I2, I3, I4, I5;

  output O;

  reg O;
  reg tmp;

  always @( I5 or I4 or I3 or  I2 or  I1 or  I0 )  begin
 
    tmp =  I0 ^ I1  ^ I2 ^ I3 ^ I4 ^ I5;

    if ( tmp == 0 || tmp == 1)

        O = INIT[{I5, I4, I3, I2, I1, I0}];

    else 
    
      O =  lut6_mux8 ( {lut6_mux8 ( INIT[63:56], {I2, I1, I0}),
                          lut6_mux8 ( INIT[55:48], {I2, I1, I0}),
                          lut6_mux8 ( INIT[47:40], {I2, I1, I0}),
                          lut6_mux8 ( INIT[39:32], {I2, I1, I0}),
                          lut6_mux8 ( INIT[31:24], {I2, I1, I0}),
                          lut6_mux8 ( INIT[23:16], {I2, I1, I0}),
                          lut6_mux8 ( INIT[15:8], {I2, I1, I0}),
                          lut6_mux8 ( INIT[7:0], {I2, I1, I0}) }, {I5, I4, I3});
  end

  function lut6_mux8;
  input [7:0] d;
  input [2:0] s;
   
  begin

   if ((s[2]^s[1]^s[0] ==1) || (s[2]^s[1]^s[0] ==0))
           
       lut6_mux8 = d[s];

     else
       if ( ~(|d))
             lut6_mux8 = 1'b0;
       else if ((&d))
             lut6_mux8 = 1'b1;
       else if (((s[1]^s[0] ==1'b1) || (s[1]^s[0] ==1'b0)) && (d[{1'b0,s[1:0]}]==d[{1'b1,s[1:0]}]))
             lut6_mux8 = d[{1'b0,s[1:0]}];
       else if (((s[2]^s[0] ==1) || (s[2]^s[0] ==0)) && (d[{s[2],1'b0,s[0]}]==d[{s[2],1'b1,s[0]}]))
             lut6_mux8 = d[{s[2],1'b0,s[0]}];
       else if (((s[2]^s[1] ==1) || (s[2]^s[1] ==0)) && (d[{s[2],s[1],1'b0}]==d[{s[2],s[1],1'b1}]))
             lut6_mux8 = d[{s[2],s[1],1'b0}];
       else if (((s[0] ==1) || (s[0] ==0)) && (d[{1'b0,1'b0,s[0]}]==d[{1'b0,1'b1,s[0]}]) &&
          (d[{1'b0,1'b0,s[0]}]==d[{1'b1,1'b0,s[0]}]) && (d[{1'b0,1'b0,s[0]}]==d[{1'b1,1'b1,s[0]}]))
             lut6_mux8 = d[{1'b0,1'b0,s[0]}];
       else if (((s[1] ==1) || (s[1] ==0)) && (d[{1'b0,s[1],1'b0}]==d[{1'b0,s[1],1'b1}]) &&
          (d[{1'b0,s[1],1'b0}]==d[{1'b1,s[1],1'b0}]) && (d[{1'b0,s[1],1'b0}]==d[{1'b1,s[1],1'b1}]))
             lut6_mux8 = d[{1'b0,s[1],1'b0}];
       else if (((s[2] ==1) || (s[2] ==0)) && (d[{s[2],1'b0,1'b0}]==d[{s[2],1'b0,1'b1}]) &&
          (d[{s[2],1'b0,1'b0}]==d[{s[2],1'b1,1'b0}]) && (d[{s[2],1'b0,1'b0}]==d[{s[2],1'b1,1'b1}]))
             lut6_mux8 = d[{s[2],1'b0,1'b0}];
       else
             lut6_mux8 = 1'bx;
   end
  endfunction

endmodule


// MUXCY_L module
module MUXCY_L (LO, CI, DI, S);

    output LO;
    reg    LO;

    input  CI, DI, S;

	always @(CI or DI or S) 
	    if (S)
		LO = CI;
	    else
		LO = DI;
endmodule


// XORCY module
module XORCY (O, CI, LI);

    output O;

    input  CI, LI;

	xor X1 (O, CI, LI);


endmodule
