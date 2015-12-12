__device__ float reduction_sum; 

__global__ 
void vector_dot(float* a, float* b,
			 float* c, int N)
{
   int idx = (blockIdx.x + blockDim.x) 
			+ threadIdx.x;
   if (idx < N)
   {
      c[idx] = a[idx] * b[idx];	
   }
   __syncthreads();
   if (idx == 0)
   {	
      for (unsigned i=0; i < N; i++)
      { 
         reduction_sum += c[idx];
      }
   }		
}
