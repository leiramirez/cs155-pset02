# CS 155 Problem Set 2

To use the `main.lex` lexical analyzer on an input file (e.g. `sample.easy`), run the following commands on the terminal:
```
$ flex main.lex
$ gcc lex.yy.c -lfl
$ ./a.out sample.easy
```

This lexical analyzer does not handle comments. Expected output is in the format `<token_class, lexeme>` pair, and each pair is printed on a new line. Invalid tokens not recognized by the analyzer will be outputted as an invalid character.