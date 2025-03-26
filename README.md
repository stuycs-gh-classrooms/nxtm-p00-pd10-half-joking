[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-22041afd0340ce965d47ae6ef1cefeee28c7c493a6346c4f15d667ab976d596c.svg)](https://classroom.github.com/a/gbHItYk9)
## Project 00
### NeXTCS
### Period: 10
## Name0: Hannah Moon
## Name1: Jane No
## Name2: Timmy Ngo
---

This project will be completed in phases. The first phase will be to work on this document. Use github-flavoured markdown. (For more markdown help [click here](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet) or [here](https://docs.github.com/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax) )

All projects will require the following:
- Researching new forces to implement.
- Method for each new force, returning a `PVector`  -- similar to `getGravity` and `getSpring` (using whatever parameters are necessary).
- A distinct demonstration for each individual force (including gravity and the spring force).
- A visual menu at the top providing information about which simulation is currently active and indicating whether movement is on or off.
- The ability to toggle movement on/off
- The ability to toggle bouncing on/off
- The user should be able to switch _between_ simluations using the number keys as follows:
  - `1`: Gravity
  - `2`: Spring Force
  - `3`: Drag
  - `4`: Custom Force
  - `5`: Combination


## Phase 0: Force Selection, Analysis & Plan
---------- 

#### Custom Force: Magnetic Force

### Formula
What is the formula for your force? Including descriptions/definitions for the symbols. (You may include a picture of the formula if it is not easily typed.)

F = q(v x B)

F: Magnetic Force
q: Orb Charge
v: Orb Velocity
B: Magnetic Field of Orb

### Custom Force
- What information that is already present in the `Orb` or `OrbNode` classes does this force use?
    - velocity
    - bsize
    - center
    - OrbNode next
    - OrbNode previous
  - All Methods!!

- Does this force require any new constants, if so what are they and what values will you try initially?
  - No new constants

- Does this force require any new information to be added to the `Orb` class? If so, what is it and what data type will you use?
  - int charge
  - float field

- Does this force interact with other `Orbs`, or is it applied based on the environment?
  - Since it is a magnetic force, it interacts with other orbs. Each orb will have a magnetic force, causing them to attract or repel other orbs depending on the charge. There is no impact from the environment,as the orbs are interacting with one another. 

- In order to calculate this force, do you need to perform extra intermediary calculations? If so, what?
  - Yes, each orb needs to have a charge: -1, 0, 1. This charge will determine whether the orb attracts or repels certain orbs.
  - Each orb has its own magnetic field. Depending on its radius, it will be in "spheres of contact" with other orbs. Beyond the magnetic field, the orbs cannot interact.

--- 

### Simulation 1: Gravity
Describe how you will attempt to simulate orbital motion.

--- Each "planet" will have a mass and gravitation pull that pulls other masses towards it, affecting their velocities which simulates orbital motion.

### Simulation 2: Spring
Describe what your spring simulation will look like. Explain how it will be setup, and how it should behave while running.

YOUR ANSWER HERE

--- 

### Simulation 3: Drag
Describe what your drag simulation will look like. Explain how it will be setup, and how it should behave while running.

YOUR ANSWER HERE

--- 

### Simulation 4: Custom force
Describe what your Custom force simulation will look like. Explain how it will be setup, and how it should behave while running.

YOUR ANSWER HERE

--- 

### Simulation 5: Combination
Describe what your combination simulation will look like. Explain how it will be setup, and how it should behave while running.

YOUR ANSWER HERE

