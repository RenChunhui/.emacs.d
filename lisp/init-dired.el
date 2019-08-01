;;; init-dired.el --- dired configuration -*- coding: utf-8; lexical-binding: t -*-
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;;; Code:

(use-package dired
  :ensure nil
  :hook (dired-mode . (lambda ()
			(setq dired-omit-mode t)))
  :init
  (progn
    (setq dired-omit-files "\\.git$\\|\\.DS_Store$")))

(provide 'init-dired)

;;; init-dired.el ends here
