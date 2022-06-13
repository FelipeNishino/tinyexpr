CC = gcc
CCFLAGS = -Wall -Wshadow -O2
LFLAGS = -lm

.PHONY = all clean

all: smoke smoke_pr repl bench example example2 example3


smoke: smoke.c tinyexpr.c
	$(CC) $(CCFLAGS) -o $@.out $^ $(LFLAGS)
	./$@.out

smoke_pr: smoke.c tinyexpr.c
	$(CC) $(CCFLAGS) -DTE_POW_FROM_RIGHT -DTE_NAT_LOG -o $@.out $^ $(LFLAGS)
	./$@.out

repl: repl.o tinyexpr.o
	$(CC) $(CCFLAGS) -o $@.out $^ $(LFLAGS)

repl-readline: repl-readline.o tinyexpr.o
	$(CC) $(CCFLAGS) -o $@.out $^ $(LFLAGS) -lreadline

bench: benchmark.o tinyexpr.o
	$(CC) $(CCFLAGS) -o $@.out $^ $(LFLAGS)

example: example.o tinyexpr.o
	$(CC) $(CCFLAGS) -o $@.out $^ $(LFLAGS)

example2: example2.o tinyexpr.o
	$(CC) $(CCFLAGS) -o $@.out $^ $(LFLAGS)

example3: example3.o tinyexpr.o
	$(CC) $(CCFLAGS) -o $@.out $^ $(LFLAGS)

examplefac: examplefac.o tinyexpr.o
	$(CC) $(CCFLAGS) -o $@.out $^ $(LFLAGS)

repl-readline.o: repl.c
	$(CC) -c -DUSE_READLINE $(CCFLAGS) $< -o $@

.c.o:
	$(CC) -c $(CCFLAGS) $< -o $@

clean:
	rm -f *.o *.exe example.out example2.out example3.out examplefac.out bench.out repl.out smoke_pr.out smoke.out
