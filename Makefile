all:
	@bison -y -d calc.y
	@flex calc.l
	@gcc -c y.tab.c lex.yy.c
	@gcc y.tab.o lex.yy.o calc.c -o calc -lm

clean:
	@rm lex.yy.c calc y.tab.c y.tab.h