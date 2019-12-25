;;; init-theme.el --- theme configuration -*- coding: utf-8; lexical-binding: t -*-
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;;; Code:

(use-package doom-themes
  :ensure t
  :custom
  (doom-themes-org-config)
  :init
  (load-theme 'doom-one t))

(provide 'init-theme)

;;; init-theme.el ends here
