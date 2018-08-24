(use-package org
  :ensure t
  :mode ("\\.org\\'" . org-mode)
  :bind (("C-c a" . org-agenda)
	 ("C-c l" . org-store-link)
	 ("C-c c" . org-capture))
  :config
  (setq-default org-log-done-with-time 'time
	org-log-done t
	org-agenda-include-diary t
	org-src-fontify-natively t))

(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-bullets-mode-hook (lambda () (org-bullets-mode 1))))
    
(provide 'init-org)

;;; init-org.el ends here
