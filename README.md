# racket-calc
A Racket program that takes an infix arithmetic expression from command line input and returns the result of evalutating that expression back to the command line.

## Features
 - Arithmetic expressions are parsed using an extended BNF grammar (thanks to [BRAG](http://docs.racket-lang.org/brag/))
 - Supports +, -, /, *, (, and ) operations
 - Supports operator precedence
 - Supports decimal numbers
 - Typing "q" stops the program

## Why Do This?
It was my first attempt doing a lot of things I wanted to try - experiment with Racket, experiment with a [BNF](https://en.wikipedia.org/wiki/Backus%E2%80%93Naur_form) (or [extended BNF](https://en.wikipedia.org/wiki/Extended_Backus%E2%80%93Naur_form)) grammar, try to evaluate infix expressions without using [stack arithmetic](http://faculty.cs.niu.edu/~hutchins/csci241/eval.htm), or implmenting some variant of Dijkstra's [shunting-yard algorithm](https://en.wikipedia.org/wiki/Shunting-yard_algorithm) or having to build a parser by hand, and to see how well a Racket program could compile down to a stand alone exectutable.

## How To Run This Thing
To run **racket-calc** on Linux, find wherever you extracted the .tgz to and the binary should be **/bin**. Once there you would type`./calc`. Because the .tgz version of **racket-calc** was compiled for distibution on a Linux machine, it's binary is said to [only run on other Linux machines](https://docs.racket-lang.org/raco/exe.html). Though the binary itself has only been tested on Ubuntu (specifically _Ubuntu 12.04.5 LTS_ running from crouton on a Chromebook - because I'm clearly insane). 

Just for "fun" - I decided to see if I could compile **racket-calc** on a mac, and was successful in doing so (at least for macOS Sierra 10.12.16). The .dmg is now available under [dist](https://github.com/mastergray/racket-calc/raw/master/dist/calc.dmg) Rejoice.  

## Compiling This Yourself 
If, for some reason you wanted to compile the source yourself on some other platform, make sure you have the [brag package](https://github.com/mbutterick/brag) installed. If not, you can install it by running 

`raco pkg install brag` 

(or _.raco pkg install brag_ as I had to do for compiling to mac). Then, it _should_ be as easy as loading **calc.rtk** into **DrRacket** and clicking **Racket** > **Create  Exectuable** with **Distribution** selected - as long as all source files are still in the same directory.

Add an icon if you're feeling especially ambitious.

## Project Outline
- |-> **build** _Build files generated by DrRacket for distribution_
- |-> **dist** _A .tgz of the build files generated by DrRacket_
- |-> **src**
  - |-> **calc.rtk** _Defines main program_
  - |-> **calc-expander.rtk** _Module that evalutates an arithmetic expression as a parsed syntax object_
  - |-> **calc-grammar**. _Defines grammar used by the BRAG parser_
  - |-> **calc-reader.rtk** _Module that transforms an arithmetic expression string into a parsed syntax object_
- |-> **README.md** _Seriously?_
- |-> **LICENSE.md** _Licensing info...because apparently that's what you're suppose to do now_
## Acknowledgments
- Decimal results are only returned if inputs have decimal values (so 1/2 would return _1/2_ but 1.5+.5 would return _2.0_)
- No exponents supported yet _(sorry math)_
- Any run-time error that gets thrown will cause the program to terminate (exception handling in Racket is still something I am  aspiring towards)
## License
This project is licensed under the MIT License - see the [LICENSE.md](https://github.com/mastergray/racket-calc/blob/master/LICENSE) file for details
