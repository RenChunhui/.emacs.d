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
	      '((sequence "TODO(t)" "STARTED(s)" "WAITING(w)" "|" "DONE(d)" "CANCELED(c)")))

(setq org-tag-alist '(("@home" . ?h)
		      ("@computer . ?c")
		      ("@telphone . ?t")))

(provide 'init-org-mode)
