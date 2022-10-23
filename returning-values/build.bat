echo off

set input=%1

Rem /Zi = include debug symbols
Rem /Cp = case insensitive (eliminates the need for options casemap:none)

ml64 /nologo /c /Zi /Cp %input%.asm
cl /nologo /O2 /Zi /utf-8 /EHa /Fe%input%.exe c.cpp %input%.obj