// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed.
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.


// Put your code here.

@8192
D=A
@num_screen_registers
M=D

(LOOP)
  @i
  M=0

  // 1. If KBD==0: keep looping
  @KBD
  D=M
  @WHITEN
  D;JEQ

  // 2. Else: blacken the screen
(SCREEN_LOOP)
  @i
  D=M
  @num_screen_registers
  A=M
  D=D-A
  @LOOP
  D;JEQ

  @SCREEN
  D=A
  @i
  A=D+M
  M=-1

  @i
  M=M+1
  @SCREEN_LOOP
  0;JMP


(WHITEN)
  @i
  D=M
  @num_screen_registers
  A=M
  D=D-A
  @LOOP
  D;JEQ

  @SCREEN
  D=A
  @i
  A=D+M
  M=0

  @i
  M=M+1
  @WHITEN
  0;JMP
