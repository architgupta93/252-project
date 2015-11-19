SRC :=assembly_embedded_c

all:$(SRC).c

asm:$(SRC).s

$(SRC).s:$(SRC).c
	gcc -S $< -o $@ 
	gcc $< -o $(SRC) 
clean:
	rm -f $(SRC).s
