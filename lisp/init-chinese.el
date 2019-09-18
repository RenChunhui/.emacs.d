;;; init-chinese.el --- chinese configuration -*- coding: utf-8; lexical-binding: t -*-
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;;; Code:

(use-package pangu-spacing
  :hook ((text-mode
	  markdown-mode
	  org-mode) . pangu-spacing-mode)
  :init
  (add-hook 'org-mode-hook
	    '(lambda ()
	       (set (make-local-variable 'pangu-spacing-real-insert-separtor) t))))

(use-package cnfonts
  :init
  (add-hook 'org-mode-hook '(lambda ()
			      (setq fontset-orgtable
				    (create-fontset-from-ascii-font "Monaco 14"))
			      (dolist (charset '(han symbol cjk-misc))
				(set-fontset-font fontset-orgtable charset
						  (font-spec :family "Hiragino Sans GB W3" :size 16)))
			      (set-face-attribute 'org-table nil
						  :font "Monaco 14"
						  :fontset fontset-orgtable))))

(provide 'init-chinese)

;;; init-chinese.el ends here
