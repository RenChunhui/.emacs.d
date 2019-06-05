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

;; modeline 是否使用 icon 图标
(defvar *modeline-icon-enable* t)

;; dashboard 是否启用
(defvar *dashboard-enable* t)

;; 是否启用 lsp mode
(defvar *lsp-enable* nil)

;; 是否使用 company-quickhelp
(defvar *quickhelp-enable* t)

;; 是否使用 company-box
(defvar *company-box-enable* nil)

(when (version< emacs-version "26.1")
  (message "Your Emacs is old, and some functionality in this config will be disabled. Please upgrade if posible."))

;; 添加路径
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(add-to-list 'custom-theme-load-path (expand-file-name "private/themes" user-emacs-directory))

(setq gc-cons-threshold (* 128 1024 1024)
      gc-cons-percentage 0.6)

;; custom file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

(require 'init-osx)
(require 'init-symbols)
(require 'init-elpa)
(require 'init-generic)

(require 'init-theme)

(when *dashboard-enable*
  (require 'init-dashboard))
(unless *dashboard-enable*
  (require 'init-startup))

(require 'init-modeline)
(require 'init-tree)

(require 'init-completion)

(when *lsp-enable*
  (require 'init-lsp))

(require 'init-styles-guide)
(require 'init-ivy)
(require 'init-project)
(require 'init-yasnippet)
(require 'init-flycheck)
(require 'init-evil)
(require 'init-keybindings)
(require 'init-lang)
(require 'init-org)

(add-hook 'emacs-startup-hook
	  (lambda ()
	    (setq gc-cons-threshold (* 20 1024 1024)
		  gc-cons-percentage 0.1
		  file-name-handler-alist nil)))

(provide 'init)

;;; init.el ends here
