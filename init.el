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

(defconst emacs-cache-directory
  (expand-file-name (concat user-emacs-directory ".cache/"))
  "Emacs cache directory.")

(when (version< emacs-version "26.2")
  (message "Your Emacs is old, and some functionality in this config will be disabled. Please upgrade if posible."))

;; add load path
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "site-lisp" user-emacs-directory))

(setq gc-cons-threshold 402653184
      gc-cons-percentage 0.6)

;; custom file
(setq custom-file (expand-file-name "custom.el" emacs-cache-directory))
(when (file-exists-p custom-file)
  (load custom-file))

(add-hook 'emacs-startup-hook
	  (lambda ()
	    (setq gc-cons-threshold 16777216
		  gc-cons-percentage 0.1
		  file-name-handler-alist nil)))

(require 'server)
(unless (server-running-p) (server-start))

(require 'init-elpa)
(require 'init-osx)
(require 'init-emacs)
(require 'init-gui)

(require 'init-ivy)
(require 'init-completion)
(require 'init-projectile)
(require 'init-flycheck)
(require 'init-vc)
(require 'init-chinese)
(require 'init-tools)

(require 'init-web)
(require 'init-rust)
(require 'init-json)
(require 'init-yaml)
(require 'init-org)
(require 'init-markdown)

(provide 'init)

;;; init.el ends here
