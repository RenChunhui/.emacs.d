
(use-package ivy
  :ensure t
  :hook (emacs-startup . ivy-mode)
  :config
  (progn
    (setq ivy-height 12
	  ivy-wrap t
	  ivy-use-virtual-buffers t
	  ivy-fixed-height-minibuffer t)
    (setq-default projectile-completion-system 'ivy)))

(use-package counsel
  :ensure t
  :defer .1
  :bind (("M-x" . counsel-M-x)))

(use-package counsel-projectile
  :ensure t
  :defer .1)

(use-package swiper
  :ensure t
  :defer .1)

(provide 'init-ivy)
