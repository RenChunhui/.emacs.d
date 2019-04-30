;;; init-emacs.el --- Emacs initializtion configuration
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

;; prefer coding
(prefer-coding-system 'utf-8)

;; remove tool bar
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))

;; remove scroll bar
(when (fboundp 'set-scroll-bar-mode)
  (set-scroll-bar-mode nil))

;; remove tooltip
(when (fboundp 'tooltip-mode)
  (tooltip-mode -1))

;; remove menu bar
(when (fboundp 'menu-bar-mode)
  (menu-bar-mode -1))

(add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
(add-to-list 'default-frame-alist '(ns-appearance . dark))

;; y/n instead of yes/no
(fset 'yes-or-no-p 'y-or-n-p)

;; show line number
(global-linum-mode t)

;; auto insert closing brackket
(electric-pair-mode t)

;; turn on highlighting current line
(global-hl-line-mode t)

;; enable syntax highlighting
(global-font-lock-mode 1)

;; wrap long lines by word boundary, and arrow up/down move by visual line, etc
(global-visual-line-mode 1)

;; display current time in modeline
(display-time-mode t)

(global-visual-line-mode 1)

;; load theme
(load-theme 'dracula t)

;; fullscreen
(when (fboundp 'toggle-frame-fullscreen)
  (global-set-key (kbd "<s-return>") 'toggle-frame-fullscreen))

(setq user-full-name "Ren Chunhui"
      user-mail-address "renchunhui2008@gmail.com"

      fill-column 120
      word-wrap t
      
      ;; Splash Screen
      inhibit-splash-screen t
      inhibit-startup-message t
      inhibit-startup-echo-area-message user-login-name
      inhibit-default-init t
      initial-scratch-message nil
      initial-major-mode 'fundamental-mode

      ;; Custom file
      custom-file (concat tea-emacs-cache-directory "custom.el")

      ;; Indentation
      tab-width 2
      indent-tabs-mode nil

      ;; Error message
      visible-bell nil
      ring-bell-function 'ignore

      ;; Backup files
      make-backup-files nil
      backup-directory-alist (list (cons "." (concat tea-emacs-cache-directory "backup/")))

      ;; Fullscreen
      ns-use-native-fullscreen nil

      ;; number mode
      column-number-mode t

      ;; render
      inhibit-compacting-font-caches t
      ns-use-srgb-colorspace nil

      ;; Cache
      abbrev-file-name (concat tea-emacs-cache-directory "abbrev.el")
      auto-save-list-file-name (concat tea-emacs-cache-directory "autosave")
      server-auth-dir (concat tea-emacs-cache-directory "server/")
      url-cache-directory (concat tea-emacs-cache-directory "url/")
      url-configuration-directory (concat tea-emacs-cache-directory "url/"))

(provide 'init-emacs)

;;; init-emacs.el ends here
