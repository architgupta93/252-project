float reduction_sum; 
float vector_dot(float* a,
		 float* b, int N)
{
   float  dot = 0;
   for (unsigned i=0; i < N; i++)
   {
      dot = a[idx] * b[idx];	
      reduction_sum += dot;
   }
}
