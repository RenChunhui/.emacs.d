(require 'recentf)

(add-hook 'after-init-hook 'recentf-mode)

(setq recentf-max-saved-items 10
      recentf-exclude '((expand-file-name package-user-dir)
			".cache"
			"bookmarks"
			"recentf"
			"url"
			"undo-tree-hist"))

(provide 'init-recentf)

;;; init-recentf.el ends here
