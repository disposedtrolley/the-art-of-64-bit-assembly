#include <stdio.h>

// Prevents name-mangling by the C++ compiler.
extern "C"
{
  // Declare the signature of the ASM function to be called.
  void asmFunc(void);
};

int main(void)
{
  printf("Calling asmMain:\n");
  asmFunc();
  printf("Returned from asmMain\n");
}
