CC          =   i686-elf-gcc
RM          =   rm -f

SRCDIR		=	./
OBJDIR      =   ../object/
INCDIR      =   ../include/
LIBDIR		=	./lib/

SRC		    =   $(wildcard $(SRCDIR)*.c)
OBJ		    =   $(addprefix $(OBJDIR),$(patsubst %.c,%.o,$(notdir $(SRC))))

CFLAGS      =   -std=gnu99 -ffreestanding -O2 -Wall -Wextra -I$(INCDIR)

all: $(OBJ) lib

lib:
	$(MAKE) -C $(LIBDIR) all

$(OBJDIR)%.o: $(SRCDIR)%.c
	$(CC) -o $@ -c $< $(CFLAGS)

clean:
	$(RM) $(OBJ)
	$(MAKE) -C $(LIBDIR) clean

.PHONY: all clean lib
