# Escape the Segfault

## Description

Escape the Segfault is a terminal-based game written in x86 Assembly using the Irvine32 library. The player is placed inside a dark arena and must navigate carefully to complete the objective while avoiding enemies.

The goal of the game is to:

- Find the key  
- Use the key to unlock the exit  
- Reach the door to escape  

The arena contains multiple monsters. If the player runs into any monster, the game ends immediately.

The game also includes limited visibility, meaning the player can only see a small area around their current position. This forces the player to explore carefully and makes avoiding enemies more difficult.

---

## How to Play

- The player is represented by `@`  
- The key is represented by `K`  
- The door is represented by `D`  
- Monsters are represented by `M`  

### Controls

- `W` → Move up  
- `A` → Move left  
- `S` → Move down  
- `D` → Move right  
- `Q` → Quit the game  
- `R` → Restart (after winning or losing)  

### Objective

- Explore the arena to find the key  
- After collecting the key, move to the door  
- Avoid all monsters  
- Reach the door to win  

---

## How to Compile and Run

### Requirements

- Windows OS  
- Visual Studio (with C++ tools installed)  
- Irvine32 library  

The Irvine32 files should be located at:

```
C:\Irvine\irvine
```

### Steps

1. Download or clone the repository  

2. Open a Command Prompt  

3. Navigate to the project folder:

```
cd path\to\CSE3120-Contest1
```

Example:

```
cd %USERPROFILE%\Downloads\CSE3120-Contest1-main\CSE3120-Contest1-main
```

4. Build the program:

```
build.bat
```

If successful, you should see:

```
Build successful.
Run with: Contest1.exe
```

5. Run the game:

```
Contest1.exe
```


Alternatively, you can just download the Contest1.asm file, open it in your Visual Studio (which I'm assuming is set up correctly), build, and then finally run it by clicking on Start Debugging/Start Without Debugging.
---

## Notes

- The build script automatically sets up the correct 32-bit environment  
- If the build fails, verify that Irvine32 is installed at `C:\Irvine\irvine`  

---

## Game Demo

YouTube Video Demo:  
https://youtu.be/5NGkv_sf3OM
