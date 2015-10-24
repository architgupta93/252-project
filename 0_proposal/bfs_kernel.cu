__global__ void
BFS_kernel( ... ) 
{
  if(threadIdx.x < NUM_BIN){
    q.reset(threadIdx.x, blockDim);
  }
  __syncthreads();

  tid = blockIdx.x*THREADS_PER_BLOCK
		...  + threadIdx.x;
  if( tid < no_of_nodes)
  {
    visit_node(q1[tid], threadIdx.x 
	& MOD_OP, q, overflow,
       	g_color, g_cost, gray_shade);
  }
  __syncthreads();

  if(threadIdx.x == 0){
    ...
    shift = atomicAdd(tail,tot_sum);
  }
  __syncthreads();
}

