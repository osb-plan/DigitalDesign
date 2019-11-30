#!/bin/bash

rm -r work/
rm tb_pulse-sync.vcd

BINPATH_GHDL=$(printenv BINPATH_GHDL);


$BINPATH_GHDL/ghdl -a pulse-sync.vhdl
$BINPATH_GHDL/ghdl -a pulse-sync-tb.vhdl
$BINPATH_GHDL/ghdl -a toggle-synchro.vhdl
$BINPATH_GHDL/ghdl -a flip-flop.vhdl

echo "Analyze done."

$BINPATH_GHDL/ghdl -e pulse_sync 
$BINPATH_GHDL/ghdl -e tb_pulse_sync 
$BINPATH_GHDL/ghdl -e T_FF
$BINPATH_GHDL/ghdl -e ff_D 

echo "Elaboration done."

$BINPATH_GHDL/ghdl -r tb_pulse_sync --vcd=tb_pulse_sync.vcd

gtkwave tb_pulse_sync.vcd
