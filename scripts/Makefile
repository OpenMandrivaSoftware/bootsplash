PL=remove-boot-splash
SH=make-boot-splash make-boot-splash-raw switch-themes remove-theme
SYS=bootsplash.sysconfig

sharedir=/usr/share
etcsysdir=/etc/sysconfig

all: check

check:
	@for i in $(SH);do /bin/bash -n $$i || exit 1;echo $$i syntax OK;done
	@for i in $(PL);do perl -c $$i ||exit 1;done

install:
	@mkdir -p $(prefix)$(sharedir)/bootsplash/scripts/ $(prefix)$(etcsysdir)
	@for i in $(SH) $(PL);do install -m755 $$i $(prefix)$(sharedir)/bootsplash/scripts/;done
	install -m644 $(SYS) $(prefix)$(etcsysdir)/bootsplash

clean:
	rm -f *~ \#*\#
