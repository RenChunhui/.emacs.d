;;; init.el --- Load the full configuration -*- lexical-binding: t; -*-
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;;; Code:

;; Produce backtraces when errors occur
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

(require 'init-utils)
(require 'init-osx)
(require 'init-emacs)
(require 'init-elpa)
(require 'init-exec-path)
(require 'init-keybindings)
(require 'init-which-key)

(require 'init-themes)
(require 'init-startup)
(require 'init-modeline)
;;(require 'init-tree)
(require 'init-line-number)
(require 'init-company)
(require 'init-ivy)
(require 'init-yasnippet)
(require 'init-evil)
(require 'init-ctags)

(require 'init-html)
(require 'init-css)
(require 'init-javascript)
(require 'init-typescript)
(require 'init-json)
(require 'init-yaml)
(require 'init-markdown)

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
