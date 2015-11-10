SH=make-boot-splash make-boot-splash-raw switch-themes remove-theme remove-boot-splash
SYS=bootsplash.sysconfig

sharedir=/usr/share
etcsysdir=/etc/sysconfig

all: check

check:
	@for i in $(SH);do /bin/bash -n $$i || exit 1;echo $$i syntax OK;done

install:
	@mkdir -p $(prefix)$(sharedir)/bootsplash/scripts/ $(prefix)$(etcsysdir)
	@for i in $(SH);do install -m755 $$i $(prefix)$(sharedir)/bootsplash/scripts/;done
	install -m644 $(SYS) $(prefix)$(etcsysdir)/bootsplash

clean:
	rm -f *~ \#*\#
