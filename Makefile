PROG        =   dagger_kernel-1.0-x86

LD          =   i686-elf-gcc
RM          =   rm -f

BINDIR      =   ./bin/
BOOTDIR     =   ./boot/
KERNELDIR   =   ./kernel/
OBJDIR      =   ./object/
TESTDIR		=	./test/

OBJ		    =   $(wildcard $(OBJDIR)*.o)

ifeq ($(DEBUG), yes)
	LFLAGS      =   -T linker.ld -ffreestanding -O2 -nostdlib -lgcc -g
else
	LFLAGS      =   -T linker.ld -ffreestanding -O2 -nostdlib -lgcc
endif

all: $(PROG)

$(PROG): debug boot kernel
	@echo "Linking Kernel to dagger_kernel..."
	@$(LD) -o $(BINDIR)$@ $(OBJ) $(LFLAGS)
	@echo "Compilation done for $(PROG)"

debug:
ifeq ($(DEBUG), yes)
	@echo "Compiling with debug flags enable..."
else
	@echo "Compiling with debug flags disable..."
endif

boot:
	@echo "Compiling boot files..."
ifeq ($(DEBUG), yes)
	@$(MAKE) -s -C $(BOOTDIR) all DEBUG=yes
else
	@$(MAKE) -s -C $(BOOTDIR) all
endif

kernel:
	@echo "Compiling Kernel files..."
ifeq ($(DEBUG), yes)
	@$(MAKE) -s -C $(KERNELDIR) all DEBUG=yes
else
	@$(MAKE) -s -C $(KERNELDIR) all
endif

test:
	@echo "Creating iso from Kernel..."
	@cp $(BINDIR)$(PROG) $(TESTDIR)boot/
	@grub-mkrescue -o $(BINDIR)$(PROG).iso test --xorriso=${HOME}/Downloads/xorriso/xorriso-1.4.6/xorriso/xorriso

fclean: clean
	@echo "Cleaning Kernel..."
	@$(RM)   $(BINDIR)$(PROG)

clean:
	@echo "Cleaning objects..."
	@$(MAKE) -s -C $(BOOTDIR) clean
	@$(MAKE) -s -C $(KERNELDIR) clean

re: fclean all

.PHONY: all clean fclean re test boot kernel debug
