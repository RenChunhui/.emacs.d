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

(use-package yasnippet
  :ensure t
  :init
  (yas-global-mode 1))

(use-package helm
  :ensure t
  :bind (("M-a" . helm-M-x)
	 ("C-x C-f" . helm-find-files)
	 ("C-x b" . helm-buffers-list))
  :config (progn
	    (helm-mode 1)))

(use-package helm-projectile
  :ensure t
  :bind
  ("M-t" . helm-projectile-find-file)
  :config
  (helm-projectile-on))

(provide 'core-completion)

;;; core-completion.el ends here
