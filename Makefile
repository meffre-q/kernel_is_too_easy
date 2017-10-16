PROG        =   dagger_kernel

LD          =   i686-elf-gcc
RM          =   rm -f

BINDIR      =   ./bin/
BOOTDIR     =   ./boot/
KERNELDIR   =   ./kernel/
OBJDIR      =   ./object/

OBJ		    =   $(wildcard $(OBJDIR)*.o)

LFLAGS      =   -T linker.ld -ffreestanding -O2 -nostdlib -lgcc

all: $(PROG)

$(PROG): boot kernel
	$(LD) -o $(BINDIR)$@ $(OBJ) $(LFLAGS)

boot:
	$(MAKE) -C $(BOOTDIR) all

kernel:
	$(MAKE) -C $(KERNELDIR) all

test:
	grub-mkrescue -o $(BINDIR)$(PROG).iso test --xorriso=${HOME}/Downloads/xorriso/xorriso-1.4.6/xorriso/xorriso

fclean: clean
	$(RM)   $(BINDIR)$(PROG)

clean:
	$(MAKE) -C $(BOOTDIR) clean
	$(MAKE) -C $(KERNELDIR) clean

re: fclean all

.PHONY: all clean fclean re test boot kernel
