;;; init.el --- Load the full configuration -*- lexical-binding: t -*-
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

;; Produce backtraces when errors occur
(setq debug-on-error t)

(when (version< emacs-version "26.1")
  (message "Your Emacs is old, and some functionality in this config will be disabled. Please upgrade if possible."))

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(setq gc-cons-threshold (* 128 1024 1024))
(add-hook 'emacs-startup-hook
	  (lambda ()
	    (setq gc-cons-threshold (* 20 1024 1024)
		  gc-cons-percentage 0.6
		  file-name-handler-alist nil)))

(require 'init-values)
(require 'init-functions)
(require 'init-package)
(require 'init-emacs)
(require 'init-exec-path)

(require 'init-startup)
(require 'init-modeline)

(require 'init-evil)
(require 'init-company)
(require 'init-ivy)
(require 'init-yasnippet)
(require 'init-which-key)

(require 'init-project)
(require 'init-flycheck)
(require 'init-editorconfig)
(require 'init-vc)

(require 'init-calendar)
(require 'init-html)
(require 'init-css)
(require 'init-javascript)
(require 'init-typescript)
(require 'init-json)
(require 'init-yaml)
(require 'init-org)
(require 'init-markdown)

;; Allow assets from emacsclient
(add-hook 'after-init-hook
	  (lambda ()
	    (require 'server)
	    (unless (server-running-p)
	      (server-start))))

(provide 'init)

;; Local Variables:
;; coding: utf-8
;; no-byte-compile: t
;; End:
;;; init.el ends here
