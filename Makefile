main.out: main-v12-4-randDFS-verify.cpp Makefile
	g++ $< -std=c++14 -O3 -o $@

clean:
	rm -f main.out
