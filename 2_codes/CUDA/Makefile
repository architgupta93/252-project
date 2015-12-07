CUDA_PATH :=/home/ag/local/cuda-4.2
NVCC :=$(CUDA_PATH)/bin/nvcc

NVCCOPTS :=-ccbin gcc-4.5.4
ASM_OPTS :=-cubin
SIM_OPTS :=-gencode arch=compute_13,code=compute_13

SRC :=assembly_embedded_cuda

asm:$(SRC).cu
	$(NVCC) $(NVCCOPTS) $(ASM_OPTS) -o $(SRC).cubin $<

exe:$(SRC).cu
	$(NVCC) $(NVCCOPTS) -o $(SRC) $<

sim:$(SRC).cu
	$(NVCC) $(NVCCOPTS) $(SIM_OPTS) -o $(SRC) $<
	
clean:
	rm -f $(SRC) $(SRC).cubin
	rm -f _cuobjdump_*
	rm -f _ptx*
	rm -f *--run.log gpgpusim_power_report*
	rm -f gpgpu_inst_stats.txt
