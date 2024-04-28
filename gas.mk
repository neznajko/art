# Example, from project 121E, type:
# PRO=ee make -f ../gas.mk.
SRC  := ${PRO}.s
CMP  := gcc -g -I../lib
GOAL := a.out

$(GOAL): ${SRC}
	$(CMP) $<

.PHONY: clean
clean:
	$(RM) $(GOAL)
