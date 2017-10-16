NASM        =   /usr/bin/nasm
RM          =   rm -f

SRCDIR		=	./
OBJDIR      =   ../object/
INCDIR      =   ../include/

SRC		    =   $(wildcard $(SRCDIR)*.S)
OBJ		    =   $(addprefix $(OBJDIR),$(patsubst %.S,%.o,$(notdir $(SRC))))

ifeq ($(DEBUG), yes)
	NASMFLAGS   =   -f elf32 -g
else
	NASMFLAGS   =   -f elf32
endif

all: $(OBJ)

$(OBJDIR)%.o: $(SRCDIR)%.S
	$(NASM) -o $@ $< $(NASMFLAGS)

clean:
	@$(RM) $(OBJ)

.PHONY: all clean re
