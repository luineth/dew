VIMDIR = $(HOME)/.vim

.PHONY: install

install:
	mkdir -p $(VIMDIR)/ftdetect
	mkdir -p $(VIMDIR)/syntax
	ln -sf $(CURDIR)/ftdetect_dew.vim $(VIMDIR)/ftdetect/dew.vim
	ln -sf $(CURDIR)/syntax_dew.vim $(VIMDIR)/syntax/dew.vim

.PHONY: clean

clean:
	rm $(VIMDIR)/ftdetect/dew.vim
	rm $(VIMDIR)/syntax/dew.vim