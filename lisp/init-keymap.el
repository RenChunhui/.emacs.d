;;; init-keymap.el --- keymap configuration
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
  ;; Buffer config
  (defun buffer-config ()
    (evil-leader/set-key
      "bk" 'kill-current-buffer
      "bb" 'ivy-switch-buffer
      "bj" 'ibuffer-forward-line
      "bm" 'ibuffer-mark-forward))

  ;; File config
  (defun file-config ()
    (evil-leader/set-key
      "ff" 'counsel-find-file
      "fel" 'counsel-find-library
      "fL" 'counsel-locate))

  ;; help
  (defun help-config ()
    (evil-leader/set-key
      "hdf" 'counsel-describe-function
      "hdF" 'counsel-describe-face
      "hdv" 'counsel-describe-variable
      "hi" 'counsel-info-lookup-symbol))

  ;; project
  (defun projectile-config ()
    (evil-leader/set-key
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
      "pz" 'projectile-cache-current-file))

  ;; search
  (defun search-config ()
    (evil-leader/set-key
       "sgp" 'counsel-git-grep
       "ss" 'swiper
       "sb" 'swiper-all))

  ;; Toggle
  (defun toggle-config ()
    "tl" 'linum-mode
    "tw" 'whitespace-mode
    "tf" 'flycheck-mode)

  ;; Window config
  (defun window-config ()
    "wd" 'delete-window
    "wo" 'delete-other-windows
    "wh" 'windmove-left
    "wj" 'windmove-down
    "wk" 'windmove-up
    "wl" 'windmove-right
    "w|" 'split-window-right
    "w-" 'split-window-below)
  (progn
    (which-key-add-key-based-replacements
     "SPC a" "Application"
     "SPC b" "Buffer"
     "SPC c" "Comments"
     "SPC d" "Dired"
     "SPC e" "Error"
     "SPC f" "File"
     "SPC g" "Git"
     "SPC h" "Help"
     "SPC i" "Insert"
     "SPC j" "Jump"
     "SPC o" "Org mode"
     "SPC r" "Recent"
     "SPC s" "Search"
     "SPC t" "Toggle"
     "SPC w" "Window"))
  :config
  (progn
    (buffer-config)
    (file-config)
    (help-config)
    (projectile-config)
    (search-config)
    (toggle-config)
    (window-config)
    (which-key-mode)))


(provide 'init-keymap)

;;; init-keymap.el ends here
