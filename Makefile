LDFLAGS=-lm
CFLAGS=-Werror -O3

default:
	@echo "make bin           makes 3-bit, 4-bit ... 19-bit maximal LFSR binaries"
	@echo "make test          makes all binaries (as in make bin) and runs unit and functional tests"
	@echo "make unit-test     makes library, runs unit tests"
	@echo "make devclean      restores this directory to a clean state"
	@echo

bin: lfsr.o
	for bits in 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 ; \
	do \
		./generate_main.sh $$bits ; \
		${CC} ${LDFLAGS} lfsr.o $${bits}bit.c -o $${bits}bit ; \
	done

test: unit-test bin maximal-test

unit-test: tests.o lfsr.o
	strip -N main lfsr.o
	${CC} lfsr.o tests.o -o test_runner -lm
	./test_runner
	rm ./test_runner

maximal-test: bin
	./maximal_test.sh

clean:
	rm -f *.o

devclean: clean
	rm -f *bit
	rm -f *bit.c
	rm -f temporary_file*
	rm -f test_runner

