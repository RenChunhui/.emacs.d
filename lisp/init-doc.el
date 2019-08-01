;;; init-doc.el --- doc configuration -*- coding: utf-8; lexical-binding: t -*-
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;;; Code:

(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
	 ("\\.md\\'" . markdown-mode))
  :init
  (setq markdown-command "multimarkdown"))

(use-package org
  :defer t
  :mode ("\\.org$\\'" . org-mode)
  :init
  (progn
    (setq org-agenda-files (quote ("~/OneDrive/org/gtd.org"
				   "~/OneDrive/org/idea.org"
				   "~/OneDrive/org/journal.org"
				   "~/OneDrive/org/life.org"))

	  ;; directory for capture files.
	  org-directory (expand-file-name "~/OneDrive")

	  ;; set status.
	  org-todo-keywords '((sequencep "TODO(t)" "NEXT(n)" "|" "DONE(d)" "CANCELED(c)" "|" "SOMEDAY(s)" "LATER(l)"))

	  ;; color for todo keywords.
	  org-todo-keyword-faces (quote (("TODO" :foreground "red" :weight bold)
					 ("NEXT" :foreground "blue" :weight bold)
					 ("DONE" :foreground "forest green" :weight bold)
					 ("CANCELED" :foreground "forest green" :weight bold)))
	  
	  ;; add timestamp when todo change to done.
	  org-log-done 'time)))

(provide 'init-doc)

;;; init-doc.el ends here
