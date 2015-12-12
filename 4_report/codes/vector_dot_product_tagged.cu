__device__ float reduction_sum; 

__global__  vector_dot(float* a, float* b, float* c, int N)
{
	float  dot = 0;
	int idx = (blockIdx.x + blockDim.x) + threadIdx.x;
	__asm__("EXTRN:");
	if (idx < N)
	{
		c[idx] = a[idx] * b[idx];	
	}
	__syncthreads();
	__asm__("EXTRN:");
	if (idx == 0)
	{	
		__asm__("INTRN:");
		for (unsigned i=0; i < N; i++)
		{
			reduction_sum += c[idx];
		}
	}		
}
