//
// Created by meffre_q on 10/15/17.
//

#include "lib/string.h"

size_t  strlen(const char *str) {
    size_t  i = 0;

    while (str[i])
        i++;
    return i;
}
