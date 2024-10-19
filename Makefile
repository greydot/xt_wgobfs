XTABLES_CFLAGS=$(shell pkg-config --cflags xtables)
XTABLES_LDFLAGS=$(shell pkg-config --libs xtables)

all: lib module

lib: libxt_WGOBFS.so

lib_install: lib
	mkdir -p $(DESTDIR)/lib/xtables
	cp libxt_WGOBFS.so $(DESTDIR)/lib/xtables

libxt_WGOBFS.so:
	$(CC) -shared $(XTABLES_LDFLAGS) $(XTABLES_LDFLAGS) -o $@ src/libxt_WGOBFS.c

module:
	$(MAKE) -C $(KERNEL_DIR) M=$(PWD)/src modules

module_install: module
	$(MAKE) -C $(KERNEL_DIR) M=$(PWD)/src modules_install
