;;; init.el --- core paths
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

(load (concat (file-name-directory load-file-name) "lisp/init-values"))

(when (version< emacs-version tea-emacs-min-version)
  (message "Your Emacs is old, and some functionality in this config will be disabled. Please upgrade if possible."))

(add-to-list 'load-path (expand-file-name tea-emacs-lisp-directory user-emacs-directory))

(eval-and-compile
  (unless (or after-init-time noninteractive)
    (setq gc-cons-threshold (* 128 1024 1024)
	  gc-cons-percentage 0.6
	  file-name-handler-alist nil))
  (require 'cl-lib))

(require 'init-functions)
(require 'init-package)
(require 'init-exec-path)
(require 'init-emacs)

(require 'init-window)
(require 'init-modeline)
(require 'init-evil)
(require 'init-keymap)
(require 'init-company)
(require 'init-yasnippet)
(require 'init-which-key)
(require 'init-ivy)
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

(add-hook 'emacs-startup-hook
	  (lambda ()
	    (emacs//display-summary)))

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
