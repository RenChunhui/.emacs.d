;;; init-dashboard.el --- dashboard configuration -*- coding: utf-8; lexical-binding: t -*-
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;;; Code:

(use-package dashboard
  :ensure t
  :after (all-the-icons)
  :diminish (dashboard-mode page-break-lines-mode)
  :init
  (setq dashboard-center-content t
	dashboard-show-shortcuts nil
	dashboard-set-heading-icons t
	dashboard-set-init-info t
	dashboard-set-file-icons nil
	dashboard-items '((recents  . 5)
			  (projects . 5)
			  (agenda . 5))
	dashboard-set-footer nil)
  :config
  (progn
    (dashboard-setup-startup-hook)))

(provide 'init-dashboard)

;;; init-dashboard.el ends here
