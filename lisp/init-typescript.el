;;; init-typescript.el --- typescript configuratioin -*- lexical-binding: t -*-
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

(use-package typescript-mode
  :ensure t
  :mode "\\.ts$")

(use-package tide
  :ensure t
  :after (typescript-mode company)
  :hook ((typescript-mode . tide-setup)
	 (typescript-mode . tide-hl-identifier-mode)
	 (before-save . tide-format-before-save))
  :init
  (progn
    (setq tide-tsserver-executable "/usr/local/bin/tsserver")))

(provide 'init-typescript)

;;; init-typescript.el ends here