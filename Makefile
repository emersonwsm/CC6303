
all: cc68 as68 copt frontend libc

.PHONY: cc68 as68 frontend libc

cc68:
	+(cd common; make)
	+(cd cc68; make)

as68:
	+(cd as68; make)

libc:
	+(cd libc; make)
	+(cd lib6800; make)
	+(cd lib6803; make)
	+(cd lib6303; make)
	ar rc lib6800.a lib6800/*.o
	ar rc lib6803.a lib6803/*.o lib6800/*.o
	ar rc lib6303.a lib6303/*.o lib6803/*.o lib6800/*.o

copt: copt.c

frontend:
	+(cd frontend; make)

clean:
	(cd common; make clean)
	(cd cc68; make clean)
	(cd as68; make clean)
	(cd frontend; make clean)
	(cd libc; make clean)
	(cd lib6800; make clean)
	(cd lib6803; make clean)
	(cd lib6303; make clean)
	rm copt lib6800.a lib6803.a lib6303.a

#
#	This aspect needs work
#
install:
	mkdir -p /opt/cc68/bin
	mkdir -p /opt/cc68/lib
	cp cc68/cc68 /opt/cc68/lib
	cp as68/as68 /opt/cc68/bin
	cp as68/ld68 /opt/cc68/bin
	cp as68/nm68 /opt/cc68/bin
	cp as68/osize68 /opt/cc68/bin
	cp as68/dumprelocs68 /opt/cc68/bin
	cp copt /opt/cc68/lib
	cp frontend/cc68 /opt/cc68/bin/
	cp cc68.rules /opt/cc68/lib
	cp libc/crt0.o /opt/cc68/lib
	cp libc/libc.a /opt/cc68/lib
	cp lib6800.a /opt/cc68/lib
	cp lib6803.a /opt/cc68/lib
	cp lib6303.a /opt/cc68/lib
