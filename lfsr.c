#include <math.h>
#include <unistd.h>
#include "lfsr.h"

enum lfsr_bit_t lfsr_xor_taps(enum lfsr_bit_t *state, size_t state_length, size_t *taps, size_t tap_count)
{
  enum lfsr_bit_t result;
  unsigned int i = 0;
  for (result = state[taps[i++]-1]; i < tap_count; ++i) {
    result = (result == state[taps[i]-1]) ? OFF : ON;
  }
  return result;
}

enum lfsr_bit_t lfsr_xnor_taps(enum lfsr_bit_t *state, size_t state_length, size_t *taps, size_t tap_count)
{
  enum lfsr_bit_t result;
  unsigned int i = 0;
  for (result = state[taps[i++]-1]; i < tap_count; ++i)
    result = (result != state[taps[i]-1]) ? OFF : ON;
  return result;
}

// shift the register to the right by one bit, replacing the
// first bit with 'input'
enum lfsr_bit_t lfsr_shift(enum lfsr_bit_t *state, size_t state_length, enum lfsr_bit_t input)
{
  enum lfsr_bit_t msb = state[state_length-1]; // the most-significant bit will be returned, as it's destroyed after the shift
  // We ignore the first bit, because we have to write the input to it
  for( ; state_length > 1; --state_length) {
    // array indexes start at 0, but bit numbers start at 1
    state[state_length - 1] = state[state_length - 2];
  }
  // Write the input to the first bit
  state[0] = input;
  return msb;
}

unsigned long int lfsr_dump(enum lfsr_bit_t *state, size_t state_length)
{
  size_t i;
  unsigned long int result = 0;
  for (i = 0; i < state_length; ++i)
    result += (state[i] == ON) ? pow(2, i) : 0;
  return result;
}

void lfsr_load(enum lfsr_bit_t *state, size_t state_length, unsigned long int seed)
{
  long int i;
  for (i=state_length-1; i >= 0; --i) {
    unsigned long int power = pow(2, i);
    if (seed >= power) {
      state[i] = ON;
      seed -= power;
    } else {
      state[i] = OFF;
    }
  }
}
