;;; init-javascript.el --- javascript configuration -*- lexical-binding: t -*-
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

(use-package js2-mode
  :mode ("\\.js\\'" . js2-mode)
  :hook (js2-mode . js2-imenu-extras-mode))

(use-package tern
  :hook (js2-mode . tern-mode)
  :init
  (setq tern-command '("/usr/local/bin/tern" "--no-port-file")))

(use-package company-tern
  :config (progn
	    (add-to-list 'company-backends 'company-tern)
	    (setq company-tern-meta-as-single-line t)
	    (setq company-tooltip-align-annotations t)))

(provide 'init-javascript)

;;; init-javascript.el ends here