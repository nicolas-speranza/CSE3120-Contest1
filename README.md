# Escape the Segfault

## Description

Escape the Segfault is a simple terminal-based game written in x86 Assembly using the Irvine32 library. The player is placed inside a dark arena and must navigate carefully to complete the objective while avoiding enemies.

The goal of the game is to:

- Find the key  
- Use the key to unlock the exit  
- Reach the door to escape  

However, the arena contains multiple monsters. If the player runs into any monster, the game ends immediately.

The game also features limited visibility, meaning the player can only see a small area around their current position. This makes exploration more challenging and requires careful movement.

---

## How to Play

- You control the player represented by `@`  
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

- Move around the arena to find the key  
- Once the key is collected, head to the door  
- Avoid all monsters along the way  
- Reach the door to win  

---

## How to Run

1. Open the project in Visual Studio with MASM and Irvine32 properly configured  
2. Build the project  
3. Run using **Local Windows Debugger**  

---

## Demo

**YouTube Video Demo:**  
https://youtu.be/5NGkv_sf3OM
