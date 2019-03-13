;;; init-lsp.el --- lsp mode configuration -*- lexical-binding: t -*-
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

;; (use-package lsp-mode
;;   :defer t
;;   :hook ((typescript-mode . #'lsp)
;; 	 (tide-mode . #'lsp))
;;   :init
;;   (progn
;;     (require 'lsp-clients)
;;     (setq lsp-prefer-flymake nil)))

;; (use-package lsp-ui
;;   :defer t
;;   :commands (lsp-ui-mode)
;;   :init
;;   (progn
;;     (setq lsp-ui-doc-enable t)))

;; (use-package company-lsp
;;   :defer t
;;   :commands (company-lsp))

;; (use-package eglot
;;   :init
;;   (progn
;;   (add-to-list 'eglot-server-programs '(typescript-mode . ("~/.config/yarn/global/node_modules/javascript-typescript-langserver")))))

(provide 'init-lsp)

;;; init-lsp.el ends here
