
(use-package projectile
  :defer .1
  :diminish projectile-mode
  :hook (emacs-startup . projectile-mode)
  :init
  (progn
    (setq projectile-sort-order 'recentf
	  projectile-cache-file (concat emacs-cache-directory "projectile.cache")
	  projectile-known-projects-file (concat emacs-cache-directory "projectile-bookmarks.eld")
	  projectile-globally-ignored-files '(".DS_Store")))
  :config
  (progn
    (setq projectile-completion-system 'ivy)))

(provide 'init-projectile)