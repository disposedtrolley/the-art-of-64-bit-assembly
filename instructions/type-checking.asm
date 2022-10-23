  .data

i8  byte  ?

i8s sbyte ?
u8  byte  ?

r4v real4 ?
r8v real8 ?

  .code

; error
mov ax, i8

; legal - managing signs is your responsibility
mov al, i8
mov bl, u8

; legal - MASM only cares that the sizes match; you wouldn't
;         normally load a floating point into a general-purpose
;         register.
mov eax,  r4v
mov rbx,  r8v

; legal - MASM checks if the constant will fit.
someConst = 5
mov eax,  someConst

; error - doesn't fit
wordConst = 1000
mov al,   wordConst


; The size of memory_var is irrelevant as all addresses are 64-bits wide.
lea   reg64,  memory_var


  .data

strVar  byte "Some String", 0

  .code

lea rcx,  strVar


  .code

myProc  proc
        ret
myProc  endp

main    proc
        call myProc
        ret
main    endp
    
  end


externdef   symbol:type

; printf()
externdef   printf:proc