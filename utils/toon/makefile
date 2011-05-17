TARGET = ../bin/toon

$(TARGET) : toon.c
ifeq "$(wildcard ../bin)" ""
	mkdir $(dir $@)
endif
	$(CC) -o $@ -O2 -Wall $^ -lm

clean :
	$(RM) $(TARGET)

