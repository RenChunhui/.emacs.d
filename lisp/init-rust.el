;;; init-rust.el --- rust language configuration -*- coding: utf-8; lexical-binding: t -*-
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;;; Code:

(use-package rust-mode
  :defer t
  :mode ("\\.rs\\'" . rust-mode))

(use-package racer
  :defer t
  :init
  (progn
    (add-hook 'rust-mode-hook #'racer-mode)
    (add-hook 'racer-mode-hook #'eldoc-mode)
    (setq company-tooltip-align-annotations t)))

(provide 'init-rust)

;;; init-rust.el ends here