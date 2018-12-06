(use-package winum
  :ensure t
  :config
  (winum-mode))

(use-package neotree
  :ensure t
  :defer t
  :init
  (progn
    (setq-default neo-window-width 32
		  neo-create-file-auto-open t
		  neo-banner-message "Press ? for neotree help"
		  neo-show-updir-line nil
		  neo-mode-line-type 'neotree
		  neo-smart-open t
		  neo-show-hidden-files t
		  neo-auto-indent-point t
		  neo-modern-sidebar t
		  neo-vc-integration nil)
    (evil-leader/set-key
      "ft" 'neotree-toggle
      "fT" 'neotree-show
      "pt" 'neotree-find-project-root)))

(use-package powerline
  :ensure t
  :init
  (progn
    (setq ns-use-srgb-colorspace nil)
    (setq powerline-default-separator 'slant)
    (powerline-default-theme)))

(provide 'init-window)
