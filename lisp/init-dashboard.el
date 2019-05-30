;;; init-dashboard.el --- dashboard configuration -*- coding: utf-8; lexical-binding: t -*-
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;;; Code:

(use-package dashboard
    :ensure t
    :init
    (setq dashboard-startup-banner "~/.emacs.d/private/icons/logo.png"
	  dashboard-center-content t
	  dashboard-show-shortcuts nil
	  dashboard-set-heading-icons t
    dashboard-set-init-info t
	  dashboard-set-file-icons nil
    dashboard-items '((recents  . 5)
                        (projects . 5)
                        (agenda . 5)))
    :config
    (progn
      (dashboard-setup-startup-hook)))

;; Add heading icons
(defun dashboard-insert-heading-icon (heading &optional _shortcut)
  "Add icon to the section's HEADING."
  (when (and
         (display-graphic-p)
         (eq dashboard-set-heading-icons t))
    (insert (cond
             ((string-equal heading "Recent Files:") (propertize icon-history 'face 'dashboard-heading))
             ((string-equal heading "Agenda for today:") (propertize icon-calendar 'face 'dashboard-heading))
             ((string-equal heading "Projects:") (propertize icon-repo 'face 'dashboard-heading))))
    (insert " ")))
(advice-add #'dashboard-insert-heading :before #'dashboard-insert-heading-icon)

(provide 'init-dashboard)

;;; init-dashboard.el ends here
