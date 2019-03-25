CC:=cc

CFLAGS:= -Wall -pedantic -std=c99

FRAMEWORKS:=
LIBRARIES:=

LDFLAGS=$(LIBRARIES) $(FRAMEWORKS)

BIN:= main
SRCS:= $(BIN:=.c) $(wildcard src/*.c)
OBJS:= $(SRCS:=.o)
DEPS:= $(wildcard include/*.h)

$(BIN): $(OBJS) $(DEPS)
	$(CC) $(OBJS) $(LDFLAGS) -o $(@)

%.c.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

.PHONY: clean
clean:
	rm -f *.o $(wildcard src/*.o)
