INCLUDE Irvine32.inc

.data
titleMsg BYTE "ESCAPE THE SEGFAULT", 0
startMsg BYTE "Press any key to begin...", 0
player BYTE "@",0

.code
main PROC
call Clrscr

mov edx, OFFSET titleMsg
call WriteString
call Crlf

mov edx, OFFSET startMsg
call WriteString

call ReadChar

call Clrscr
mov edx, OFFSET player
call WriteString
call ReadChar

exit
main ENDP

END main
