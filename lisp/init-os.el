;;; init-os.el --- os configuration -*- coding: utf-8; lexical-binding: t -*-
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;;; Code:

;; UTF-8
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

(setq mac-option-modifier 'meta
      mac-command-modifier 'super)

(global-set-key (kbd "s-<return>") 'toggle-frame-fullscreen)

;; 禁用滚动条
(when (fboundp 'set-scroll-bar-mode)
  (set-scroll-bar-mode nil))

(setq inhibit-startup-screen t)

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

(set-face-attribute 'default nil :font "SF Mono-13")

(setq user-full-name "Chunhui Ren"
      user-mail-address "renchunhui2008@gmail.com")

(setq inhibit-splash-screen t
      inhibit-startup-message t
      inhibit-startup-echo-area-message user-login-name
      inhibit-default-init t)

(setq initial-major-mode 'fundamental-mode
      initial-scratch-message nil)

(setq make-backup-files nil
      backup-directory-alist (list (cons "." (concat emacs-cache-directory "backup/"))))

;; render
(setq inhibit-compacting-font-caches t)

(provide 'init-os)

;;; init-os.el ends here
