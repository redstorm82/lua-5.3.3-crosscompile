#STATIC=0
#DEBUG=1
#RELEASE=1
MAKE = make

CPPFLAGS +=
LDFLAGS :=
LDLIBS :=
LDLIBS_IN:=

cc-option = $(shell if $(CC) $(1) -S -o /dev/null -xc /dev/null \
              > /dev/null 2>&1; then echo "$(1)"; fi ;)

ld-option = $(shell if echo "int main(){return 0;}" | \
		$(CC) $(LDFLAGS) $(CFLAGS) $(1) -o /dev/null -xc - \
		> /dev/null 2>&1; then echo "$(1)"; fi ;)

EXECTARGET = flygo
LIBTARGET = libflygo.a
#save external LDLIBS
LDLIBS_IN := $(LDLIBS)

LINKER = $(CC)
STATIC ?= 0
LUAV ?= 5.3

CURL_PREFIX=../prebuild/curl_install/$(ARCH)
CURL_INCLUDE_DIR=$(CURL_PREFIX)/include
CURL_LIB_DIR=$(CURL_PREFIX)/lib

LUA_PREFIX = ../install/$(ARCH)/usr/local
LUA_INCLUDE_DIR =   $(LUA_PREFIX)/include/lua/$(LUAV)
LUA_LIB_DIR = $(LUA_PREFIX)/lib/lua/$(LUAV)
LUA_BIN_DIR = $(LUA_PREFIX)/bin

INCLUDE_PATH += -I$(CURL_INCLUDE_DIR)
INCLUDE_PATH += -I$(LUA_INCLUDE_DIR)

ifdef DEBUG
CFLAGS += -O0
CPPFLAGS += -DDEBUG
endif
LDFLAGS += $(LIB_PATH)
LDFLAGS += -L./lib/ 
LDLIBS += 
LIBFILES += $(addprefix $(CURL_LIB_DIR)/,libcurl.a)
LIBFILES += $(addprefix $(LUA_LIB_DIR)/,liblua.a)
LIBFILES += $(addprefix $(LUA_LIB_DIR)/,libcjson.a) 

CFLAGS += $(call cc-option, -Wdeclaration-after-statement)
CFLAGS += $(call cc-option, -Wno-switch)
CFLAGS += $(call cc-option, -Wdisabled-optimization)
CFLAGS += $(call cc-option, -Wpointer-arith)
CFLAGS += $(call cc-option, -Wredundant-decls)
CFLAGS += $(call cc-option, -Wno-pointer-sign)
CFLAGS += $(call cc-option, -Wcast-qual)
CFLAGS += $(call cc-option, -Wwrite-strings)
CFLAGS += $(call cc-option, -Wtype-limits)
CFLAGS += $(call cc-option, -Wundef)

CFLAGS += $(call cc-option, -funit-at-a-time)
CPPFLAGS +=$(CFLAGS)

CPPFLAGS += $(INCLUDE_PATH)
OBJS =
OBJS += curlutil.o fly.o qqpostdata.o url.o utils.o timeutil.o

ifeq ($(STATIC), 1)
EXECTARGET := $(EXECTARGET)-halfstatic
LDFLAGS += -Wl,-static
LDFLAGSPOST += -Wl,-Bdynamic
endif
ifeq ($(STATIC), 2)
EXECTARGET := $(EXECTARGET)-static
LDFLAGS += -static
endif

ifdef DEBUG
EXECTARGET := $(EXECTARGET)-debug
endif

ifdef RELEASE
EXECTARGET := $(EXECTARGET)-release
endif

#apply external LDLIBS at the end as well to resolve lining order problems
LDLIBS += $(LDLIBS_IN)
#lm might be needed again at the end
LDLIBS += $(call ld-option, -lm)
LDLIBS += $(call ld-option, -lz)
LDLIBS += $(call ld-option, -ldl)
.PHONY: clean distclean

all: $(LIBTARGET) $(EXECTARGET)

#$(EXECTARGET): FlyGo.o $(LIBTARGET)
$(EXECTARGET): lua_start.o $(LIBTARGET)
	$(CC) $(LDFLAGS) -Wl,--start-group $^ $(LIBFILES) $(LOADLIBES) $(LDLIBS) -Wl,--end-group -Wl,-E $(LDFLAGSPOST) -o $@

$(LIBTARGET):$(OBJS)
	$(AR) $@ $^
	$(RANLIB) $@

print:
	@echo ARCH=$(ARCH)
	@echo LUAV=$(LUAV)
	@echo DEBUG=$(DEBUG)
	@echo LUA_PREFIX=$(LUA_PREFIX)
	@echo LUA_INCLUDE_DIR=$(LUA_INCLUDE_DIR)
	@echo LUA_LIB_DIR=$(LUA_LIB_DIR)
	@echo INSTALL_TOP_CDIR=$(INSTALL_TOP_CDIR)
	@echo INSTALL_TOP_LDIR=$(INSTALL_TOP_LDIR)
	@echo CFLAGS=$(CFLAGS)
	@echo LDFLAGS=$(LDFLAGS)
	@echo CC=$(CC)
	@echo AR=$(AR)
	@echo RANLIB=$(RANLIB)	


#ar cru $ALLLIB *.o
#ranlib $ALLLIB
#mipsel-linux-ar cru libxxx.a  libcurl_la-file.o libcurl_la-timeval.o 
#mipsel-linux-ranlib libxxx.a
#mipsel-linux-gcc -O2 -Wno-system-headers -o curl curl-slist_wc.o curl-tool_binmode.o curl-tool_bname.o curl-tool_cb_dbg.o curl-tool_cb_hdr.o curl-tool_cb_prg.o curl-tool_cb_rea.o curl-tool_cb_see.o curl-tool_cb_wrt.o curl-tool_cfgable.o curl-tool_convert.o curl-tool_dirhie.o curl-tool_doswin.o curl-tool_easysrc.o curl-tool_formparse.o curl-tool_getparam.o curl-tool_getpass.o curl-tool_help.o curl-tool_helpers.o curl-tool_homedir.o curl-tool_hugehelp.o curl-tool_libinfo.o curl-tool_main.o curl-tool_metalink.o curl-tool_mfiles.o curl-tool_msgs.o curl-tool_operate.o curl-tool_operhlp.o curl-tool_panykey.o curl-tool_paramhlp.o curl-tool_parsecfg.o curl-tool_strdup.o curl-tool_setopt.o curl-tool_sleep.o curl-tool_urlglob.o curl-tool_util.o curl-tool_vms.o curl-tool_writeenv.o curl-tool_writeout.o curl-tool_xattr.o ../lib/curl-strtoofft.o ../lib/curl-nonblock.o ../lib/curl-warnless.o  ../lib/.libs/libcurl.a

version.h: config.mk
	./version.sh

version.d: version.h

clean:
	rm -f $(LIBTARGET)
	rm -f $(EXECTARGET)
	rm -f $(EXECTARGET)-*
	rm -f *.o
	rm -f version.h
	rm -f *.a

distclean: clean
%.o:%.c %.cpp
	$(CC) $(CPPFLAGS) -c -o $@ $<
    
### Automatic generation of headers dependencies ###
#%.d:%.c
#	$(CC) $(CPPFLAGS) -MM -MF $@ $<
#%.o:%.d

#-include $(OBJS:.o=.d)
# version.d

# DESTDIR: (no default)
# used by package managers to install into a temporary destination
DESTDIR=

INSTALL_DIR=mkdir -p
INSTALL=cp -rf
DATAPERM = 644
EXECPERM = 755
CHMOD=chmod
install:
	$(INSTALL_DIR) $(DESTDIR)$(LUA_LIB_DIR)
	$(INSTALL) $(LIBTARGET) $(DESTDIR)$(LUA_LIB_DIR)/$(LIBTARGET)
	$(CHMOD) $(DATAPERM) $(DESTDIR)$(LUA_LIB_DIR)/$(LIBTARGET)
	$(INSTALL_DIR) $(DESTDIR)$(LUA_BIN_DIR)
	$(INSTALL) $(EXECTARGET) $(DESTDIR)$(LUA_BIN_DIR)/$(EXECTARGET)
	$(CHMOD) $(EXECPERM) $(DESTDIR)$(LUA_BIN_DIR)/$(EXECTARGET)
	$(INSTALL) func.lua $(DESTDIR)$(LUA_BIN_DIR)/
	$(CHMOD) $(EXECPERM) $(DESTDIR)$(LUA_BIN_DIR)/func.lua
