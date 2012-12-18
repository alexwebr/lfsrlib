/** @file */
#ifndef LFSR_H_INCLUDED
#define LFSR_H_INCLUDED

// Maximal LSFR feedback polynomials taken from from
// https://en.wikipedia.org/wiki/Linear_feedback_shift_register
#define LFSR_MAXIMAL3   {3, 2}
#define LFSR_MAXIMAL4   {4, 3}
#define LFSR_MAXIMAL5   {5, 3}
#define LFSR_MAXIMAL6   {6, 5}
#define LFSR_MAXIMAL7   {7, 6}
#define LFSR_MAXIMAL8   {8, 6, 5, 4}
#define LFSR_MAXIMAL9   {9, 5}
#define LFSR_MAXIMAL10  {10, 7}
#define LFSR_MAXIMAL11  {11, 9}
#define LFSR_MAXIMAL12  {12, 11, 10, 4}
#define LFSR_MAXIMAL13  {13, 12, 11, 8}
#define LFSR_MAXIMAL14  {14, 13, 12, 2}
#define LFSR_MAXIMAL15  {15, 14}
#define LFSR_MAXIMAL16  {16, 14, 13, 11}
#define LFSR_MAXIMAL17  {17, 14}
#define LFSR_MAXIMAL18  {18, 11}
#define LFSR_MAXIMAL19  {19, 18, 17, 14}


/**
 * An LFSR's internal state is composed of an array of these enums.
 * The number of states the LFSR can be in is equal to 2^n-1. If the LFSR is maximal-length, the period is the same.
 */
enum lfsr_bit_t {ON, OFF};


/** Performs XOR on the taps of an LFSR.
 * Does not modify *state*.
 * @param state an LFSR state
 * @param state_length the number of bits in the LFSR state
 * @param taps an array listing the taps to operate on
 * @param tap_count the number of taps in *taps*
 * @return The resulting bit of the XOR operations
 */
enum lfsr_bit_t lfsr_xor_taps(enum lfsr_bit_t *state, size_t state_length, size_t *taps, size_t tap_count);


/** Performs XNOR on the taps of an LFSR.
 * Does not modify *state*.
 * @param state an LFSR state
 * @param state_length the number of bits in the LFSR state
 * @param taps an array listing the taps to operate on
 * @param tap_count the number of taps in *taps*
 * @return The resulting bit of the XNOR operations
 */
enum lfsr_bit_t lfsr_xnor_taps(enum lfsr_bit_t *state, size_t state_length, size_t *taps, size_t tap_count);


/** Shifts the LFSR one bit to the right (towards the most-significant bit).
 * @param state an LFSR state
 * @param state_length the number of bits in the LFSR state
 * @param input the bit to insert as the least-significant bit after the shift operation
 * @return The most-significant bit prior to the shift (it is lost after the shift)
 */
enum lfsr_bit_t lfsr_shift (enum lfsr_bit_t *state, size_t state_length, enum lfsr_bit_t input);


/** Converts the internal state of the LFSR to an unsigned long integer.
 * Does not modify *state*.
 * @param state an LFSR state
 * @param state_length the number of bits in the LFSR state
 * @return the internal value of the LFSR
 */
unsigned long int lfsr_dump (enum lfsr_bit_t *state, size_t state_length);


/** Seeds the internal state of the LFSR.
 * @param state an LFSR state
 * @param state_length the number of bits in the LFSR state
 * @param seed the value to seed the LFSR's internal state with
 */
void lfsr_load (enum lfsr_bit_t *state, size_t state_length, unsigned long int seed);

#endif
