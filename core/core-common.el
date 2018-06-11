(use-package company
    :ensure t
    :config
    (global-company-mode)
    (setq company-idle-delay 0.1)
    (setq company-tooltip-limit 10)
    (setq company-minimum-prefix-length 2))

(use-package which-key
  :ensure t
  :config
  (which-key-mode))

(use-package counsel
  :ensure t
  )

(use-package swiper
  :ensure t
  :bind (("M-x" . counsel-M-x)
	 ("C-x C-f" . counsel-find-file))
  :init
  (setq ivy-use-virtual-buffers t)
  :config
  (ivy-mode 1))

(use-package yasnippet
  :ensure t
  :init
  (yas-global-mode 1))

;; 括号自动补全
(electric-pair-mode t)

(provide 'core-common)
