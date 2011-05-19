TARGETS = ../bin/img2tex

all: $(TARGETS)

../bin/%: %.c
ifeq "$(wildcard ../bin)" ""
	-mkdir $(dir $@)
endif
	$(CC) -o $@ -O2 -Wall $^ -lgd

clean :
	$(RM) $(TARGETS)

