# $Id: makefile,v 1.7 2008/04/15 13:27:49 stoecker Exp $
# probably works not with all compilers. Thought this should be easy
# fixable. There is nothing special at this source.
CC   = /home/gexueyuan/bin/gcc-4.6.2-glibc-2.13-linaro-multilib-2011.12/fsl-linaro-toolchain/bin/arm-fsl-linux-gnueabi-gcc
ifdef windir 
OPTS = -Wall -W -O3 -DWINDOWSVERSION 
LIBS = -lwsock32
else
OPTS = -Wall -W -O3 
endif

ntripclient: ntripclient.c serial.c
	$(CC) $(OPTS) ntripclient.c -o $@ $(LIBS)
	cp ntripclient /home/gexueyuan/tftp

clean:
	$(RM) ntripclient core*


archive:
	tar -czf ntripclient.tgz ntripclient.c makefile README startntripclient.sh

