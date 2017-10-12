PROG        =   dagger_kernel

CC          =   /usr/bin/gcc
NASM        =   /usr/bin/nasm
LD          =   /usr/bin/ld
RM          =   rm -f

BINDIR      =   ./bin
BOOTDIR     =   ./src
OBJDIR      =   ./object

SRCASM      =   $(BOOTDIR)/boot.S
SRCC        =   $(BOOTDIR)/kernel.c
OBJSASM     =   $(addprefix $(OBJDIR)/,$(patsubst %.S,%.o,$(notdir $(SRCASM))))
OBJSC       =   $(addprefix $(OBJDIR)/,$(patsubst %.c,%.o,$(notdir $(SRCC))))

CFLAGS      =   -m32 -std=gnu99 -ffreestanding -O2 -Wall -Wextra
LFLAGS      =   -m32
NASMFLAGS   =   -f elf32

all: $(PROG)

$(PROG): $(OBJSASM)
    $(LD) $(LFLAGS) $(OBJS) -o $(BINDIR)/$(PROG)

$(OBJDIR)/%.o: $(BOOTDIR)/%.S
    $(NASM) $(NASMFLAGS) $(SRCASM)

$(OBJDIR)/%.o: $(BOOTDIR)/%.c
    $(CC) $(CFLAGS) $(SRCC)

fclean: clean
    $(RM)   $(BINDIR)/$(PROG)

clean:
    $(RM)   $(OBJSASM) $(OBJSC)

re: fclean all

.PHONY: all clean fclean re
