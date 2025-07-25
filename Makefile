PREFIX ?= /usr/
BINDIR = $(PREFIX)/bin
SCRIPT = gen_manifest


# Install target
install:
        apt update
	apt-get install -y zstd jq
	@cp $(SCRIPT) $(BINDIR)/$(SCRIPT)
	@chmod +x $(BINDIR)/$(SCRIPT)