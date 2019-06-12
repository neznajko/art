# Usage: TARGET=<prognom> SUFFIX=<c or s> make -f ../Makefile
CC = gcc
DBFLAG = -ggdb
CFLAGS = $(DBFLAG) -I..
LDFLAGS = $(DBFLAG)
$(TARGET): $(TARGET).o
	$(CC) $(LDFLAGS) $^ -o $@
$(TARGET).o: $(TARGET).$(SUFFIX)
	$(CC) $(CFLAGS) $< -c -o $@
.PHONY: clean
clean:
	$(RM) $(TARGET) $(TARGET).o
