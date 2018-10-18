NAME = ts-template-creator
REPO = ~/.$(NAME)
BIN = /usr/local/bin

install: src/main.sh src/template.sh src/input.sh
	cp -r . $(REPO)
	ln -s $(REPO)/$< $(BIN)/$(NAME)

uninstall:
	-rm $(BIN)/$(NAME)
	-rm -rf $(REPO)
