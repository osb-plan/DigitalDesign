#!/bin/bash

rm -r work/
rm tb_edge_sync.vcd

BINPATH_GHDL=$(printenv BINPATH_GHDL);



$BINPATH_GHDL/ghdl -a ../basic-lib/flip-flop.vhdl
$BINPATH_GHDL/ghdl -a edge-sync.vhdl
$BINPATH_GHDL/ghdl -a edge-sync-tb.vhdl

$BINPATH_GHDL/ghdl -e ff_D
$BINPATH_GHDL/ghdl -e edge_sync
$BINPATH_GHDL/ghdl -e tb_edge_sync

$BINPATH_GHDL/ghdl -r  tb_edge_sync --vcd=tb_edge_sync.vcd

gtkwave tb_edge_sync.vcd
