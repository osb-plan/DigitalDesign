# DigitalDesign
This repo collects some Digital Design examples and pratical projects written in VHDL.

## Dependencies
This project depends on:
1) GHDL, to compile the vhdl code 
2) GTKWAVE to view the simulation waveform results
3) BASH scripting language to run script to compile the prjects

## How to compile
Each directory represents a single project in which you can find a bash script
called compile\_and\_simulate.sh. 
You need to provide the path of the ghdl compiler:
> $ export BINPATH\_GHDL=<path-of-the-compiler-bin-directory>
Then go inside the directory of interest for example toggle-sync and run the sh script:
> $ cd toggle-sync; ./compile\_and\_simulate

This will run the compiler and in case it completes without error the compilation
you will see the waveform signals showed in the GtkWave application.



