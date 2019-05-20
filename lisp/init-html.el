;;; init-html.el --- html langulage configuration -*- lexical-binding: t -*-
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

(use-package web-mode
  :ensure t
  :mode ("\\.html\\'" . web-mode)
  :config
  (progn
    (setq web-mode-markup-indent-offset 2
	  web-mode-css-indent-offset 2
	  web-mode-code-indent-offset 2
	  web-mode-enable-auto-closing t
	  web-mode-enable-auto-pairing t
	  web-mode-enable-current-element-higlight t)))

(provide 'init-html)

;;; init-html.el ends here