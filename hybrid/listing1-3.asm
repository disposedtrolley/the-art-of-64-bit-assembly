    .code

    ; Turn on case-sensitive mode. Without it, MASM maps all symbols
    ; to uppercase, so asmFunc becomes ASMFUNC.
    option  casemap:none

    ; Declares that asmFunc should be visible outside of the MASM
    ; source/object file.
    ; We name it asmFunc instead of main so it doesn't get conflated
    ; with the C++ main function.
    public asmFunc

asmFunc PROC

        ret

asmFunc ENDP

        END