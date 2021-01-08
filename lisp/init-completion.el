(use-package company
  :hook ((emacs-lisp-mode
	  web-mode
	  css-mode
	  scss-mode
	  typescript-mode
	  rust-mode) . company-mode)
  :diminish company-mode
  :init
  (progn
    (setq company-idle-delay            0.2
	  company-show-numbers          nil
	  company-tooltip-limit         10
	  company-minimum-prefix-length 2)))

(use-package yasnippet
  :diminish yas-minor-mode
  :hook ((emacs-lisp-mode
	  js2-mode
	  web-mode
	  css-mode
	  scss-mode
	  typescript-mode) . yas-minor-mode)
  :diminish yas-minor-mode
  :init
  (setq yas-snippet-dirs '("~/.config/emacs/snippets"))
  :config
  (yas-reload-all)
  (global-set-key (kbd "M-/") 'company-yasnippet))

(provide 'init-completion)