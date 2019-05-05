;;; init-css.el --- css configuration -*- lexical-binding: t -*-
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

(use-package css-mode
  :defer t
  :mode ("\\.css\\'" . css-mode))

(use-package skewer-mode
  :hook (css-mode . 'skewer-css-mode))

(use-package scss-mode
  :defer t
  :mode (("\\.scss\\'" . scss-mode)
	 ("\\.postcss\\'" . scss-mode)))

(provide 'init-css)

;;; init-css.el ends here
