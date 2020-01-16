;;; init-flycheck.el --- flycheck configuration -*- coding: utf-8; lexical-binding: t -*-
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;;; Code:

(use-package flycheck
  :diminish flycheck-mode
  :hook ((css-mode scss-mode js-mode typescript-mode) . flycheck-mode))

(provide 'init-flycheck)

;;; init-flycheck.el ends here
