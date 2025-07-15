PREFIX ?= /usr/
BINDIR = $(PREFIX)/bin
SCRIPT = gen_manifest


# Install target
install:
	@cp $(SCRIPT) $(BINDIR)/$(SCRIPT)
	@chmod +x $(BINDIR)/$(SCRIPT)