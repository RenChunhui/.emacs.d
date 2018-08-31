(use-package counsel
  :ensure t)

(use-package counsel-projectile
  :ensure t
  :bind
  ("s-p" . 'counsel-projectile-find-file))

(use-package swiper
  :ensure t
  :bind
  ("s-f" . 'swiper)
  ("M-x" . 'counsel-M-x)
  ("C-x C-f" . 'counsel-find-file)
  :config
  (ivy-mode 1))
  
(provide 'init-ivy)

;;; init-ivy.el ends here
