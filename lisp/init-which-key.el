;;; init-which-key.el --- which-key
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

(use-package which-key
  :init
  (progn
    (which-key-add-key-based-replacements
      "SPC b" "Buffer"
      "SPC c" "Code"
      "SPC f" "Files"
      "SPC g" "Git"
      "SPC h" "Help"
      "SPC i" "Insert"
      "SPC o" "Org mode"
      "SPC p" "Project"
      "SPC r" "Recent"
      "SPC s" "Search"
      "SPC t" "Toggle"
      "SPC w" "Window"))
  :config
  (progn
    (setq which-key-sort-order #'which-key-prefix-then-key-order
	  which-key-sort-uppercase-first nil
	  which-key-add-column-padding 1
	  which-key-max-display-columns nil
	  which-key-min-display-lines 5)
    (evil-leader/set-key
      ;; Buffer
      "bk" 'kill-current-buffer
      "bb" 'ivy-switch-buffer

      ;; File
      "ff" 'counsel-find-file
      "fel" 'counsel-find-library
      "fL" 'counsel-locate

      ;; Git

      ;; Help
      "?" 'counsel-descbinds
      "hdf" 'counsel-describe-function
      "hdF" 'counsel-describe-face
      "hdv" 'counsel-describe-variable
      "hi" 'counsel-info-lookup-symbol

      ;; insert
      "iu" 'counsel-unicode-char

      ;; Org mode

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
      "pv" 'projectile-vc

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
      "tf" 'flycheck-mode
      
      ;; Window
      "w|" 'split-window-right
      "w-" 'split-window-below)
    (which-key-mode)))

(provide 'init-which-key)

;;; init-which-key.el ends here
