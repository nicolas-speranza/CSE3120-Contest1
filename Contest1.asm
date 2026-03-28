INCLUDE Irvine32.inc

.data
titleMsg BYTE "ESCAPE THE SEGFAULT", 0
startMsg BYTE "Press any key to begin...", 0
helpMsg  BYTE "Use A and D to move. Press Q to quit.", 0
player   BYTE "@", 0
blank    BYTE " ", 0
playerX  BYTE 10

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
mov edx, OFFSET helpMsg
call WriteString

drawPlayer :
mov dh, 5
mov dl, playerX
call Gotoxy
mov edx, OFFSET player
call WriteString

gameLoop :
call ReadKey

mov dh, 5
mov dl, playerX
call Gotoxy
mov edx, OFFSET blank
call WriteString

cmp al, 'a'
je moveLeft
cmp al, 'A'
je moveLeft
cmp al, 'd'
je moveRight
cmp al, 'D'
je moveRight
cmp al, 'q'
je quitGame
cmp al, 'Q'
je quitGame
jmp drawPlayer

moveLeft :
cmp playerX, 0
je drawPlayer
dec playerX
jmp drawPlayer

moveRight :
cmp playerX, 79
je drawPlayer
inc playerX
jmp drawPlayer

quitGame :
exit
main ENDP

END main