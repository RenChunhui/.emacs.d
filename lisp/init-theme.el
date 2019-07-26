;;; init-theme.el --- theme configuration -*- coding: utf-8; lexical-binding: t -*-
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;;; Code:

(use-package dracula-theme
  :ensure t
  :hook (after-init . (lambda ()
			(load-theme 'dracula))))

(provide 'init-theme)

;;; init-theme.el ends here