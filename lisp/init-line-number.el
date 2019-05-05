;;; init-line-number.el --- 
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

(setq line-number-display-limit large-file-warning-threshold)
(setq line-number-display-limit-width 1000)

(dolist (hook (list
	       'emacs-lisp-mode-hook
	       'makefile-gmake-mode-hook
	       'html-mode-hook
	       'js2-mode-hook
	       'typescript-mode-hook
	       'css-mode-hook
	       'scss-mode-hook))
  (add-hook hook (lambda () (display-line-numbers-mode))))

(provide 'init-line-number)

;;; init-line-number.el ends here
