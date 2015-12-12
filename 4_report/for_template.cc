   __asm__("EXTRN:");	//The first branch for
   //the exit loop if the initialization fails the
   //initial test.
   for (<initialization>; <condition>; <update>)
   {
	....
	<iteration steps>
	....
	__asm__("EXTRN:"); //The last item in the 
	//iteration block, must be succedded by 
	//<udpdate> and the <condition>-test-branch.
   }
}
