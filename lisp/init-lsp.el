;;; init-lsp.el --- lsp configuration -*- coding: utf-8; lexical-binding: t -*-
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;;; Code:

(use-package lsp-mode
  :ensure t
  :hook (typescript-mode . lsp)
  :commands lsp)

(provide 'init-lsp)

;;; init-lsp.el ends here
