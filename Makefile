INST_PREFIX = /usr/local
INST_LIBDIR = $(INST_PREFIX)/lib/lua/5.2/mjolnir/lx/lockscreen
INST_LUADIR = $(INST_PREFIX)/share/lua/5.2/mjolnir/lx/

LOGIN_LIB = -F /System/Library/PrivateFrameworks -framework login

all:
	@echo Building...
	$(CC) $(CFLAGS) -I$(LUA_INCDIR) -c lockscreen.m -o lockscreen.o
	$(CC) $(LIBFLAG) $(LOGIN_LIB) lockscreen.o -o internal.so

install:
	@echo Installing...
	mkdir -p $(INST_LUADIR)
	mkdir -p $(INST_LIBDIR)
	cp internal.so $(INST_LIBDIR)
	cp lockscreen.lua $(INST_LUADIR)
