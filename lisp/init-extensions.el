;;; init-base.el --- base packages
;;
;; Copyright (c) 2018 Chunhui Ren
;;
;; Author  : Chunhui Ren <renchunhui2008@gmail.com>
;; URL     : https://github.com/RenChunhui/.emacs.d
;; Version : 1.0.0
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;;; Code:

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

(use-package projectile
  :ensure t
  :init
  (progn
    (evil-leader/set-key
      "pb" 'projectile-switch-to-buffer
      "pd" 'projectile-find-dir
      "pf" 'projectile-find-file
      "pr" 'projectile-recentf
      "pp" 'projectile-switch-project
      "pv" 'projectile-vc

      "p!" 'projectile-run-shell-command-in-root
      "p&" 'projectile-run-async-shell-command-in-root
      "p%" 'projectile-replace-regexp
      "pD" 'projectile-dired
      "pk" 'projectile-kill-buffers
      "pR" 'projectile-replace))
  :config
  (projectile-mode)
  (setq projectile-completion-system 'ivy))

(use-package winum
  :ensure t
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

(use-package flycheck
  :ensure t
  :defer t
  :init
  (progn
    (setq flycheck-standard-error-navigation nil
	  flycheck-global-modes nil)
    (global-flycheck-mode 1)))

(use-package magit
  :ensure t
  :defer t
  :config
  (global-auto-revert-mode -1))

(use-package editorconfig
  :ensure t
  :config
  (editorconfig-mode))

(use-package osx-dictionary
  :ensure t
  :defer t
  :init
  (global-set-key (kbd "C-c d") 'osx-dictionary-search-word-at-point))
  ;; :config
  ;; (progn
  ;;   (evil-leader/set-key
  ;;     "q" 'osx-dictionary-quit
  ;;     "r" 'osx-dictionary-read-word
  ;;     "s" 'osx-dictionary-search-input
  ;;     "o" 'osx-dictionary-open-dictionary.app)))
  
(provide 'init-extensions)

;;; init-extensions.el ends here
