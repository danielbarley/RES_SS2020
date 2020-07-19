transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -2008 -work work {C:/Daten/Uni Heidelberg/RES/RES_SS2020/project/REG.vhd}

vcom -2008 -work work {C:/Daten/Uni Heidelberg/RES/RES_SS2020/project/REG_tb.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cyclone10lp -L rtl_work -L work -voptargs="+acc"  REG_tb

add wave *
view structure
view signals
run -all
