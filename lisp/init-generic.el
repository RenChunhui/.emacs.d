;;; init-generic.el --- generic configuration -*- coding: utf-8; lexical-binding: t -*-
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;;; Code:

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

(use-package tool-bar
  :ensure nil
  :config (tool-bar-mode -1))

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
  (cursor-type 'bar)
  (fset 'yes-or-no-p 'y-or-n-p)
  (electric-pair-mode t)
  (global-hl-line-mode t)
  (global-font-lock-mode 1)
  (global-visual-line-mode 1)
  
  :config
  (progn
    (add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
    (add-to-list 'default-frame-alist '(ns-appearance . dark))
    (set-face-attribute 'default nil :font "SF Mono-13")
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

;; history
(use-package recentf
  :ensure nil
  :hook (after-init . recentf-mode)
  :init
  (setq recentf-max-saved-items 200)
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

(provide 'init-generic)

;;; init-generic.el ends here
