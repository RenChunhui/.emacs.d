;;; init-company.el --- company mode configuration -*- lexical-binding: t -*-
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

(use-package company
  :ensure t
  :hook (emacs-startup . global-company-mode)
  :init
  (progn
    (setq company-idle-delay 0.1
	  company-show-numbers t
	  company-tooltip-limit 10
	  company-minimum-prefix-length 1)))

(use-package lsp-mode
  :ensure t
  :commands lsp
  :hook ((js2-mode . lsp)
         (typescript-mode . lsp)
         (tide-mode . lsp)))

(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode)

(use-package company-lsp
  :ensure t
  :commands company-lsp)

(provide 'init-completion)

;;; init-completion.el ends here
