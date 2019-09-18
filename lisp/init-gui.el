;;; init-gui.el --- gui configuration -*- coding: utf-8; lexical-binding: t -*-
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

(use-package dashboard
  :ensure t
  :diminish (dashboard-mode page-break-lines-mode)
  :init
  (progn
    (setq dashboard-center-content t
	  dashboard-set-heading-icons t
	  dashboard-set-file-icons t
	  dashboard-items '((recents . 5)
			    (projects . 5)
			    (agenda . 5))
	  dashboard-set-footer nil))
  :config
  (dashboard-setup-startup-hook))

(use-package doom-modeline
  :ensure t
  :hook (after-init . doom-modeline-mode)
  :init
  (progn
    (setq doom-modeline-height 25
	  doom-modeline-bar-width 2
	  doom-modeline-icon (display-graphic-p)
	  doom-modeline-major-mode-icon t
	  doom-modeline-buffer-file-name-style 'file-name)))

(use-package winum
  :ensure t
  :config
  (winum-mode))
(provide 'init-gui)

;;; init-gui.el ends here
