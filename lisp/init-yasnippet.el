(use-package yasnippet
  :ensure t
  :diminish yas-minor-mode
  :hook ((emacs-lisp-mode . yas-minor-mode)
	 (js2-mode . yas-minor-mode)
	 (web-mode . yas-minor-mode)
	 (css-mode . yas-minor-mode)
	 (scss-mode . yas-minor-mode)
	 (tide-mode . yas-minor-mode)
	 (typescript-mode . yas-minor-mode))
  :diminish yas-minor-mode
  :init
  (setq yas-snippet-dirs '("~/.emacs.d/snippets"))
  :config
  (yas-reload-all)
  (global-set-key (kbd "M-/") 'company-yasnippet))

(provide 'init-yasnippet)