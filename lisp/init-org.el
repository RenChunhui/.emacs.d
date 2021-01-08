;;; init-org.el --- org configuration -*- coding: utf-8; lexical-binding: t -*-
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;;; Code:

(use-package org
  :ensure nil
  :custom-face (org-ellipsis ((t (:foreground nil))))
  :defer t
  :mode ("\\.org$\\'" . org-mode)
  :init
  (progn
    (setq org-agenda-files (quote ("~/OneDrive/org/gtd.org"))

	  ;; directory for capture files.
	  org-directory (expand-file-name "~/OneDrive")

	  ;; set status.
	  org-todo-keywords '((sequencep "TODO(t)" "NEXT(n)" "|" "DONE(d)" "CANCELE(c)" "|" "MAYBE(m)" "LATER(l)"))

	  ;; color for todo keywords.
	  org-todo-keyword-faces (quote (("TODO" :foreground "red" :weight bold)
					 ("NEXT" :foreground "blue" :weight bold)
					 ("DONE" :foreground "forest green" :weight bold)
					 ("CANCELED" :foreground "forest green" :weight bold)))
	  
	  ;; add timestamp when todo change to done.
	  org-log-done 'time)))

(use-package org-bullets
  :init
  (add-hook 'org-mode-hook 'org-bullets-mode))
(provide 'init-org)

;;; init-org.el ends here
