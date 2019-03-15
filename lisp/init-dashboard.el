;;; init-dashboard.el --- dashboard configuration -*- lexical-binding: t -*-
;;
;; Copyright (c) 2018 Chunhui Ren
;;
;; Author  : Chunhui Ren <renchunhui2008@gmail.com>
;; URL     : https://github.com/RenChunhui/.emacs.d
;; Version : 1.0.0
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;;; Code:


(use-package dashboard
  :after (projectile)
  :hook (dashboard-mode . (lambda () (setq-local frame-title-format "")))
  :init
  (dashboard-setup-startup-hook)
  (setq page-break-lines-char ? )
  :config
  (setq initial-buffer-choice (lambda () (get-buffer dashboard-buffer-name)))
  (setq dashboard-banner-logo-title "Welcome to GNU Emacs!")
  (setq dashboard-startup-banner "~/.emacs.d/assets/logo.png")
  (setq dashboard-show-shortcuts nil)
  (setq dashboard-items '((recents  . 5)
                          (projects . 5)
                          (agenda . 5)))
  (defun dashboard-insert-info (_list-size)
    (insert (make-string (max 0 (floor (/ (- dashboard-banner-length 49) 2))) ?\ ))
    (insert (propertize (format "╭─────────────────────────────────────────────────╮") 'face 'font-lock-comment-face))
    (insert "\n")
    (insert (make-string (max 0 (floor (/ (- dashboard-banner-length 49) 2))) ?\ ))
    (insert (propertize (format "|        %d packages loaded in %s        |"
                                (length package-activated-list) (emacs-init-time))
                        'face 'font-lock-comment-face))
    (insert "\n")
    (insert (make-string (max 0 (floor (/ (- dashboard-banner-length 49) 2))) ?\ ))
    (insert (propertize (format "╰─────────────────────────────────────────────────╯") 'face 'font-lock-comment-face))
    (insert "\n")
    (insert "\n"))
    
  (add-to-list 'dashboard-item-generators '(info . dashboard-insert-info))
  (add-to-list 'dashboard-items '(info)))

(provide 'init-dashboard)

;;; init-dashboard.el ends here
