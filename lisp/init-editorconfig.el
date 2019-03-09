(use-package editorconfig
  :hook ((emacs-lisp-mode . editorconfig-mode)
	 (lisp-mode . editorconfig-mode)
	 (css-mode . editorconfig-mode)
	 (scss-mode . editorconfig-mode)
	 (typescript-mode . editorconfig-mode)
	 (tide-mode . editorconfig-mode)
	 (js2-mode . editorconfig-mode))
  :diminish editorconfig-mode)

(provide 'init-editorconfig)
