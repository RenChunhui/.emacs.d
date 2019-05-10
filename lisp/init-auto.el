;;; init-auto.el --- auto confiuration -*- coding: utf-8; lexical-binding: t -*-
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;;; Code:

(setq auto-mode-alist
      (append
       '(("\\.el\\'" . emacs-lisp-mode)
	 ("\\.html'" . web-mode)
	 ("\\.css'" . css-mode))
       auto-mode-alist))

(provide 'init-auto)

;;; init-auto.el ends here
