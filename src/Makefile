build:
	$(MAKE) -C $(KERNEL_DIR) M=$(PWD) modules

install: build
	$(MAKE) -C $(KERNEL_DIR) M=$(PWD) modules_install
