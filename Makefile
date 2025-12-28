build:
	gcc main.c -o main

clean:
	rm main

test-all:
	bash test.sh

test1:
	bash test1.sh

test2:
	bash test2.sh

test3:
	bash test3.sh