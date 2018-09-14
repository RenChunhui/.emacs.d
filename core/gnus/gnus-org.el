;;; guns-org.el --- org mode config
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

(require 'org)
(require 'remember)
(require 'org-mouse)

(setq-default org-agenda-files (list "~/.org/bill.org"
				     "~/.org/calendar.org"
				     "~/.org/gtd.org"
				     "~/.org/notes.org"
				     "~/.org/tasks.org"
				     "~/.org/todo.org"))

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

(provide 'gnus-org)

;;; guns-org.el ends here

