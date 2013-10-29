NAME=bootsplash
VERSION := 3.4.0

SUBDIRS=scripts
FILES=$(SUBDIRS) Makefile ChangeLog README

prefix=/
sharedir=/usr/share
configdir=/etc
RPM=$(HOME)/rpm

SVNSOFT=svn+ssh://svn.mandriva.com/svn/soft/bootsplash/
SVNNAME=svn+ssh://svn.mandriva.com/svn/packages/cooker/bootsplash/current/

all: 
	@for i in $(SUBDIRS);do	make -C $$i all || exit 1 ;done

install:
	@for i in $(SUBDIRS);do	make -C $$i install || exit 1 ;done

dis: dist
dist: clean
dist:
	rm -rf ../$(NAME)-$(VERSION).tar*
	@if [ -e ".svn" ]; then \
		$(MAKE) dist-svn; \
	elif [ -e ".git" ]; then \
		$(MAKE) dist-git; \
	else \
		echo "Unknown SCM (not SVN nor GIT)";\
		exit 1; \
	fi;
	$(info $(NAME)-$(VERSION).tar.bz2 is ready)

dist-svn:
	rm -rf $(NAME)-$(VERSION)
	svn export -q -rBASE . $(NAME)-$(VERSION)
	tar jcf ../$(NAME)-$(VERSION).tar.bz2 $(NAME)-$(VERSION)
	rm -rf $(NAME)-$(VERSION)

dist-git:
	@git archive --prefix=$(NAME)-$(VERSION)/ HEAD | bzip2 >../$(NAME)-$(VERSION).tar.bz2;

clean:
	@for i in $(SUBDIRS);do	make -C $$i clean;done
	rm -f *~ \#*\#
