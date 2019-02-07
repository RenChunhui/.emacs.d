# Install
# 参考: https://www.gnu.org/software/emacs/manual/html_node/emacs/Initial-Options.html
install:
	@emacs -batch -l bin/packages.el

.PHONY: install