NASM        =   /usr/bin/nasm
RM          =   rm -f

SRCDIR		=	./
OBJDIR      =   ../object/
INCDIR      =   ../include/

SRC		    =   $(wildcard $(SRCDIR)*.S)
OBJ		    =   $(addprefix $(OBJDIR),$(patsubst %.S,%.o,$(notdir $(SRC))))

NASMFLAGS   =   -f elf32

all: $(OBJ)

$(OBJDIR)%.o: $(SRCDIR)%.S
	$(NASM) -o $@ $< $(NASMFLAGS)

clean:
	$(RM) $(OBJ)

.PHONY: all clean re
