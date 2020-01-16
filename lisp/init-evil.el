;;; init-evil.el --- evil configuration -*- coding: utf-8; lexical-binding: t -*-
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;;; Code:

(use-package evil
  :defer .1
  :init
  (progn
    (setq evil-split-window-below t
	  evil-split-window-right t
	  evil-normal-state-tag (propertize "- NORMAL -" 'face '(:foreground "DarkGoldenrod2"))
	  evil-insert-state-tag (propertize "- INSERT -" 'face '(:foreground "chartreuse3"))
	  evil-visual-state-tag (propertize "- VISUAL -" 'face '(:foreground "gray"))
	  evil-emacs-state-tag (propertize "- EMACS -" 'face '(:foreground "SkyBlue2"))))
  :config
  (evil-mode 1))

(use-package evil-leader
  :after (evil)
  :config
  (progn
    (global-evil-leader-mode)
    (evil-leader/set-leader "<SPC>")
    (evil-leader/set-key
      ;; Buffer
      "bk" 'kill-current-buffer
      "bb" 'ivy-switch-buffer
      "bj" 'ibuffer-forward-line
      "bm" 'ibuffer-mark-forward

      ;; File
      "ff" 'counsel-find-file
      "fel" 'counsel-find-library
      "fL" 'counsel-locate
      "fr" 'rename-this-file
      "fd" 'delete-this-file

      ;; Help
      "?" 'counsel-descbinds
      "hdf" 'counsel-describe-function
      "hdF" 'counsel-describe-face
      "hdv" 'counsel-describe-variable
      "hi" 'counsel-info-lookup-symbol

      ;; insert
      "iu" 'counsel-unicode-char

      ;; Project
      "pb" 'projectile-switch-to-buffer
      "pc" 'projectile-compile-project
      "pd" 'projectile-find-dir
      "pe" 'projectile-edit-dir-locals
      "pf" 'projectile-find-file
      "pg" 'projectile-find-tag
      "pk" 'projectile-kill-buffers
      "pp" 'projectile-switch-project
      "pr" 'projectile-recentf
      "pR" 'projectile-replace
      "ps" 'projectile-switch-project
      "pv" 'projectile-vc
      "px" 'projectile-remove-known-project
      "pz" 'projectile-cache-current-file

      ;; register/ring
      "ry" 'counsel-yank-pop
      "rm" 'counsel-mark-ring

      ;; search
      "sgp" 'counsel-git-grep
      "ss" 'swiper
      "sb" 'swiper-all

      ;; Toggle
      "tl" 'linum-mode
      "tw" 'whitespace-mode
      "tf" 'flycheck-mode)))

(provide 'init-evil)

;;; init-evil.el ends here
