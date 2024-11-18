# SPDX-License-Identifier: MPL-2.0

PREFIX ?= /usr

linkdownsleep@.service: linkdownsleep@.service.in
	sed "s+@PREFIX@+$(PREFIX)+g" linkdownsleep@.service.in > linkdownsleep@.service

install: linkdownsleep linkdownsleep.sysusers linkdownsleep.udev linkdownsleep.polkit linkdownsleep@.service
	install -Dm755 linkdownsleep $(DESTDIR)/$(PREFIX)/bin/linkdownsleep
	install -Dm644 linkdownsleep@.service $(DESTDIR)/$(PREFIX)/lib/systemd/system/linkdownsleep@.service
	install -Dm644 linkdownsleep.sysusers $(DESTDIR)/$(PREFIX)/lib/sysusers.d/linkdownsleep.conf
	install -Dm644 linkdownsleep.udev $(DESTDIR)/$(PREFIX)/lib/udev/rules.d/linkdownsleep.rules
	install -Dm644 linkdownsleep.polkit $(DESTDIR)/$(PREFIX)/share/polkit-1/rules.d/linkdownsleep.rules
