#include "sys/kernel.h"
#include "lib/video.h"

#if defined(__linux__)
#error "ERROR: Cross compilation failed. Use Linux !"
#endif

#if !defined(__i386__)
#error "ERROR: You need to use a i386 compiler"
#endif

void    kmain(void) {
    terminal_initialize();
    kprint_str("Dagger's Kernel! (Guillaume swallows)\n");
}
