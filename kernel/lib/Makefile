CC          =   i686-elf-gcc
RM          =   rm -f

SRCDIR		=	./
OBJDIR      =   ../../object/
INCDIR      =   ../../include/

SRC		    =   $(wildcard $(SRCDIR)*.c)
OBJ		    =   $(addprefix $(OBJDIR),$(patsubst %.c,%.o,$(notdir $(SRC))))

CFLAGS      =   -std=gnu99 -ffreestanding -O2 -Wall -Wextra -I$(INCDIR)

all: $(OBJ)

$(OBJDIR)%.o: $(SRCDIR)%.c
	$(CC) -o $@ -c $< $(CFLAGS)

clean:
	$(RM) $(OBJ)

.PHONY: all clean
