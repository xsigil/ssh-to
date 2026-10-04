PREFIX ?= $(HOME)/.local
BINDIR = $(PREFIX)/bin
MANDIR = $(PREFIX)/share/man/man1
DATADIR = $(PREFIX)/share/ssh-to/machines

BIN = bin/ssh-to
MAN = doc/ssh-to.1

.PHONY: all install uninstall test

all:
	@echo "Run 'make install' to install ssh-to."

install:
	@mkdir -p $(BINDIR) $(MANDIR) $(DATADIR)
	install -m 755 $(BIN) $(BINDIR)/ssh-to
	install -m 644 $(MAN) $(MANDIR)/ssh-to.1

uninstall:
	rm -f $(BINDIR)/ssh-to
	rm -f $(MANDIR)/ssh-to.1
	rm -rf $(PREFIX)/share/ssh-to

test:
	@echo "==> Running syntax and functional test..."
	bash -n $(BIN)
	./$(BIN) --help > /dev/null
	./$(BIN) path | grep -q "ssh-to/machines"
	@echo "[✓] Pass"
