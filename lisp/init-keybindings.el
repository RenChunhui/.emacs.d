;;; init-keybindings.el --- keybindings -*- coding: utf-8; lexical-binding: t -*-
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;;; Code:

(require 'evil-leader)

(progn
  ;; Select All
  (global-set-key (kbd "s-a") 'mark-whole-buffer)

  ;; Find
  (global-set-key (kbd "s-f") 'isearch-forward)

  ;; New
  (global-set-key (kbd "s-n") 'xah-new-empty-buffer)

  ;; Open
  (global-set-key (kbd "s-o") 'ido-find-file)

  ;; Save
  (global-set-key (kbd "s-s") 'save-buffer)

  ;; Paste
  (global-set-key (kbd "s-v") 'yank)

  ;; close buffer
  (global-set-key (kbd "s-w") 'kill-buffer)

  ;; redo
  (global-set-key (kbd "s-y") 'redo)

  ;; undo
  (global-set-key (kbd "s-z") 'undo))

(eval-after-load 'evil-leader
  '(progn
     (evil-leader/set-key
  ;; Buffer
  "bk" 'kill-current-buffer
  "bs" 'ivy-switch-buffer

  ;; File
  "ff" 'counsel-find-file
  "fl" 'counsel-locate

  ;; Help
  "hv" 'counsel-describe-variable
  "hf" 'counsel-describe-function

  ;; Project
  "pb" 'projectile-switch-to-buffer
  "pc" 'projectile-compile-project
  "pd" 'projectile-find-dir
  "pf" 'projectile-find-file
  "pr" 'projectile-recentf
  "pR" 'projectile-replace
  "ps" 'projectile-switch-project
  "pv" 'projectile-vc

  ;; Search
  "ss" 'swiper

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
  "w-" 'split-window-below)))

(provide 'init-keybindings)

;;; init-keybindings.el ends here
