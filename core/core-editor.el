(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode t))

(use-package editorconfig
  :ensure t
  :config
  (editorconfig-mode 1))

(use-package magit
  :ensure t
  :bind (("C-c m" . magit-status)))

(use-package projectile
  :ensure t
  :config
  (projectile-mode)
  (setq projectile-completion-system 'helm))

(use-package winum
  :ensure t
  :config
  (setq winum-auto-setup-mode-line nil)
  (winum-mode))

(provide 'core-editor)

;;; core-editor.el ends here
