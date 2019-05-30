;;; init-org.el --- org mode configuration -*- coding: utf-8; lexical-binding: t -*-
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;;; Code:

(use-package org
  :ensure nil
  :defer t
  :mode ("\\.org$\\'" . org-mode)
  :init
  (progn
    (setq org-agenda-files (quote ("~/OneDrive/org/gtd.org"
				   "~/OneDrive/org/idea.org"
				   "~/OneDrive/org/journal.org"
				   "~/OneDrive/org/life.org"))
	  org-directory (expand-file-name "~/OneDrive")
	  org-todo-keywords '((sequencep "TODO(t)" "NEXT(n)" "|" "DONE(d)" "CANCELED(c)" "|" "SOMEDAY(s)" "LATER(l)"))
	  org-todo-keyword-faces (quote (("TODO" :foreground "red" :weight bold)
					 ("NEXT" :foreground "blue" :weight bold)
					 ("DONE" :foreground "forest green" :weight bold)
					 ("CANCELED" :foreground "forest green" :weight bold))))))

(use-package org-bullets
  :ensure t
  :after (org)
  :hook (org-mode . org-bullets-mode))

(provide 'init-org)

;;; init-org.el ends here
