CC      = gcc
CFLAGS  = -Wall -Wextra -O2
TARGET  = main
RUNNER  = runner.sh

.PHONY: build clean test

build:
	$(CC) $(CFLAGS) main.c -o $(TARGET)

clean:
	rm -f $(TARGET)

# Run all tests
test: build
	bash $(RUNNER)

# Run individual test: test1, test2, ...
test%: build
	bash $(RUNNER) $*
