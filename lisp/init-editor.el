;;; init-editor.el --- editor configuration -*- lexical-binding: t -*-
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

(use-package editorconfig
  :init
  (progn
    (dolist (hook (list
		   'css-mode
		   'scss-mode
		   'typescript-mode
		   'tide-mode
		   'js2-mode))
      (add-hook hook '(lamdba () (editorconfig-mode 1))))))

(provide 'init-editor)

;;; init-editor.el ends here
