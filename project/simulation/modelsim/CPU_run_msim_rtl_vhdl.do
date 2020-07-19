transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Daten/Uni Heidelberg/RES/RES_SS2020/project/ALU.vhd}

vcom -93 -work work {C:/Daten/Uni Heidelberg/RES/RES_SS2020/project/ALU_tb.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cyclone10lp -L rtl_work -L work -voptargs="+acc"  ALU_tb

add wave *
view structure
view signals
run -all
