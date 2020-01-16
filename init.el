;;; init.el --- Emacs initialization file -*- coding: utf-8; lexical-binding: t -*-
;;
;; Copyright (c) 2019 Chunhui Ren
;;
;; Author: Chunhui Ren <renchunhui2008@gmail.com>
;; URL: https//github.com/renchunhui/.emacs.d
;; 
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;;; Code:

(setq debug-on-error t)

(when (version< emacs-version "25.1")
  (message "Your Emacs is old, and some functionality in this config will be disabled. Please upgrade if posible."))

;; Load path
(defconst emacs-cache-directory
  (expand-file-name (concat user-emacs-directory ".cache/"))
  "Emacs cache directory.")

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "site-lisp" user-emacs-directory))

;; GC
(setq gc-cons-threshold 402653184
      gc-cons-percentage 0.6)

(add-hook 'emacs-startup-hook
	  (lambda ()
	    (setq gc-cons-threshold 16777216
		  gc-cons-percentage 0.1
		  file-name-handler-alist nil)))

;; Require package
(require 'init-elpa)
(require 'init-settings)
(require 'init-theme)
(require 'init-dashboard)
(require 'init-mode-line)
(require 'init-keymap)
(require 'init-edit)

(require 'init-ivy)
(require 'init-completion)
(require 'init-lsp)
(require 'init-projectile)
(require 'init-flycheck)
(require 'init-evil)

(require 'init-web)
;; (require 'init-rust)
(require 'init-json)
(require 'init-yaml)
(require 'init-org)
(require 'init-markdown)

(require 'server)
(unless (server-running-p) (server-start))

(provide 'init)

;;; init.el ends here
