;;; init-flycheck.el --- flycheck configuration -*- coding: utf-8; lexical-binding: t -*-
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;;; Code:

(use-package flycheck
  :ensure t
  :diminish flycheck-mode
  :hook ((css-mode . flycheck-mode)
	 (scss-mode . flycheck-mode)
	 (js2-mode . flycheck-mode)
	 (tide-mode .flycheck-mode)
	 (typescript-mode . flycheck-mode)))

(provide 'init-flycheck)

;;; init-flycheck.el ends here
