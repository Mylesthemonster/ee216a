vmap mtiUPF /w/apps3/Mentor/ModelsimSE/v2020.4/modeltech/upf_lib
vmap mtiPA /w/apps3/Mentor/ModelsimSE/v2020.4/modeltech/pa_lib

vlog +acc=rn 1_clk_mux.v 2_lfsr.v 3_seqdet.v 4_counter.v 5_bcd_convert.v top.v lab3_tb.sv
vopt lab3_tb -pa_upf lab3.upf -o lab3_pa -pa_enable=supplynetworkdebug
vsim -pa work.lab3_pa -pa_lib work -L mtiPA