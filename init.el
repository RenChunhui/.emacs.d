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

(load (concat (file-name-directory load-file-name)
	      "lisp/init-path.el")
      nil (not init-file-debug))

(load (concat (file-name-directory load-file-name)
	      "lisp/init-gc.el")
      nil (not init-file-debug))

(require 'init-elpa)
(require 'init-settings)
(require 'init-theme)
(require 'init-dashboard)
(require 'init-mode-line)
(require 'init-keymap)

(require 'init-ivy)
(require 'init-completion)
(require 'init-projectile)
(require 'init-flycheck)

(require 'init-web)
(require 'init-rust)
(require 'init-json)
(require 'init-yaml)
(require 'init-org)
(require 'init-markdown)

(require 'server)
(unless (server-running-p) (server-start))

(provide 'init)

;;; init.el ends here
