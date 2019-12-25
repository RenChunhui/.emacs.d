(use-package flycheck
  :ensure t
  :diminish flycheck-mode
  :hook ((css-mode scss-mode js-mode typescript-mode) . flycheck-mode))

(provide 'init-flycheck)