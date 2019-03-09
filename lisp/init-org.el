;;; init-org.el --- org mode configuration -*- lexical-binding: t -*-
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
  :mode ("\\.org$\\'" . org-mode)
  :init
  (progn
    (setq-default org-todo-keywords
		  '((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d)" "CANCELED(c)" "|" "SOMEDAY(s)"))

		  org-directory (expand-file-name "~/OneDrive")
		  org-default-notes-file (concat org-directory "/gtd.org")
		  org-agenda-files (list
				    "~/OneDrive/org/life.org"
				    "~/OneDrive/org/gtd.org"
				    "~/OneDrive/org/journal.org")
		  org-tag-alist '(("@home" . ?h)
				  ("@computer . ?c")
				  ("@phone . ?p"))
		  )
    (add-hook 'org-mode-hook 'org-hide-block-all))
							     
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
  :ensure t
  :config
  (add-hook 'org-mode-hook 'org-bullets-mode))
                 
(provide 'init-org)

;;; init-org.el ends here
