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
(START)
    @KBD
    D=M
    @VAL
    M=D
    @FILL
    D;JEQ
    @VAL
    M=-1
//if 0
//r0 = 0
//jmp fill
//else
//r0 = 0-1
//jmp fill

(FILL)
//2^9 / 2^4 = 2^5 = 32 outer loop
//2^8 = 256 outer loop
//R1 = 32
    @256
    D=A
    @1
    M=D
    @SCREEN
    D=A
    @POINTER
    M=D
//R2 = 256
    
//While r2 > 0 
(OUTERLOOP)
    @1
    D=M
    @ENDOUTER
    D;JLE

    @32
    D=A
    @2
    M=D
//While r3 > 0 
(INNERLOOP)
    @2
    D=M
    @ENDINNER
    D;JLE
 
    @VAL
    D=M
    @POINTER //SET SCREEN
    A=M
    M=D

    @16
    D=A
    @POINTER
    M=M+1 //ADVANCE POINTER BY 16

    @2
    M=M-1
    @INNERLOOP
    0;JMP
(ENDINNER)

    @1
    M=M-1
    @OUTERLOOP
    0;JMP
(ENDOUTER)

    @START
    0;JMP