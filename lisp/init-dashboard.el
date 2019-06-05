;;; init-dashboard.el --- dashboard configuration -*- coding: utf-8; lexical-binding: t -*-
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;;; Code:

(use-package dashboard
  :init
  (progn
    (setq dashboard-startup-banner "~/.emacs.d/private/icons/logo.png"
	  dashboard-banner-logo-title "Welcome to GNU Emacs."
	  dashboard-set-init-info     t
	  dashboard-center-content    t
	  dashboard-show-shortcuts    nil
	  dashboard-set-heading-icons nil
	  dashboard-set-file-icons    nil
	  dashboard-items '((recents  . 5)
			    (projects . 5)
			    (agenda   . 10))
	  dashboard-set-footer nil))
  :config
  (dashboard-setup-startup-hook))

(provide 'init-dashboard)

;;; init-dashboard.el ends here
