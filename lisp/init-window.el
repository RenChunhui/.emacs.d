(use-package winum
  :config
  (progn
    (setq winum-auto-assign-0-to-minibuffer nil
	    winum-auto-setup-mode-line nil
	    winum-ignored-buffers '(" *which-key*"))
    (evil-leader/set-key
      "1" 'select-window-1
      "2" 'select-window-2
      "3" 'select-window-3
      "4" 'select-window-4
      "5" 'select-window-5)
    (define-key winum-keymap (kbd "M-1") 'winum-select-window-1)
    (define-key winum-keymap (kbd "M-2") 'winum-select-window-2)
    (define-key winum-keymap (kbd "M-3") 'winum-select-window-3)
    (define-key winum-keymap (kbd "M-4") 'winum-select-window-4)
    (define-key winum-keymap (kbd "M-5") 'winum-select-window-5)
    (winum-mode)))

(use-package neotree
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

(use-package diminish
  :after (editorconfig company)
  :diminish company-mode
  :diminish counsel-mode
  :diminish evil-org-mode
  :diminish editorconfig-mode
  :diminish eldoc-mode
  :diminish flycheck-mode
  :diminish ivy-mode
  :diminish projectile-mode
  :diminish undo-tree-mode
  :diminish which-key-mode
  :diminish yas-minor-mode)

(provide 'init-window)
