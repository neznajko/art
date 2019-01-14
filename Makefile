# Usage: TARGET=<prognom> make -f ../Makefile
CC = gcc
CFLAGS = -ggdb -I..
$(TARGET): $(TARGET).o
	$(CC) $^ -o $@
$(TARGET).o: $(TARGET).s
	$(CC) $(CFLAGS) $< -c -o $@
.PHONY: clean
clean:
	$(RM) $(TARGET) $(TARGET).o
