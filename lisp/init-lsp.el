;;; init-lsp.el --- LSP configuration -*- coding: utf-8; lexical-binding: t -*-
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;;; Code:

(use-package lsp-mode
  :commands (lsp lsp-symbol-highlight)
  :hook ((js2-mode . lsp)
         (typescript-mode . lsp)
         (tide-mode . lsp)
         (scss-mode . lsp))
  :init
  (progn
    (setq lsp-auto-guess-root t
          lsp-session-file (concat emacs-cache-directory ".lsp-session-v1"))))

(use-package lsp-ui
  :commands (lsp-ui-mode)
  :init
  (progn
    (setq lsp-ui-sideline-enable nil
          lsp-ui-doc-enable t)))

(use-package company-lsp
  :commands (company-lsp)
  :init
  (progn
    (set (make-local-variable 'company-backends) '(company-lsp))))

(provide 'init-lsp)

;;; init-lsp.el ends here
