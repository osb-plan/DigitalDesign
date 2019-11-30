#!/bin/bash

rm -r work/
rm tb_toggle_sync.vcd

BINPATH_GHDL=$(printenv BINPATH_GHDL);
GHDL_COMPILER=${BINPATH_GHDL}/ghdl

$GHDL_COMPILER -a ../basic-lib/flip-flop.vhdl
$GHDL_COMPILER -a toggle-sync.vhdl
$GHDL_COMPILER -a toggle-sync-tb.vhdl

$GHDL_COMPILER -e ff_D
$GHDL_COMPILER -e toggle_sync
$GHDL_COMPILER -e tb_toggle_sync

$GHDL_COMPILER -r  tb_toggle_sync --vcd=tb_toggle_sync.vcd

gtkwave tb_toggle_sync.vcd
