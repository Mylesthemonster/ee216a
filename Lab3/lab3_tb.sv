//-----------------------------------------------------------------------------
// lab3_tb.sv
// ---------------------------------------------------------------------------
import UPF::*;
module lab3_tb;
reg clk1, clk2;
reg sel_clk;
reg rst;
wire [7:0] final_bcd_count;
parameter ON=0, OFF=1;
parameter ISO1_ON=1, ISO1_OFF=0;	//high
parameter ISO2_ON=1, ISO2_OFF=0;	//high
parameter ISO3_ON=0, ISO3_OFF=1;	//low
parameter ISO4_ON=1, ISO4_OFF=0;	//high
parameter ISO5_ON=0, ISO5_OFF=1;	//low
parameter RST_ON=0, RST_OFF=1;

reg ck_mx_sw_ctr, lfsr_sw_ctr, sd_sw_ctr, cnt_sw_ctr, bcd_sw_ctr;
reg iso1, iso2, iso3, iso4, iso5;
reg save_cnt, restore_cnt;
integer prv_det_cnt, saved_cnt;
integer fh, fh1;
integer checkpoint1, checkpoint2, checkpoint3, checkpoint4, checkpoint5, checkpoint6;
reg last_bcd_conv_block_op, bcd_block_o;

//////////////////////////////
//TOP MODULE INSTANTIATION
//////////////////////////////
top DUT(clk1, clk2, sel_clk, rst, final_bcd_count, ck_mx_sw_ctr, lfsr_sw_ctr, sd_sw_ctr, cnt_sw_ctr, bcd_sw_ctr, iso1, iso2, iso3, iso4, iso5, save_cnt, restore_cnt);

always #8 clk1 = ~clk1;
always #6 clk2 = ~clk2;
initial
begin
   supply_on("lab3_tb/DUT/VDD", 1.5);
   supply_on("lab3_tb/DUT/VSS", 0);
   checkpoint1=0;checkpoint2=0;checkpoint3=0; checkpoint4=0;checkpoint5=0;checkpoint6=0;
   clk1 = 0;
   clk2 = 1;
   sel_clk = 0;
   save_cnt = 0;
restore_cnt = 0;
   rst = 1;

   //Switching ON all domains initially & No Isolation
   ck_mx_sw_ctr=ON; lfsr_sw_ctr=ON; sd_sw_ctr=ON; cnt_sw_ctr=ON; bcd_sw_ctr=ON;
   iso1 = ISO1_OFF; iso2 = ISO2_OFF; iso3 = ISO3_OFF; iso4 = ISO4_OFF; iso5 = ISO5_OFF;
   //Reset Design
   #1 rst = 0;
   #2 rst = 1;


   //Save for Domain-4
   #1200;
   save_cnt=1;
   #3 save_cnt=0;

   //Isolate Domain-4
   #30;
   iso4=ISO4_ON;


   //Power Off Domain-4
   #300;
   cnt_sw_ctr=OFF;


   //Power On Domain-4 Again
   #200;
   cnt_sw_ctr=ON;


   //Restore
   #100;
   restore_cnt=1;
   #2 restore_cnt=0;
   

   //Remove Isolation for Domain-
   #200;
   iso4=ISO4_OFF;


   #300;
   supply_off("VDD");
   supply_off("VSS");
end

initial
   #2300 $stop;


////////////////////////////
// Test Bench Displays
////////////////////////////
always @(DUT.lfsr_stored or DUT.lfsr_stored or DUT.DETECTION or DUT.detection_count or DUT.final_bcd_count)
   $display("Time:%g || CLK:%b   LFSR:%b   DETECT:%b   COUNT:%d   BCD_OUT:%2d__%2d\n", $time, DUT.clk, DUT.lfsr_stored, DUT.DETECTION, DUT.detection_count, DUT.final_bcd_count[7:4], DUT.final_bcd_count[3:0]);

/////////////////////////////
// Power Log Displays Here..
/////////////////////////////
always @(iso1)
begin
   if(iso1==ISO1_ON) begin
	$display("Time: %4g\t---------------DOMAIN-1 IS ISOLATED----------------\n\n", $time);
   end
   else if(iso1==ISO1_OFF) begin
	$display("Time: %4g\t----------ISOLATION REMOVED FROM DOMAIN-1----------\n\n", $time);
   end
end

always @(iso2)
begin
   if(iso2==ISO2_ON) begin
	$display("Time: %4g\t---------------DOMAIN-2 IS ISOLATED----------------\n\n", $time);
   end
   else if(iso2==ISO2_OFF) begin
	$display("Time: %4g\t----------ISOLATION REMOVED FROM DOMAIN-2----------\n\n", $time);
   end
end

always @(iso3)
begin
   if(iso3==ISO3_ON) begin
	$display("Time: %4g\t---------------DOMAIN-3 IS ISOLATED----------------\n\n", $time);
   end
   else if(iso3==ISO3_OFF) begin
	$display("Time: %4g\t----------ISOLATION REMOVED FROM DOMAIN-3----------\n\n", $time);
   end
end

always @(iso4)
begin
   if(iso4==ISO4_ON) begin
	$display("Time: %4g\t---------------DOMAIN-4 IS ISOLATED----------------\n\n", $time);
   end
   else if(iso4==ISO4_OFF) begin
	$display("Time: %4g\t----------ISOLATION REMOVED FROM DOMAIN-4----------\n\n", $time);
   end
end

always @(iso5)
begin
   if(iso5==ISO5_ON) begin
	$display("Time: %4g\t---------------DOMAIN-5 IS ISOLATED----------------\n\n", $time);
   end
   else if(iso5==ISO5_OFF) begin
	$display("Time: %4g\t----------ISOLATION REMOVED FROM DOMAIN-5----------\n\n", $time);
   end
end

always @(save_cnt)
begin
   if(save_cnt==1) begin
        $display("Time: %4g\t---------------SAVE ASSERTED for  DOMAIN-4----------------\n\n", $time);
   end
   else if(save_cnt==0) begin
        $display("Time: %4g\t---------------SAVE REMOVED for DOMAIN-4----------------\n\n", $time);
   end
end

always @(restore_cnt)
begin
   if(restore_cnt==1) begin
        $display("Time: %4g\t---------------RESTORE ASSERTED for  DOMAIN-4----------------\n\n", $time);
   end
   else if(restore_cnt==0) begin
        $display("Time: %4g\t---------------RESTORE REMOVED for  DOMAIN-4----------------\n\n", $time);
   end
end

always @(ck_mx_sw_ctr)
   if(ck_mx_sw_ctr==ON)
	$display("Time: %4g\tDOMAIN-1 IS ON NOW\n", $time);
   else
	$display("Time: %4g\tDOMAIN-1 IS OFF NOW\n", $time);


always @(lfsr_sw_ctr)
   if(lfsr_sw_ctr==ON)
	$display("Time: %4g\tDOMAIN-2 IS ON NOW\n", $time);
   else
	$display("Time: %4g\tDOMAIN-2 IS OFF NOW\n", $time);


always @(sd_sw_ctr)
   if(sd_sw_ctr==ON)
	$display("Time: %4g\tDOMAIN-3 IS ON NOW\n", $time);
   else
	$display("Time: %4g\tDOMAIN-3 IS OFF NOW\n", $time);


always @(cnt_sw_ctr)
   if(cnt_sw_ctr==ON)
	$display("Time: %4g\tDOMAIN-4 IS ON NOW\n", $time);
   else
	$display("Time: %4g\tDOMAIN-4 IS OFF NOW\n", $time);


always @(bcd_sw_ctr)
   if(bcd_sw_ctr==ON)
	$display("Time: %4g\tDOMAIN-5 IS ON NOW\n", $time);
   else
	$display("Time: %4g\tDOMAIN-5 IS OFF NOW\n", $time);


/////////////////////////
// Checking Logic Here
/////////////////////////
always @(DUT.CNT.count1)
   prv_det_cnt = DUT.CNT.count1;

always @(save_cnt or DUT.CNT.count1)
begin
   if(save_cnt) saved_cnt = DUT.CNT.count1;
   else ;
end

always @(iso4)
begin
   if(iso4==ISO4_ON) begin
      @(negedge DUT.clk)
        if( (DUT.detection_count!= prv_det_cnt) && (DUT.detection_count==0) ) begin
           checkpoint1=1;
           $display("============================================================");
           $display("CHECKPOINT1 :: COUNTER ISOALATION SUCCESSUL.\t\tTime:%g", $time);
           $display("============================================================\n");
        end
   end
   else if(iso4==ISO4_OFF) begin
        @(posedge DUT.clk)
           ;
        @(negedge DUT.clk)
           if(DUT.detection_count!=prv_det_cnt) begin
                checkpoint2=0;
                $display("============================================================");
                $display("CHECKPOINT2 :: COUNTER ISOALATON REMOVAL ERROR.\tTime:%g", $time);
                $display("STILL DRIVEN TO CLAMP VALUE OR SOME UNEXPECTED VALUE!!");
                $display("============================================================\n");
           end
           else begin
                checkpoint2=1;
		$display("CNT_OP:%d\tTOP_DET_CNT:%d", DUT.CNT.count1, DUT.detection_count);
                $display("============================================================");
                $display("CHECKPOINT2 :: COUNTER ISOALATON REMOVAL SUCCESSFUL.\tTime:%g", $time);
                $display("NORMAL COUNTER OUTPUT IS COMING.");
                $display("============================================================\n");
           end
   end
end

always @(restore_cnt)
begin
   if(restore_cnt) begin
   @(negedge iso4)
	if(DUT.CNT.count1!=saved_cnt) begin
	   checkpoint3=0;
	   $display("============================================================");
	   $display("CHECKPOINT3 :: RESTORE ERROR!!\tTime:%g", $time);
	   $display("============================================================\n");
	end
	else begin
	   checkpoint3=1;$display("CNT_OP:%d\tSAVED_VALUE:%d", DUT.CNT.count1, saved_cnt);
           $display("============================================================");
           $display("CHECKPOINT3 :: RESTORE SUCCESSFUL!!\tTime:%g", $time);
           $display("============================================================\n");
	end
   @(posedge DUT.clk);
   @(negedge DUT.clk)
      if(DUT.detection_count!=saved_cnt) begin
	checkpoint4=0;
	$display("============================================================");
	$display("CHECKPOINT4 :: RETENTION ERROR.\tTime:%g", $time);
	$display("============================================================\n");
      end
      else begin
	checkpoint4=1;
	$display("============================================================");
	$display("CHECKPOINT4 :: RETENTION SUCCESSFULLY DONE.\tTime:%g", $time);
	$display("============================================================\n");
      end
   end
end


/*
always @(posedge DUT.clk or negedge DUT.rst)
begin
   if(!rst) begin
	if(iso3==ISO3_ON)
	   @(posedge DUT.clk)
		if(DUT.SD.out!=0) begin
		   checkpoint5=0;
		   $display("============================================================");
		   $display("CHECKPOINT5 :: POWER ON RESET FAILS FOR SEQUENCE DETECTOR.\t\tTime:%g", $time);
		   $display("============================================================\n");
		end
	   	else begin
		   checkpoint5=1;
		   $display( "============================================================");
		   $display("CHECKPOINT5 :: POWER ON RESET SUCCESSFUL FOR SEQUENCE DETECTOR.\t\tTime:%g", $time);
		   $display("============================================================\n");
	   	end
   end
end
*/


final
   if(checkpoint1 && checkpoint2 && checkpoint3 && checkpoint4) begin
		$display("========================================================");
		$display("\tTEST CASE PASSED\t:)\ttime:%g", $time);
		$display("========================================================");

   end
   else begin

        $display("========================================================");
        $display("\tTEST CASE FAILED\t:(\ttime:%g", $time);
        $display("========================================================");

   end

endmodule
