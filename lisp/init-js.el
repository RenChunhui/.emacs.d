(use-package js2-mode
  :ensure t
  :mode ("\\.js\\'" . js2-mode)
  )

(use-package tern
  :ensure t)

(use-package company-tern
  :ensure t)

(provide 'init-js)
