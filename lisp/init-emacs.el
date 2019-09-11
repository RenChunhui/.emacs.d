;;; init-emacs.el --- emacs configuration -*- coding: utf-8; lexical-binding: t -*-
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;;; Code:

(when (fboundp 'set-scroll-bar-mode)
  (set-scroll-bar-mode nil))

(use-package emacs
  :ensure nil
  :custom
  (electric-pair-mode t)
  (global-hl-line-mode t)
  (global-font-lock-mode 1)
  (global-visual-line-mode 1)
  (fset 'yes-or-no-p 'y-or-n-p)
  (global-linum-mode t)
  :init
  (progn
    (set-face-attribute 'default nil :font "SF Mono-13")

    (setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
    (setq exec-path (append exec-path '("/usr/local/bin")))

    (setq visible-bell nil
	  ring-bell-function 'ignore

	  initial-scratch-message nil
	  initial-major-mode 'fundamental-mode
	  inhibit-splash-screen t
	  inhibit-startup-message t
	  inhibit-default-init t

	  make-backup-files nil
	  backup-directory-alist (list (cons "." (concat emacs-cache-directory "backup/")))

	  column-number-mode t

	  inhibit-compacting-font-caches t
	  ns-use-srgb-colorspace nil)))

(use-package recentf
  :ensure nil
  :hook (after-init . recentf-mode)
  :init
  (progn
    (setq recentf-max-saved-items 10
	  recentf-exclude '((expand-file-name package-user-dir)
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
			    "COMMIT_EDITMSG\\'"))))

(provide 'init-emacs)

;;; init-emacs.el ends here
