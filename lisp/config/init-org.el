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

;; Some basic keybindings.

;; (global-set-key "C-cl" 'org-store-link)
;; (global-set-key "C-ca" 'org-agenda)

(setq-default org-todo-keywords
	      '((sequence "TODO(t)" "STARTED(s)" "WAITING(w)" "|" "DONE(d)" "CANCELED(c)")))

;; I use org's tag feature to implement contexts.

(setq org-tag-alist '(("@home" . ?h)
		      ("@computer . ?c")
		      ("@telphone . ?t")))

(provide 'init-org)
