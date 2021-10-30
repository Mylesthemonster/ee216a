// Lab1FSMBuildingBlocks.v

`timescale  1 ps / 1 ps

// FD module
module FD (Q, C, D);

    parameter INIT = 1'b0;

    output Q;

    input  C, D;

    wire Q;
    reg q_out;
    tri0 GSR = glbl.GSR;

    initial q_out = INIT;



    always @(GSR)
      if (GSR)
            assign q_out = INIT;
      else
            deassign q_out;

    always @(posedge C)
	        q_out <=  D;

    assign Q = q_out;

    specify
        (posedge C => (Q +: D)) = (100, 100);
    endspecify

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


// LUT3_L module
module LUT3_L (LO, I0, I1, I2);

    parameter INIT = 8'h00;

    input I0, I1, I2;

    output LO;
    reg LO;
    reg tmp;
  
    always @(  I2 or  I1 or  I0 )  begin
      tmp =  I0 ^ I1  ^ I2;
      if ( tmp == 0 || tmp == 1)
           LO = INIT[{I2, I1, I0}];
      else
           LO = lut3_mux4 ( {1'b0, 1'b0, lut3_mux4 (INIT[7:4], {I1, I0}),
                          lut3_mux4 (INIT[3:0], {I1, I0}) }, {1'b0, I2});
    end

  function lut3_mux4;
  input [3:0] d;
  input [1:0] s;

  begin
       if ((s[1]^s[0] ==1) || (s[1]^s[0] ==0))
           lut3_mux4 = d[s];
         else if ((d[0] === d[1]) && (d[2] === d[3]) && (d[0] === d[2]))
           lut3_mux4 = d[0];
         else if ((s[1] == 0) && (d[0] === d[1]))
           lut3_mux4 = d[0];
         else if ((s[1] == 1) && (d[2] === d[3]))
           lut3_mux4 = d[2];
         else if ((s[0] == 0) && (d[0] === d[2]))
           lut3_mux4 = d[0];
         else if ((s[0] == 1) && (d[1] === d[3]))
           lut3_mux4 = d[1];
         else
           lut3_mux4 = 1'bx;
   end
   endfunction

endmodule


// LUT4_L module
module LUT4_L (LO, I0, I1, I2, I3);

  parameter INIT = 16'h0000;

  input I0, I1, I2, I3;

  output LO;

  reg LO;
  reg tmp;

  always @(  I3 or  I2 or  I1 or  I0 )  begin
 
    tmp =  I0 ^ I1  ^ I2 ^ I3;

    if ( tmp == 0 || tmp == 1)

        LO = INIT[{I3, I2, I1, I0}];

    else 
    
      LO =  lut4_mux4 ( {lut4_mux4 ( INIT[15:12], {I1, I0}),
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
