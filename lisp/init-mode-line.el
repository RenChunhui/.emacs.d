;;; init-mode-line.el --- mode line configuration -*- coding: utf-8; lexical-binding: t -*-
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;;; Code:

(use-package winum
  :init
  (setq winum-auto-setup-mode-line nil)
  :config
  (winum-mode))

(use-package doom-modeline
  :hook (after-init . doom-modeline-mode)
  :init
  (progn
    (setq doom-modeline-buffer-file-name-style 'file-name
          doom-modeline-icon (display-graphic-p)
          doom-modeline-major-mode-icon nil)))

(provide 'init-mode-line)

;;; init-mode-line.el ends here
