onerror {quit -f}
vlib work
vlog -work work rgb_to_gray.vo
vlog -work work rgb_to_gray.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.rgb_to_gray_vlg_vec_tst
vcd file -direction rgb_to_gray.msim.vcd
vcd add -internal rgb_to_gray_vlg_vec_tst/*
vcd add -internal rgb_to_gray_vlg_vec_tst/i1/*
add wave /*
run -all
