__asm__("EXTRN:");	
// to exit loop if <init> fails
// <condition> initially
for (<init>; <condition>; <update>)
{
   ....
   <iteration blocks>
   ....
   __asm__("EXTRN:");
   // succedded by <update> and 
   // the <condition>-test-branch.
}
