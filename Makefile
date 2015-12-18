#
exe= main
src= main.asm
assembler= nasm

#
obj= $(patsubst %.asm,%.o,$(src))

default: main

.PHONY: main   
main: $(obj)
	gcc -m32 -o $(exe) $(obj)

.PHONY: clean
clean:
	rm -f *.o *.lst $(exe) *~ .*.gdb

%.o: %.asm
	$(assembler) $*.asm -f elf32 -F dwarf
