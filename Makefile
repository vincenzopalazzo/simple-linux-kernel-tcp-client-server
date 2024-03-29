ifneq ($(KERNELRELEASE),)
	obj-m += network_client.o
	obj-m += network_server.o
# Otherwise we were called directly from the command
# line; invoke the kernel build system.
else
	KERNELDIR ?= /lib/modules/$(shell uname -r)/build
	PWD := $(shell pwd)

default:
	$(MAKE) -C $(KERNELDIR) M=$(PWD) modules

clean:
	rm *.ko *.o *order *symvers *.mod *.mod.c .network_*.o

endif
