//
// Created by meffre_q on 10/15/17.
//

#include "lib/video.h"
#include "lib/string.h"

static void
terminal_put_entry_at(char c, uint8_t color, size_t x, size_t y) {
    const size_t index = y * VGA_WIDTH + x;
    terminal_buffer[index] = vga_entry(c, color);
}

static void
terminal_putchar(char c) {
    terminal_put_entry_at(c, terminal_color, terminal_column, terminal_row);
    if (++terminal_column == VGA_WIDTH) {
        terminal_column = 0;
        if (++terminal_row == VGA_HEIGHT)
            terminal_row = 0;
    }
}

static void
terminal_write(const char *data, size_t size) {
    for (size_t i = 0; i < size; i++)
        terminal_putchar(data[i]);
}

inline uint8_t
vga_entry_color(enum vga_color fg, enum vga_color bg) {
    return fg | bg << 4;
}

inline uint16_t
vga_entry(unsigned char uc, uint8_t color) {
    return (uint16_t) uc | (uint16_t) color << 8;
}

void
kprint_str(const char *str) {
    terminal_write(str, strlen(str));
}

