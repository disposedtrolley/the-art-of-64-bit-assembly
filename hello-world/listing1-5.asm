  option  casemap:none
  .data

; 10 is the newline character.
fmtStr  byte  "Hello, World!", 10, 0

  .code

  externdef printf:proc

  public asmFunc

asmFunc proc
        sub rsp,  56

        lea rcx,  fmtStr
        call  printf

        add rsp,  56

        ret
asmFunc endp

  end