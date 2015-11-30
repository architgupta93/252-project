CUDA_PATH :=/home/ag/local/cuda-7.5
NVCC :=$(CUDA_PATH)/bin/nvcc

NVCCOPTS :=-ccbin gcc-4.5.4
ASM_OPTS :=-cubin

SRC :=assembly_embedded_cuda

asm:$(SRC).cu
	$(NVCC) $(NVCCOPTS) $(ASM_OPTS) -o $(SRC).cubin $<

exe:$(SRC).cu
	$(NVCC) $(NVCCOPTS) -o $(SRC) $<
	
