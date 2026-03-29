INCLUDE Irvine32.inc

.data
titleMsg    BYTE "ESCAPE THE SEGFAULT", 0
startMsg    BYTE "Press any key to begin...", 0
helpMsg     BYTE "Use W A S D to move. Press Q to quit.", 0
player      BYTE "@", 0
blank       BYTE "                                ", 0
keyChar     BYTE "K", 0

playerX     BYTE 10
playerY     BYTE 5
keyX        BYTE 30
keyY        BYTE 10

leftWall    BYTE 5
rightWall   BYTE 70
topWall     BYTE 3
botWall     BYTE 20

leftBound   BYTE 6
rightBound  BYTE 69
topBound    BYTE 4
botBound    BYTE 19

msgFindKey  BYTE "Find the key, but watch out...", 0
msgGetDoor  BYTE "Get to the door!", 0
winMsg      BYTE "You escaped!", 0
hasKey      BYTE 0

doorChar    BYTE "D", 0
doorX       BYTE 65
doorY       BYTE 18

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
call Crlf
mov edx, OFFSET msgFindKey
call WriteString

call DrawBorder

drawPlayer :
; draw key only if not collected
cmp hasKey, 1
je skipKeyDraw
mov dh, keyY
mov dl, keyX
call Gotoxy
mov edx, OFFSET keyChar
call WriteString
skipKeyDraw :

; draw door
mov dh, doorY
mov dl, doorX
call Gotoxy
mov edx, OFFSET doorChar
call WriteString

; draw player
mov dh, playerY
mov dl, playerX
call Gotoxy
mov edx, OFFSET player
call WriteString

gameLoop :
call ReadKey

mov dh, playerY
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
cmp al, 'w'
je moveUp
cmp al, 'W'
je moveUp
cmp al, 's'
je moveDown
cmp al, 'S'
je moveDown
cmp al, 'q'
je quitGame
cmp al, 'Q'
je quitGame
jmp drawPlayer

moveLeft :
mov al, playerX
cmp al, leftBound
je drawPlayer
dec playerX
jmp drawPlayer

moveRight :
mov al, playerX
cmp al, rightBound
je drawPlayer
inc playerX
jmp drawPlayer

moveUp :
mov al, playerY
cmp al, topBound
je drawPlayer
dec playerY
jmp drawPlayer

moveDown :
mov al, playerY
cmp al, botBound
je drawPlayer
inc playerY
jmp drawPlayer

checkDoor :
cmp hasKey, 1
jne drawPlayer
mov al, playerX
cmp al, doorX
jne drawPlayer
mov al, playerY
cmp al, doorY
jne drawPlayer
jmp winGame

winGame :
call Clrscr
mov edx, OFFSET winMsg
call WriteString
call Crlf
call WaitMsg
exit

quitGame :
exit
main ENDP

DrawBorder PROC
mov dh, topWall
mov dl, leftWall
topLine :
call Gotoxy
mov al, '-'
call WriteChar
inc dl
cmp dl, rightWall
jbe topLine

mov dh, botWall
mov dl, leftWall
bottomLine :
call Gotoxy
mov al, '-'
call WriteChar
inc dl
cmp dl, rightWall
jbe bottomLine

mov dl, leftWall
mov dh, topWall
leftLine :
call Gotoxy
mov al, '|'
call WriteChar
inc dh
cmp dh, botWall
jbe leftLine

mov dl, rightWall
mov dh, topWall
rightLine :
call Gotoxy
mov al, '|'
call WriteChar
inc dh
cmp dh, botWall
jbe rightLine

ret
DrawBorder ENDP

UpdateMessage PROC
mov dh, 1
mov dl, 0
call Gotoxy
mov edx, OFFSET blank
call WriteString
mov dh, 1
mov dl, 0
call Gotoxy
mov edx, OFFSET msgGetDoor
call WriteString
ret
UpdateMessage ENDP

END main
