;;; init-gui.el --- gui configuration -*- coding: utf-8; lexical-binding: t -*-
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;;; Code:

(use-package all-the-icons
  :after memoize
  :load-path "site-lisp/all-the-icons")

(use-package doom-themes
  :ensure t
  :hook (after-load-theme . (lambda ()
			      (set-face-foreground
			       'mode-line
			       (face-foreground 'default))))
  :init
  (load-theme 'doom-one t)
  :config
  (progn
    (set-face-foreground 'mode-line (face-foreground 'default))))

;; (use-package doom-modeline
;;   :ensure t
;;   :hook (after-init . doom-modeline-mode)
;;   :init
;;   (progn
;;     (unless after-init-time
;;       (setq doom-modeline--old-format mode-line-format)
;;       (setq-default mode-line-format nil))
;;     (setq doom-modeline-major-mode-color-icon t
;; 	  doom-modeline-minor-modes nil
;; 	  doom-modeline-mu4e nil)))

;; (use-package hide-mode-line
;;   :ensure t
;;   :hook (((completion-list-mode completion-in-region-mode) . hide-mode-line-mode)))

(provide 'init-gui)

;;; init-gui.el ends here
