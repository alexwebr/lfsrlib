#include "aunit.h"
#include "lfsr.h"
#include <stdio.h>
#include <math.h>

au_main

{ // Test for shift, looking for two ON 'marker' bits
  enum lfsr_bit_t state[8] = {OFF, OFF, OFF, OFF, OFF, OFF, ON, OFF};
  enum lfsr_bit_t msb = lfsr_shift(state, 8, ON);
  au_eq("shift #1, first bit", state[0], ON);
  au_eq("shift #1, middle", state[1], OFF);
  au_eq("shift #1, middle", state[2], OFF);
  au_eq("shift #1, middle", state[3], OFF);
  au_eq("shift #1, middle", state[4], OFF);
  au_eq("shift #1, middle", state[5], OFF);
  au_eq("shift #1, middle", state[6], OFF);
  au_eq("shift #1, last bit", state[7], ON);
  au_eq("shift #1, MSB", msb, OFF);
}

{ // Test for shift, looking for two OFF 'marker' bits
  enum lfsr_bit_t state[8] = {ON, ON, ON, ON, ON, ON, OFF, ON};
  enum lfsr_bit_t msb = lfsr_shift(state, 8, OFF);
  au_eq("shift #2, first bit", state[0], OFF);
  au_eq("shift #2, middle", state[1], ON);
  au_eq("shift #2, middle", state[2], ON);
  au_eq("shift #2, middle", state[3], ON);
  au_eq("shift #2, middle", state[4], ON);
  au_eq("shift #2, middle", state[5], ON);
  au_eq("shift #2, middle", state[6], ON);
  au_eq("shift #2, last bit", state[7], OFF);
  au_eq("shift #2, MSB", msb, ON);
}


{ // Test for xor_taps
  enum lfsr_bit_t state[8] = {ON, ON, ON, ON, ON, ON, ON, ON};
  size_t taps[] = {2, 3};
  au_eq("xor_taps, two taps, both ones", lfsr_xor_taps(state, 8, taps, 2), OFF);
}

{ // Test for xor_taps
  enum lfsr_bit_t state[8] = {OFF, OFF, OFF, OFF, OFF, OFF, OFF, OFF};
  size_t taps[] = {2, 3};
  au_eq("xor_taps, two taps, both zeros", lfsr_xor_taps(state, 8, taps, 2), OFF);
}

{ // Test for xor_taps
  enum lfsr_bit_t state[8] = {ON, ON, OFF, ON, ON, ON, ON, ON};
  size_t taps[] = {2, 3};
  au_eq("xor_taps, two taps, different", lfsr_xor_taps(state, 8, taps, 2), ON);
}

{ // Test for xor_taps
  enum lfsr_bit_t state[8] = {ON, ON, ON, ON, ON, ON, ON, ON};
  size_t taps[] = {2, 3, 4};
  au_eq("xor_taps, three taps, all ones", lfsr_xor_taps(state, 8, taps, 3), ON);
}

{ // Test for xnor_taps
  enum lfsr_bit_t state[8] = {ON, ON, ON, ON, ON, ON, ON, ON};
  size_t taps[] = {2, 3};
  au_eq("xnor_taps, two taps, both on", lfsr_xnor_taps(state, 8, taps, 2), ON);
}

{ // Test for xnor_taps
  enum lfsr_bit_t state[8] = {OFF, OFF, OFF, OFF, OFF, OFF, OFF, OFF};
  size_t taps[] = {2, 3};
  au_eq("xnor_taps, two taps, both off", lfsr_xnor_taps(state, 8, taps, 2), ON);
}

{ // Test for xnor_taps
  enum lfsr_bit_t state[8] = {ON, ON, OFF, ON, ON, ON, ON, ON};
  size_t taps[] = {2, 3};
  au_eq("xnor_taps, two taps, different", lfsr_xnor_taps(state, 8, taps, 2), OFF);
}

{ // Test for xnor_taps
  enum lfsr_bit_t state[8] = {ON, ON, ON, ON, ON, ON, ON, ON};
  size_t taps[] = {2, 3, 4};
  au_eq("xnor_taps, three taps, all on", lfsr_xnor_taps(state, 8, taps, 3), ON);
}

{ // Test for xnor_taps
  enum lfsr_bit_t state[8] = {OFF, OFF, OFF, OFF, OFF, OFF, OFF, OFF};
  size_t taps[] = {2, 3, 4};
  au_eq("xnor_taps, three taps, all off", lfsr_xnor_taps(state, 8, taps, 3), OFF);
}

{ // Test for dump, all bits off
  enum lfsr_bit_t state[8] = {OFF, OFF, OFF, OFF, OFF, OFF, OFF, OFF};
  au_eq("dump 0", lfsr_dump(state, 8), 0);
}

{ // Test for dump, low bit on
  enum lfsr_bit_t state[] = {ON, OFF, OFF, OFF, OFF, OFF, OFF, OFF};
  au_eq("dump 1", lfsr_dump(state, 8), 1);
}

{ // Test for dump, two bits on
  enum lfsr_bit_t state[] = {ON, OFF, ON, OFF, OFF, OFF, OFF, OFF};
  au_eq("dump 5", lfsr_dump(state, 8), 5);
}

{ // Test for dump, only the highest bit is set
  enum lfsr_bit_t state[] = {OFF, OFF, OFF, OFF, OFF, OFF, OFF, ON};
  au_eq("dump 128", lfsr_dump(state, 8), 128);
}

{ // test for load, where not all bits are set
  enum lfsr_bit_t state[] = {OFF, OFF, OFF, OFF, OFF, OFF, OFF, OFF};
  lfsr_load(state, 8, 10);
  au_eq("load 10", state[7], OFF);
  au_eq("load 10", state[6], OFF);
  au_eq("load 10", state[5], OFF);
  au_eq("load 10", state[4], OFF);
  au_eq("load 10", state[3], ON);
  au_eq("load 10", state[2], OFF);
  au_eq("load 10", state[1], ON);
  au_eq("load 10", state[0], OFF);
}

{ // test for load where all bits are originally on, loaded with 0
  enum lfsr_bit_t state[] = {ON, ON, ON, ON, ON, ON, ON, ON};
  lfsr_load(state, 8, 0);
  au_eq("load 0", state[7], OFF);
  au_eq("load 0", state[6], OFF);
  au_eq("load 0", state[5], OFF);
  au_eq("load 0", state[4], OFF);
  au_eq("load 0", state[3], OFF);
  au_eq("load 0", state[2], OFF);
  au_eq("load 0", state[1], OFF);
  au_eq("load 0", state[0], OFF);
}

{ // test for load where where all bits are original off, loaded with 255
  enum lfsr_bit_t state[] = {OFF, OFF, OFF, OFF, OFF, OFF, OFF, OFF};
  lfsr_load(state, 8, 255);
  au_eq("load 255", state[7], ON);
  au_eq("load 255", state[6], ON);
  au_eq("load 255", state[5], ON);
  au_eq("load 255", state[4], ON);
  au_eq("load 255", state[3], ON);
  au_eq("load 255", state[2], ON);
  au_eq("load 255", state[2], ON);
  au_eq("load 255", state[1], ON);
  au_eq("load 255", state[0], ON);
}

{ // general round-trip test for 8-bit register
  enum lfsr_bit_t state[8];
  lfsr_load(state, 8, 203);
  au_eq("load + dump round trip, 8 bit", lfsr_dump(state, 8), 203);
}

{ // general round-trip test for 16-bit register
  enum lfsr_bit_t state[16];
  lfsr_load(state, 16, 6003);
  au_eq("load + dump round trip, 16 bit", lfsr_dump(state, 16), 6003);
}

{ // general round-trip test for 32-bit register
  enum lfsr_bit_t state[32];
  lfsr_load(state, 32, 90003);
  au_eq("load + dump round trip, 32 bit", lfsr_dump(state, 32), 90003);
}

au_endmain
