CUDA_PATH :=/home/ag/local/cuda-7.5
NVCC :=$(CUDA_PATH)/bin/nvcc

NVCCOPTS :=-ccbin gcc-4.5.4
ASM_OPTS :=-ptx

SRC :=assembly_embedded_cuda

asm:$(SRC).cu
	$(NVCC) $(NVCCOPTS) $(ASM_OPTS) -o $(SRC).ptx $<

exe:$(SRC).cu
	$(NVCC) $(NVCCOPTS) -o $(SRC) $<
	
