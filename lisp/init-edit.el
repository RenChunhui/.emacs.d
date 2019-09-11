(use-package editorconfig
  :ensure t
  :diminish editorconfig-mode
  :config
  (editorconfig-mode 1))

(use-package flycheck
  :ensure t
  :diminish flycheck-mode
  :hook ((css-mode scss-mode js-mode typescript-mode) . flycheck-mode))

(use-package which-key
  :ensure t
  :hook (after-init . which-key-mode))

(provide 'init-edit)
