(use-package recentf
  :defer t
  :init
  (progn
    (add-hook 'find-file-hook (lambda () (unless recentf-mode
                                           (recentf-mode)
                                           (recentf-track-opened-file))))
    (setq recentf-save-file (concat emacs-cache-directory "recentf")
      recentf-max-saved-items 1000
      recentf-auto-cleanup 'never
      recentf-auto-save-timer (run-with-idle-timer 600 t
                                'recentf-save-list)))
  :config
  (progn
    (add-to-list 'recentf-exclude
      (expand-file-name emacs-cache-directory))
    (add-to-list 'recentf-exclude (expand-file-name package-user-dir))))
    
(provide 'init-recentf)