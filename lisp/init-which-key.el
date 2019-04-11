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
      "SPC a" "Application"
      "SPC b" "Buffer"
      "SPC d" "Dired"
      "SPC f" "File"
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
      "bj" 'ibuffer-forward-line
      "bm" 'ibuffer-mark-forward

      ;; Buffer Action
      "baA" 'ibuffer-do-view
      "baE" 'ibuffer-do-eval
      "baF" 'ibuffer-do-shell-command-file

      ;; Buffer Mark
      ;;"bmm" 'ibuffer-mark-modified-buffers
      ;;"bmu" 'ibuffer-mark-unsaved-buffers
      ;;"bms" 'ibuffer-mark-special-buffers
      ;;"bmr" 'ibuffer-mark-read-only-buffers
      ;;"bm/" 'ibuffer-mark-dired-buffers
      ;;"bme" 'ibuffer-mark-dissociated-buffers
      ;;"bmh" 'ibuffer-mark-help-buffers
      ;;"bmz" 'ibuffer-mark-compressed-file-buffers
      "bu" 'ibuffer-unmark-forward
      "bD" 'ibuffer-do-delete
      "bS" 'ibuffer-do-save
      "bg" 'ibuffer-update

      ;; Buffer Sort
      "bsi" 'ibuffer-invert-sorting
      "bsa" 'ibuffer-do-sort-by-alphabetic
      "bsv" 'ibuffer-do-sort-by-recency
      "bss" 'ibuffer-do-sort-by-size
      "bsf" 'ibuffer-do-sort-by-filename/process
      "bsm" 'ibuffer-do-sort-by-major-mode

      ;; Dired

      ;; File
      "ff" 'counsel-find-file
      "fel" 'counsel-find-library
      "fL" 'counsel-locate
      "fr" 'rename-this-file
      "fd" 'delete-this-file

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
      "tf" 'flycheck-mode
      
      ;; Window
      "wd" 'delete-window
      "wo" 'delete-other-windows
      "wh" 'windmove-left
      "wj" 'windmove-down
      "wk" 'windmove-up
      "wl" 'windmove-right
      "w|" 'split-window-right
      "w-" 'split-window-below)
    (which-key-mode)))

(provide 'init-which-key)

;;; init-which-key.el ends here
