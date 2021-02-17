PREFIX ?= /usr/local
CC ?= cc
CFLAGS = -I/usr/local/include
LDLIBS = -L/usr/local/lib
LDFLAGS = -lX11

output: dwmblocks.c blocks.def.h blocks.h
	${CC}  dwmblocks.c $(CFLAGS) $(LDLIBS) $(LDFLAGS) -o dwmblocks 
blocks.h:
	cp blocks.def.h $@


clean:
	rm -f *.o *.gch dwmblocks
install: output
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	install -m 0755 dwmblocks $(DESTDIR)$(PREFIX)/bin/dwmblocks
uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/dwmblocks
