INCLUDE Irvine32.inc

.data
titleMsg    BYTE "ESCAPE THE SEGFAULT", 0
startMsg    BYTE "Press any key to begin...", 0
helpMsg     BYTE "Use W A S D to move. Press Q to quit.", 0
player      BYTE "@", 0
blank       BYTE " ", 0
msgBlank    BYTE "                                ", 0
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
loseMsg     BYTE "You Died", 0
restartMsg  BYTE "Press R to restart or Q to quit.", 0
hasKey      BYTE 0

doorChar    BYTE "D", 0
doorX       BYTE 65
doorY       BYTE 18

monsterChar BYTE "M", 0

monster1X   BYTE 40
monster1Y   BYTE 12

monster2X   BYTE 20
monster2Y   BYTE 8

monster3X   BYTE 55
monster3Y   BYTE 16

monster4X   BYTE 15
monster4Y   BYTE 15

monster5X   BYTE 25
monster5Y   BYTE 6

monster6X   BYTE 35
monster6Y   BYTE 17

monster7X   BYTE 48
monster7Y   BYTE 9

monster8X   BYTE 60
monster8Y   BYTE 14

visionRadius BYTE 2

prevPlayerX  BYTE 10
prevPlayerY  BYTE 5

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
call ClearInterior
call DrawBorder
; draw key only if not collected and visible
cmp hasKey, 1
je skipKeyDraw
mov al, keyX
mov ah, keyY
call IsVisible
cmp bl, 1
jne skipKeyDraw
mov dh, keyY
mov dl, keyX
call Gotoxy
mov edx, OFFSET keyChar
call WriteString
skipKeyDraw :

; draw door only if visible
mov al, doorX
mov ah, doorY
call IsVisible
cmp bl, 1
jne skipDoorDraw
mov dh, doorY
mov dl, doorX
call Gotoxy
mov edx, OFFSET doorChar
call WriteString
skipDoorDraw :

; draw player
mov dh, playerY
mov dl, playerX
call Gotoxy
mov edx, OFFSET player
call WriteString

; draw monster 1 if visible
mov al, monster1X
mov ah, monster1Y
call IsVisible
cmp bl, 1
jne skipMonster1
mov dh, monster1Y
mov dl, monster1X
call Gotoxy
mov edx, OFFSET monsterChar
call WriteString
skipMonster1 :

; draw monster 2 if visible
mov al, monster2X
mov ah, monster2Y
call IsVisible
cmp bl, 1
jne skipMonster2
mov dh, monster2Y
mov dl, monster2X
call Gotoxy
mov edx, OFFSET monsterChar
call WriteString
skipMonster2 :

; draw monster 3 if visible
mov al, monster3X
mov ah, monster3Y
call IsVisible
cmp bl, 1
jne skipMonster3
mov dh, monster3Y
mov dl, monster3X
call Gotoxy
mov edx, OFFSET monsterChar
call WriteString
skipMonster3 :

; draw monster 4 if visible
mov al, monster4X
mov ah, monster4Y
call IsVisible
cmp bl, 1
jne skipMonster4
mov dh, monster4Y
mov dl, monster4X
call Gotoxy
mov edx, OFFSET monsterChar
call WriteString
skipMonster4 :

; draw monster 5 if visible
mov al, monster5X
mov ah, monster5Y
call IsVisible
cmp bl, 1
jne skipMonster5
mov dh, monster5Y
mov dl, monster5X
call Gotoxy
mov edx, OFFSET monsterChar
call WriteString
skipMonster5 :

; draw monster 6 if visible
mov al, monster6X
mov ah, monster6Y
call IsVisible
cmp bl, 1
jne skipMonster6
mov dh, monster6Y
mov dl, monster6X
call Gotoxy
mov edx, OFFSET monsterChar
call WriteString
skipMonster6 :

; draw monster 7 if visible
mov al, monster7X
mov ah, monster7Y
call IsVisible
cmp bl, 1
jne skipMonster7
mov dh, monster7Y
mov dl, monster7X
call Gotoxy
mov edx, OFFSET monsterChar
call WriteString
skipMonster7 :

; draw monster 8 if visible
mov al, monster8X
mov ah, monster8Y
call IsVisible
cmp bl, 1
jne skipMonster8
mov dh, monster8Y
mov dl, monster8X
call Gotoxy
mov edx, OFFSET monsterChar
call WriteString
skipMonster8 :

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
jmp checkMonster

moveRight :
mov al, playerX
cmp al, rightBound
je drawPlayer
inc playerX
jmp checkMonster

moveUp :
mov al, playerY
cmp al, topBound
je drawPlayer
dec playerY
jmp checkMonster

moveDown :
mov al, playerY
cmp al, botBound
je drawPlayer
inc playerY
jmp checkMonster

checkMonster :
mov al, playerX
cmp al, monster1X
jne checkM2
mov al, playerY
cmp al, monster1Y
je loseGame

checkM2 :
mov al, playerX
cmp al, monster2X
jne checkM3
mov al, playerY
cmp al, monster2Y
je loseGame

checkM3 :
mov al, playerX
cmp al, monster3X
jne checkGoal
mov al, playerY
cmp al, monster3Y
je loseGame

jmp checkGoal

checkGoal :
cmp hasKey, 1
je checkDoor
mov al, playerX
cmp al, keyX
jne checkDoor
mov al, playerY
cmp al, keyY
jne checkDoor
mov hasKey, 1
call UpdateMessage
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

loseGame :
call Clrscr
mov edx, OFFSET loseMsg
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
mov edx, OFFSET msgBlank
call WriteString
mov dh, 1
mov dl, 0
call Gotoxy
mov edx, OFFSET msgGetDoor
call WriteString
ret
UpdateMessage ENDP

IsVisible PROC
; input: AL = objectX, AH = objectY
; output: BL = 1 if visible, 0 if not

mov bl, 0

; check x distance
mov dl, playerX
sub dl, al
jns xPositive
neg dl
xPositive:
cmp dl, visionRadius
ja notVisible

; check y distance
mov dl, playerY
sub dl, ah
jns yPositive
neg dl
yPositive:
cmp dl, visionRadius
ja notVisible

mov bl, 1

notVisible:
ret
IsVisible ENDP

ClearInterior PROC
mov dh, topBound

clearRow:
mov dl, leftBound

clearCol:
call Gotoxy
mov al, ' '
call WriteChar
inc dl
cmp dl, rightBound
jbe clearCol

inc dh
cmp dh, botBound
jbe clearRow

ret
ClearInterior ENDP

END main
