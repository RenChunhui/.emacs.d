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

(provide 'core-editor)