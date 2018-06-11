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
  :ensure try
  :config
  (progn
    (ivy-mode 1)
    (setq ivy-use-virtual-buffers t)
    (global-set-key "\C-s" 'swiper)
    (global-set-key (kbd "M-x") 'counsel-M-x)
    (global-set-key (kbd "C-x C-f") 'counsel-find-file)
    (define-key read-expression-map (kbd "C-r") 'counsel-expression-history)
    ))

;; 括号自动补全
(electric-pair-mode t)

(provide 'core-common)
