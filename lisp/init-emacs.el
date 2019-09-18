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
	  auto-save-list-file-name (concat emacs-cache-directory "autosave")
	  backup-directory-alist (list (cons "." (concat emacs-cache-directory "backup/")))

	  ;; column-number-mode t

	  inhibit-compacting-font-caches t
	  ns-use-srgb-colorspace nil)))

(use-package display-line-numbers
  :ensure nil
  :hook ((emacs-lisp-mode
	  web-mode
	  js2-mode
	  css-mode
	  scss-mode
	  typescript-mode
	  markdown-mode
	  org-mode
	  json-mode
	  yaml-mode) . display-line-numbers-mode)
  :init
  (setq-default display-line-numbers-width 3))

(use-package bookmark
  :ensure nil
  :init
  (setq bookmark-default-file (concat emacs-cache-directory "bookmarks")))

(use-package recentf
  :ensure nil
  :init
  (progn
    (setq recentf-max-saved-items 10
	  recentf-save-file (concat emacs-cache-directory "recentf")
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

(use-package ibuffer
  :ensure nil
  :bind ("C-x C-b" . ibuffer)
  :init
  (progn
    (setq ibuffer-saved-filter-groups
	  '(("Normal"
	     ("Dired" (mode . dired-mode))
	     ("Emacs" (or
		       (name . "^\\*dashboard\\*$" )
		       (name . "^\\*scratch\\*$"   )
		       (name . "^\\*Messages\\*$"  )
		       (name . "^\\*Backtrace\\*$" )))
	     ("Text" (or
		      (mode . org-mode)
		      (mode . markdown-mode)
		      (mode . rst-mode)
		      (mode . text-mode)))
	     ("Languages" (or
			   (mode . emacs-lisp-mode)
			   (mode . javascript-mode)
			   (mode . rust-mode)
			   (mode . css-mode)
			   (mode . scss-mode)
			   (mode . html-mode))))))))
			   
(provide 'init-emacs)

;;; init-emacs.el ends here
