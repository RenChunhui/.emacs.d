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

(when (version< emacs-version "27.1")
  (message "Your Emacs is old, and some functionality in this config will be disabled. Please upgrade if posible."))

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "site-lisp" user-emacs-directory))

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

(require 'init-lsp)
(require 'init-org)

(require 'server)
(unless (server-running-p) (server-start))

(provide 'init)

;;; init.el ends here
