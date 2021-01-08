;;; init-lsp.el -*- lexical-binding: t; -*-

(use-package lsp-mode
  :hook (
         (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp)

(provide 'init-lsp)
;;; init-lsp.el ends here
