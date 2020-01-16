.PHONY: clean install

clean:
	rm -f *~
	rm -f \#*\#
	rm -f *.elc
	rm -rf .cache

# Install
# 参考: https://www.gnu.org/software/emacs/manual/html_node/emacs/Initial-Options.html
install:
	@emacs -batch -l bin/package.el