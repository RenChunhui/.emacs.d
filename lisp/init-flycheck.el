;;; init-flycheck.el --- flycheck configuration
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

(use-package flycheck
  :ensure t
  :hook ((emacs-lisp-mode . flycheck-mode)
	 (css-mode . flycheck-mode)
	 (scss-mode . flycheck-mode)
	 (js2-mode . flycheck-mode)
	 (tide-mode . flycheck-mode)
	 (typescript-mode . flycheck-mode)))

(provide 'init-flycheck)

;;; init-flycheck.el ends here
