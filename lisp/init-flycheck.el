;;; init-flycheck.el --- flyche
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

(require 'flycheck)

(dolist (hook (list
	       'lisp-mode-hook
	       'css-mode-hook
	       'scss-mode-hook
	       'js2-mode-hook
	       'typescript-mode-hook))
  (add-hook hook '(lambda () (flycheck-mode 1))))

(use-package flycheck-pos-tip
  :disabled t
  :after flycheck
  :config
  (flycheck-pos-tip-mode))
  
(provide 'init-flycheck)

;;; init-flycheck.el ends here
