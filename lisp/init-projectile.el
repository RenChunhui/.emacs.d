(use-package projectile
  :diminish projectile-mode
  :after (after-find-file dired-before-readin-hook minibuffer-setup-hook)
  :init
  (progn
    (setq projectile-sort-order 'recentf
	  projectile-cache-file (concat emacs-cache-directory "projectile.cache")
	  projectile-known-projects-file (concat emacs-cache-directory "projectile-bookmarks.eld")
	  projectile-globally-ignored-files '(".DS_Store")
	  projectile-globally-ignored-file-suffixes '(".elc" ".pyc")
	  projectile-files-cache-expire 604800
	  projectile-use-git-grep t
    projectile-completion-system 'ivy)))

(provide 'init-projectile)
