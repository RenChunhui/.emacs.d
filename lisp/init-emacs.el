;;; init-emacs.el --- emacs configuration -*- coding: utf-8; lexical-binding: t -*-
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;;; Code:

(setq user-full-name "Chunhui Ren"
      user-mail-address "renchunhui2008@gmail.com")

(with-no-warnings
  (setq mac-option-modifier 'meta
	mac-command-modifier 'super)
  (bind-keys ([(super a)] . mark-whole-buffer)
	     ([(super c)] . kill-ring-save)
	     ([(super l)] . goto-line)
	     ([(super q)] . save-buffer-kill-emacs)
	     ([(super s)] . save-buffer)
	     ([(super v)] . yank)
	     ([(super w)] . delete-frame)
	     ([(super z)] . undo)))

(use-package server
  :ensure nil
  :hook (after-init . server-mode))

(use-package saveplace
  :ensure nil
  :hook (after-init . save-place-mode))

(use-package time
  :ensure nil
  :unless (display-graphic-p)
  :hook (after-init . display-time-mode)
  :init
  (progn
    (setq display-time-24hr-format t
	  display-time-day-and-date t)))

(use-package mule
  :ensure nil
  :config
  (progn
    (when (fboundp 'set-charset-priority)
      (set-charset-priority 'unicode))
    (prefer-coding-system 'utf-8)
    (set-terminal-coding-system 'utf-8)
    (set-keyboard-coding-system 'utf-8)
    (set-selection-coding-system 'utf-8)
    (setq locale-coding-system 'utf-8)
    (setq-default buffer-file-coding-system 'utf-8)))

(use-package scroll-bar
  :ensure nil
  :config (scroll-bar-mode -1))

(use-package linum
  :hook ((prog-mode
	  text-mode
	  emacs-lisp-mode
	  js2-mode
	  tide-mode
	  typescript-mode
	  web-mode
	  css-mode
	  scss-mode) . linum-mode))

(use-package emacs
  :ensure nil
  :custom
  (fset 'yes-or-no-p 'y-or-n-p)
  (electric-pair-mode t)
  (global-hl-line-mode t)
  (global-font-lock-mode 1)
  (global-visual-line-mode 1)
  
  :config
  (progn
    ;; Default font
    (set-face-attribute 'default nil :font "SF Mono-13")
    (set-fontset-font t 'han      (font-spec :family "STkaiti" :size 16))
    (set-fontset-font t 'cjk-misc (font-spec :family "STkaiti" :size 16))

    (setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
    (setq exec-path (append exec-path '("/usr/local/bin")))
    (setq visible-bell nil
	  ring-bell-function 'ignore

	  ;; splash
	  initial-scratch-message nil
	  initial-major-mode 'fundamental-mode
	  inhibit-splash-screen t
	  inhibit-startup-message t
	  inhibit-default-init t
	  
	  ;; Backup files
	  make-backup-files nil
	  backup-directory-alist (list (cons "." (concat emacs-cache-directory "backup/")))
	  ;; Fullscreen
	  ns-use-native-fullscreen nil
	  
	  ;; number mode
	  column-number-mode t
	  
	  ;; render
	  inhibit-compacting-font-caches t
	  ns-use-srgb-colorspace nil
	  
	  ;; Cache
	  recentf-save-file (concat emacs-cache-directory "recentf")
	  abbrev-file-name (concat emacs-cache-directory "abbrev.el")
	  auto-save-list-file-name (concat emacs-cache-directory "autosave"))))

(use-package recentf
  :ensure nil
  :hook (after-init . recentf-mode)
  :init
  (setq recentf-max-saved-items 10)
  (setq recentf-exclude '((expand-file-name package-user-dir)
                          ".cache"
                          ".cask"
                          ".elfeed"
                          "bookmarks"
                          "cache"
                          "ido.*"
                          "persp-confs"
                          "recentf"
                          "undo-tree-hist"
                          "url"
                          "COMMIT_EDITMSG\\'")))

(use-package eldoc
  :ensure nil
  :diminish eldoc-mode)

(use-package simple
  :ensure nil
  :diminish visual-line-mode
  :hook ((window-setup . size-indication-mode)
	 ((prog-mode markdown-mode conf-mode) . enable-trailing-whitespace)))

(use-package dired
  :ensure nil
  :hook (dired-mode . (lambda ()
			(setq dired-omit-mode t)))
  :init
  (progn
    (setq dired-omit-files "\\.git$\\|\\.DS_Store$")))

(provide 'init-emacs)

;;; init-emacs.el ends here
