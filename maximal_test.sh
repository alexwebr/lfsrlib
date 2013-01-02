#!/bin/sh

assert_eq() {
  if [ $2 -eq $3 ]; then
    echo -n "$1 [32mpass[0m"
  else
    echo -n "$1 [31mfail[0m"
  fi
}

for i in 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19; do
  # We do three tests here:
  # 1. All 2^n-1 values are produced (coverage)
  # 2. All values occur equally frequently (bias)
  # 3. Values repeat repeatedly at the end of the predicted frequency (distribution)
  period=$(echo "2 ^ $i - 1" | bc)
  sample_size=$(echo "$period * 3" | bc)
  echo -n "TEST: $i-bit maximal LFSR with $sample_size samples... "
  "./${i}bit" | head -n "$sample_size">temporary_file
  <temporary_file sort>temporary_file_sorted
  assert_eq coverage $(<temporary_file_sorted uniq | wc -l | tr -d " ") $period
  echo -n ', '
  assert_eq bias $(<temporary_file_sorted uniq -c | sort -nu | wc -l | tr -d " ") 1
  echo -n ', '
  assert_eq distribution $(head -n $((period+1)) <temporary_file | tail -n 1) $(head -n 1 <temporary_file)
  echo
done

rm temporary_file
rm temporary_file_sorted
