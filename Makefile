TOP = mul
GTKWAVE = gtkwave

V_SRC = $(wildcard ./vsrc/*.v)
TESTBENCH_SRC = $(wildcard ./tb/*.cpp)
VTOP = ./vsrc/${TOP}.v
INC = -Ivsrc
PROG = test
PROG_S = $(wildcard ./test_src/*.S)

.DEFAULT_GOAL := all
all: vhdl

obj_dir/V${TOP}.mk: ${V_SRC} ${TESTBENCH_SRC} 
	verilator -Wall --cc --exe --trace ${TESTBENCH_SRC} ${INC} ${VTOP} 
	
obj_dir/V${TOP}.exe : obj_dir/V${TOP}.mk
	$(MAKE) -C obj_dir -f V$(TOP).mk

test_src/${PROG}.bin:
	$(MAKE) -C test_src

.PHONY : vhdl
vhdl: obj_dir/V${TOP}.mk

.PHONY : run
run: test_src/${PROG}.bin obj_dir/V${TOP}.exe 
	obj_dir/V${TOP} test_src/${PROG}.bin

.PHONY : wave
wave: run
	${GTKWAVE} wave.vcd

.PHONY : clean
clean:
	rm -rf obj_dir wave.vcd
	rm -rf test_src/*.elf test_src/*.bin


# ori x3, x3, 0xffffff0b	
# 	ori x4, x4, 0xffffffab	
# 	la x5, _array		
#     ori x10, x10, 1
# 	sb x3, 0(x5)		
# 	sb x4, 1(x5)		
# 	la x5, _array		
# 	lb x6, 0(x5)		
# 	lb x7, 1(x5)