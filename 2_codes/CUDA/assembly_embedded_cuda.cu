/*	Cuda program with inline ptx assembly to test how information can be
	passed from hihg level cuda code to PTX assembly (which can thereafter
	be instrumented by GPGPU-SIM				

	Author	: Archit Gupta
	Date	: November 18, 2015
	Purpose	: CS252 course project
*/

#include <stdio.h>
#include <cuda.h>

__global__ void add_array(float* in_a, float* in_b, float* out_c, int N)
{
	int idx = (blockIdx.x * blockDim.x) + threadIdx.x;
	__asm__("EXTRN:");
	if(idx < N)
	{
		__asm__("INTRN:");
		if(idx < N/2)
		{
			out_c[idx] = in_a[idx] + in_b[idx];
			__asm__("INTRN:");
		}
		else
		{
			out_c[idx] = in_b[idx] - in_a[idx];
		}
	}
}

int main(void)
{
	const int NUM_ELEMENTS = 16;
	const int BLOCK_SIZE = 16;
	const int NUM_BLOCKS = (NUM_ELEMENTS/BLOCK_SIZE) + ((NUM_ELEMENTS%BLOCK_SIZE == 0) ? 0:1);
	size_t FLOAT_ARRAY_SIZE = sizeof(float)*NUM_ELEMENTS;

	float *h_a, *h_b, *h_c;			// data arrays on the host machine
	float *d_a, *d_b, *d_c;			// data arrays on the GPU
	
	h_a = (float *) malloc(FLOAT_ARRAY_SIZE); // Allocating memory for the data	
	h_b = (float *) malloc(FLOAT_ARRAY_SIZE); // on the host machine	
	h_c = (float *) malloc(FLOAT_ARRAY_SIZE); 
 
	cudaMalloc((void**) &d_a, FLOAT_ARRAY_SIZE);
	cudaMalloc((void**) &d_b, FLOAT_ARRAY_SIZE);
	cudaMalloc((void**) &d_c, FLOAT_ARRAY_SIZE);
	
	// Initializing data in the input arrays. Lets initialize
	// a[i] = 2i;
	// b[i] = i^2+1; 
	
	for(int i=0; i<NUM_ELEMENTS; i++)
	{
		h_a[i] = (float) 2*i;
		h_b[i] = (float) i*i+1;	
	}

	// We expect out function to produce 
	// c[i] = (i+1)^2 if i<N/2
	// c[i] = (i-1)^2 otherwise
	
	cudaMemcpy(d_a, h_a, FLOAT_ARRAY_SIZE, cudaMemcpyHostToDevice);
	cudaMemcpy(d_b, h_b, FLOAT_ARRAY_SIZE, cudaMemcpyHostToDevice);

	add_array <<< NUM_BLOCKS, BLOCK_SIZE >>> (d_a, d_b, d_c, NUM_ELEMENTS);

	cudaMemcpy(h_c, d_c, FLOAT_ARRAY_SIZE, cudaMemcpyDeviceToHost);

	for(int i=0; i<NUM_ELEMENTS; i++)
	{
		printf("%d:a[i]=%f, b[i]=%f, c[i]=%f\n", i, h_a[i], h_b[i], h_c[i]); 
	}
	
	return 0;
}
