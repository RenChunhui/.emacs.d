;;; init.el --- Load all configuration -*- coding: utf-8; lexical-binding: t -*-
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

(when (version< emacs-version "26.1")
  (message "Your Emacs is old, and some functionality in this config will be disabled. Please upgrade if posible."))

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(add-to-list 'custom-theme-load-path (expand-file-name "themes" user-emacs-directory))

(setq gc-cons-threshold (* 128 1024 1024)
      gc-cons-percentage 0.6)

;; custom file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

(require 'init-osx)
(require 'init-general)
(require 'init-elpa)

(require 'init-startup)
;;(require 'init-tab)
(require 'init-modeline)

(require 'init-completion)
(require 'init-ivy)
(require 'init-project)
(require 'init-yasnippet)
(require 'init-flycheck)
(require 'init-evil)
(require 'init-keybindings)

(require 'init-html)
(require 'init-css)
(require 'init-javascript)
(require 'init-typescript)
(require 'init-json)
(require 'init-yaml)
(require 'init-markdown)
(require 'init-org)

(add-hook 'after-init-hook
	  (lambda ()
	    (require 'server)
	    (unless (server-running-p)
	      (server-start))))

(add-hook 'emacs-startup-hook
	  (lambda ()
	    (setq gc-cons-threshold (* 20 1024 1024)
		  gc-cons-percentage 0.1
		  file-name-handler-alist nil)))

(provide 'init)

;;; init.el ends here
