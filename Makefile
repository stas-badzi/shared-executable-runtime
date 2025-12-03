ifeq ($(C_COMPILER),)
C_COMPILER=cc
endif
ifeq ($(LDSO),)
LDSO=$(shell CFLAGS="$(C_FLAGS)" ./getldso.sh "$(C_COMPILER)")
ifeq ($(LDSO),)
$(error ./getldso.sh failed)
endif
endif
crt.o:
	sed "s/\$${LD_SO}/$$(echo "$(LDSO)" | sed "s/\//\\\\\//g")/g" crt.c | $(C_COMPILER) -x c - -c -s -o $@ $(C_FLAGS)
	-strip -s $@

clean:
	@-rm tmp.c
	@-rm tmp.out
	@-rm crt.o
