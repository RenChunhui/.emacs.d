

(use-package flycheck
  :diminish flycheck-mode
  :hook ((css-mode scss-mode js-mode typescript-mode) . flycheck-mode))

(provide 'init-flycheck)
