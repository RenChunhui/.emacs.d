(use-package company
  :ensure t
  :bind(("<C-tab>" . company-auto-complete)
	("C-/" . helm-complete))
  :config
  (global-company-mode)
  (setq company-idle-delay 0.1)
  (setq company-tooltip-limit 10)
  (setq company-minimum-prefix-length 2))

(use-package which-key
  :ensure t
  :config
  (which-key-mode))

(provide 'init-completion)