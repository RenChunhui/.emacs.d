;;; init-org.el --- org mode configuration
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
  (which-key-add-major-mode-key-based-replacements 'org-mode
    "SPC d" "date"
    "SPC c" "clock"
    "SPC :" "set tags")
  (evil-leader/set-key-for-mode 'org-mode
    "dd" 'org-deadline
    "ds" 'org-schedule
    "dt" 'org-time-stamp
    "dT" 'org-time-stamp-inactive
    "cc" 'org-clock-cancel
    "cd" 'org-clock-display
    "ce" 'org-evaluate-time-range
    "cg" 'org-clock-goto
    "ci" 'org-clock-in
    "cI" 'org-clock-in-last
    "cj" 'org-clock-jump-to-current-clock
    "co" 'org-clock-out
    "cR" 'org-clock-report
    "cr" 'org-resolve-clocks
    ":" 'org-set-tags)
  (evil-leader/set-key
    "oa" 'org-agenda
    "oc" 'org-capture))

(use-package org-bullets
  :config
  (add-hook 'org-mode-hook (lambda ()
			     (org-bullets-mode 1))))

(provide 'init-org)

;;; init-org.el ends here
