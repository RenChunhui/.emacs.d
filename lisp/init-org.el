(require 'org)
(require 'remember)
(require 'org-mouse)

(setq-default org-agenda-files (list
				     "~/Dropbox/org/calendar.org"
				     "~/Dropbox/org/gtd.org"
				     "~/Dropbox/org/notes.org"
				     "~/Dropbox/org/todos.org"))

;; I want files with the extension ".org" to open in org-mode.

(add-to-list 'auto-mode-alist '("\\.org$\\'" . org-mode))

(setq-default org-todo-keywords
	      '((sequence "TODO(t)" "WAITING(w)" "|" "DONE(d)" "CANCELED(c)")))

(setq org-tag-alist '(("@home" . ?h)
		      ("@computer . ?c")
		      ("@telphone . ?t")))

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
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda ()
			     (org-bullets-mode 1))))
                 
(provide 'init-org)