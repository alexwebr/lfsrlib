#!/bin/sh

bit="$1"

cat <<EOF > ${bit}bit.c
#include <stdio.h>
#include "lfsr.h"

// ${bit}-bit main program for the LFSR library
// autogenerated by generate_mains.sh
void main()
{
  enum lfsr_bit_t state[${bit}] = {1};
  size_t taps[] = LFSR_MAXIMAL${bit};
  while (1) {
    printf("%d\n", lfsr_dump(state, ${bit}));
    lfsr_shift(state, ${bit}, lfsr_xor_taps(state, ${bit}, taps, sizeof(taps)));
  }
}
EOF
