;;; init.el --- core paths
;;
;; Copyright (c) 2018 Chunhui Ren
;;
;; Author  : Chunhui Ren <renchunhui2008@gmail.com>
;; URL     : https://github.com/RenChunhui/.emacs.d
;; Version : 1.0.0
;;
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;; (_)___|_| |_| |_|\__,_|\___|___/
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;;; Code:
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;; (package-initialize)

;; Increase the garbage collection threshold to 128 MB to ease startup
(setq gc-cons-threshold (* 128 1024 1024))

(load-file (concat (file-name-directory load-file-name)
		   "core/core-load-paths.el"))
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

;; core
(require 'core-emacs)
(require 'core-use-package)
(require 'core-editor)
(require 'core-completion)
(require 'core-themes)
(require 'core-features)
(require 'core-keymap)

;; languages
(require 'init-css)
(require 'init-html)
(require 'init-javascript)
(require 'init-json)
(require 'init-lisp)
(require 'init-markdown)
(require 'init-org)
(require 'init-scss)
(require 'init-shell)
(require 'init-yaml)

;;; init.el ends here
