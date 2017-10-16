#lang brag
@EXP: NUM | TERM | FACTOR
@TERM: ADD | SUB
ADD: [FACTOR|TERM] (/'+' [FACTOR|TERM])+ | /'(' [FACTOR|TERM] (/'+' [FACTOR|TERM])* /')' 
SUB: [FACTOR|TERM] (/'-' [FACTOR|TERM])* | /'(' [FACTOR|TERM] (/'-' [FACTOR|TERM])* /')'
@FACTOR: MUL | DIV
MUL: EXP ( /'*' EXP)* | /'(' EXP (/'*' EXP)* /')'
DIV: EXP ( /'/' EXP)* | /'(' EXP (/'/' EXP)* /')'
NUM: ["-"] DIGIT+  
DIGIT: "0"|"1"|"2"|"3"|"4"|"5"|"6"|"7"|"8"|"9"|"."