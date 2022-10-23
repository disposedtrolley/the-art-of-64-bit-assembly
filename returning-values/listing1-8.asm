  option  casemap:none

; Declare some manifest constants.
nl      =   10  ; ASCII for newline
maxLen  =   256 ; Max string size + 1

  .data
titleStr  byte  "Listing 1-8", 0
prompt    byte  "Enter a string: ", 0
fmtStr    byte  "User entered: '%s'", nl, 0

; The user's string is read into the "input"
; buffer which is sized to maxLen number of bytes.
;
; "maxLen dup (?)" tells MASM to make maxLen number of
; uninitialised bytes.
input     byte  maxLen dup (?)

  .code

  externdef   printf:proc
  externdef   readLine:proc

  public getTitle

getTitle proc
         ; Load the address of the program's title into RAX.
         lea rax, titleStr
         ret
getTitle endp


  public asmMain

asmMain proc
        sub rsp, 56

        ; Call the readLine() function we defined in the C++ source.
        ;   Signature: int readLine(char* dest, int maxLen);
        ; - dest goes in RCX.
        ; - maxLen goes into EDX (which is the lower 32-bits of RDX).

        ; Print the prompt
        lea rcx, prompt
        call printf

        ; Initialise the input buffer with a zero-terminated string
        ; in case of error.
        mov input, 0

        ; Read the user's input.
        lea rcx, input  ; this is the "dest" parameter.
        mov rdx, maxLen ; "maxLen" parameter.
        call readLine

        ; Print the input.
        lea rcx, fmtStr ; first arg to printf().
        lea rdx, input  ; second arg to printf().
        call printf

        add rsp, 56
        ret
asmMain endp

        end