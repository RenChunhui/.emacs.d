(use-package company
  :ensure t
  :init
  (progn
    (setq company-idle-delay 0.1
	  company-tooltip-limit 10
	  company-minimum-prefix-length 1)
    (add-hook 'after-init-hook 'global-company-mode)))

(use-package popup
  :ensure t)

(use-package yasnippet
  :ensure t
  :init
  (setq yas-snippet-dirs '("~/.emacs.d/private/snippets"))
  (yas-global-mode 1)
  :config
  (yas-reload-all)
  (global-set-key (kbd "M-/") 'company-yasnippet))

(use-package which-key
  :ensure t
  :init
  (progn
    (which-key-add-key-based-replacements
      "SPC b" "Buffer"
      "SPC c" "Clock"
      "SPC f" "Files"
      "SPC h" "Help"
      "SPC o" "Org mode"
      "SPC p" "Project"
      "SPC s" "Search"))
  :config
  (progn
    (which-key-mode)))

(provide 'init-completion)

;;; init-completion.el ends here
