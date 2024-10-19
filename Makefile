XTABLES_CFLAGS=$(shell pkg-config --cflags xtables)
XTABLES_LDFLAGS=$(shell pkg-config --libs xtables)

all: lib module

lib: libxt_WGOBFS.so

%.so: %.o
	$(CC) -shared $(XTABLES_LDFLAGS) -o $@ $<

%.o: src/%.c
	$(CC) $(XTABLES_CFLAGS) -o $@ -c $<

module:
	$(MAKE) -C $(KERNEL_DIR) M=$(PWD)/src modules

module_install: module
	$(MAKE) -C $(KERNEL_DIR) M=$(PWD)/src modules_install
