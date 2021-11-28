#
# Makefile for Commuter Simulator
#
# The Build Rules for This Program
#
# Variables
APP=main
CC=gcc
CFLAGS=-Wall -Werror -ansi -std=c99 -g
#CFLAGS=-Wall -Werror -ansi -pedantic-errors -std=c99 -g
LDFLAGS=-lncurses
SRCS=$(wildcard *.c)
OBJS=$(SRCS:.c=.o)
EXE=$(APP).exe
LOG=$(APP).log

# Rules
# for compilation of c files into object files
%.o: %.c 
	$(CC) $(CFLAGS) -c -o $@ $<

# for linking object files into an executable program file
$(EXE): $(OBJS)
	$(CC) -o $@ $^ $(LDFLAGS)

# This is to trick make to know that "clean" and "run" are targets
.PHONY: clean run

# This rule replaces the run.$(APP).sh bash script
#	./$(EXE) | tee $(LOG)
run: $(EXE)
	./$(EXE)

clean:
	/bin/rm -f $(OBJS) $(EXE) $(LOG)
