CC=gcc
FLAGS= -Wall -g

all:main

main: main.o libtrie.so
	$(CC) $(FLAGS) -o main main.o ./libnode.so ./libtrie.so

libtrie.so: trie.o libnode.so
	$(CC) -shared -o libtrie.so trie.o ./libnode.so

libnode.so: node.o
	$(CC) -shared -o libnode.so node.o 

main.o: main.c node.h trie.h
	$(CC) $(FLAGS) -c main.c

trie.o: trie.c trie.h
	$(CC) -fPIC $(FLAGS) -c trie.c

node.o: node.c node.h
	$(CC) -fPIC $(FLAGS) -c node.c

.PHONY:all clean

clean:
	rm -f *.o *.so main