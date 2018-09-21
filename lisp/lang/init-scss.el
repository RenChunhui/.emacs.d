;;; init-scss.el --- scss mode
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

(use-package scss-mode
  :ensure t
  :mode (("\\.scss\\'" . scss-mode)
	 ("\\.postcss\\'" . scss-mode)))

(use-package lsp-css
  :ensure t
  :ensure-system-package
  (css-languageserver . "yarn global add vscode-css-languageserver-bin")
  :commands (lsp-css-enable lsp-scss-enable)
  :hook ((css-mode . #'lsp-css-enable)
	 (scss-mode . #'lsp-scss-enable)))

(provide 'init-scss)

;;; init-scss.el ends here
