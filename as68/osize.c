/*
 *	For now this only works on object files. It's mostly here so I can
 *	check the assembler output looks valid.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <getopt.h>
#include <stdint.h>
#include <ctype.h>

#include "obj.h"

static char *arg0;
static int err;

static char segname[] = "ATDB???????????U";

static int do_osize(FILE *fp, const char *name)
{
    static struct objhdr oh;
    off_t base;
    uint8_t type;
    int c;
    uint8_t i;
    uint16_t addr;
    char symname[17];

    if (fread(&oh, sizeof(oh), 1, fp) != 1 ||
        oh.o_magic != MAGIC_OBJ) {
            fprintf(stderr, "%s: %s: not a valid object file.\n", arg0, name);
            return 1;
    }
    for(i = 0; i < 8; i++)
        printf("%s: %c %4x\n", name, segname[i], oh.o_size[i]);
}

int main(int argc, char *argv[])
{
    int n;
    int err = 0;

    arg0 = argv[0];

    if (argc == 1)
        do_osize(stdin, "-");
    else while (n < argc) {
        FILE *fp = fopen(argv[n], "r");
        if (fp == NULL) {
            perror(argv[n]);
            err |= 1;
        } else {
            err |= do_osize(fp, argv[n]);
            fclose(fp);
        }
        n++;
    }
    exit(err);
}

