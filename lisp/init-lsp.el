;;; init-lsp.el --- lsp configuration -*- coding: utf-8; lexical-binding: t -*-
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;;; Code:

(use-package lsp-mode
  :ensure t
  :commands (lsp lsp-symbol-highlight)
  :hook ((js2-mode . lsp)
         (typescript-mode . lsp)
         (tide-mode . lsp))
  :init
  (progn
    (setq lsp-auto-guess-root t)))

(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode)

(use-package company-lsp
  :ensure t
  :commands company-lsp
  :init
  (set (make-local-variable 'company-backends) '(company-lsp)))
  
(provide 'init-lsp)

;;; init-lsp.el ends here
