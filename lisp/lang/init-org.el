;;; init-org.el --- org mode
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

(use-package org
  :defer t
  :config
  (evil-leader/set-key
    "a" 'org-agenda
    "c" 'org-capture
    
    "dd" 'org-deadline
    "ds" 'org-schedule
    "dt" 'org-time-stamp
    "dT" 'org-time-stamp-inactive
    "ee" 'org-export-dispatch
    "fi" 'org-feed-goto-inbox
    "fu" 'org-feed-update-all

    "Cc" 'org-clock-cancel
    "Cd" 'org-clock-display
    "Ce" 'org-evaluate-time-range
    "Cg" 'org-clock-goto
    "Ci" 'org-clock-in
    "CI" 'org-clock-in-last
    "Cj" 'org-clock-jump-to-current-clock
    "Co" 'org-clock-out
    "CR" 'org-clock-report
    "Cr" 'org-resolve-clocks

    "Tc" 'org-toggle-checkbox
    "Te" 'org-toggle-pretty-entities
    "Ti" 'org-toggle-inline-images
    "Tl" 'org-toggle-link-display
    "Tt" 'org-show-todo-tree
    "TT" 'org-todo

    "L" 'org-shiftright
    "H" 'org-shiftleft
    "J" 'org-shiftdown
    "K" 'org-shiftup
    
    ":" 'org-set-tags))

(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda ()
			     (org-bullets-mode 1))))

(provide 'init-org)

;;; init-org.el ends here
