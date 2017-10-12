PROG        =   dagger_kernel

CC          =   i686-elf-gcc
NASM        =   /usr/bin/nasm
LD          =   i686-elf-gcc
RM          =   rm -f

BINDIR      =   bin
BOOTDIR     =   boot
OBJDIR      =   object

SRCASM      =   $(wildcard $(BOOTDIR)/*.S)
SRCC        =   $(wildcard $(BOOTDIR)/*.c)
OBJSASM     =   $(addprefix $(OBJDIR)/,$(patsubst %.S,%.o,$(notdir $(SRCASM))))
OBJSC       =   $(addprefix $(OBJDIR)/,$(patsubst %.c,%.o,$(notdir $(SRCC))))

CFLAGS      =   -m32 -std=gnu99 -ffreestanding -O2 -Wall -Wextra
LFLAGS      =   -m32 -T linker.ld -ffreestanding -O2 -nostdlib -lgcc
NASMFLAGS   =   -f elf32

all: $(PROG)

$(PROG): $(OBJSASM) $(OBJSC)
	$(LD) -o $(BINDIR)/$@ $^ $(LFLAGS)

$(OBJDIR)/%.o: $(BOOTDIR)/%.S
	$(NASM) -o $@ $< $(NASMFLAGS)

$(OBJDIR)/%.o: $(BOOTDIR)/%.c
	$(CC) -o $@ -c $< $(CFLAGS)

fclean: clean
	$(RM)   $(BINDIR)/$(PROG)

clean:
	$(RM)   $(OBJSASM) $(OBJSC)

re: fclean all

.PHONY: all clean fclean re
