

(use-package neotree
  :ensure t
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
    (setq neo-default-system-application "open")
    (setq neo-theme 'icons)
    (evil-leader/set-key
      "ft" 'neotree-toggle
      "fT" 'neotree-show
      "pt" 'neotree-find-project-root)))

(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode t)
  (add-hook 'after-init-hook #'global-flycheck-mode))

(use-package yasnippet
  :ensure t
  :init
  (setq yas-snippet-dirs
	'("~/.emacs.d/private/snippets"))
  (yas-global-mode 1)
  :config
  (yas-reload-all)
  (global-set-key (kbd "M-/") 'company-yasnippet))

(use-package magit
  :ensure t)

(use-package editorconfig
  :ensure t
  :config
  (editorconfig-mode))

(provide 'init-after)