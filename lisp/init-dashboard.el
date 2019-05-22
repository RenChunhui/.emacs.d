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
	  dashboard-set-file-icons t
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
    ;; Load `all-the-icons' if it's unavailable
    (unless (featurep 'all-the-icons)
      (require 'all-the-icons nil t))

    (insert (cond
             ((string-equal heading "Recent Files:") (propertize history 'face 'dashboard-heading))
             ((string-equal heading "Bookmarks:")
              (all-the-icons-octicon "bookmark" :height 1.2 :v-adjust 0.0 :face 'dashboard-heading))
             ((string-equal heading "Agenda for today:") (propertize calendar 'face 'dashboard-heading))
             ((string-equal heading "Registers:")
              (all-the-icons-octicon "database" :height 1.2 :v-adjust 0.0 :face 'dashboard-heading))
             ((string-equal heading "Projects:") (propertize repo 'face 'dashboard-heading))))
    (insert " ")))
(advice-add #'dashboard-insert-heading :before #'dashboard-insert-heading-icon)

(provide 'init-dashboard)

;;; init-dashboard.el ends here
