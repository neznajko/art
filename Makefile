# Usage: TARGET=<prognom> SUFFIX=<c or s> make -f ../Makefile
CC = gcc
CFLAGS = -ggdb -I..
$(TARGET): $(TARGET).o
	$(CC) $^ -o $@
$(TARGET).o: $(TARGET).$(SUFFIX)
	$(CC) $(CFLAGS) $< -c -o $@
.PHONY: clean
clean:
	$(RM) $(TARGET) $(TARGET).o
