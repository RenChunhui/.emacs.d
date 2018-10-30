(use-package projectile
  :init
  (progn
    (evil-leader/set-key
      "pb" 'projectile-switch-to-buffer
      "pd" 'projectile-find-dir
      "pf" 'projectile-find-file
      "pr" 'projectile-recentf
      "pp" 'projectile-switch-project
      "pv" 'projectile-vc

      "p!" 'projectile-run-shell-command-in-root
      "p&" 'projectile-run-async-shell-command-in-root
      "p%" 'projectile-replace-regexp
      "pD" 'projectile-dired
      "pk" 'projectile-kill-buffers
      "pR" 'projectile-replace)
    (setq projectile-sort-order 'recentf
      projectile-cache-file (concat emacs-cache-directory
                              "projectile.cache")
      projectile-known-projects-file (concat emacs-cache-directory
                                       "projectile-bookmarks.eld")))
  :config
  (projectile-mode)
  (setq projectile-completion-system 'ivy))

(provide 'init-projectile)
