(use-package company
  :after (diminish)
  :init
  (progn
    (setq company-idle-delay 0.1
	  company-tooltip-limit 10
	  company-minimum-prefix-length 1)
    (add-hook 'after-init-hook 'global-company-mode)))

(use-package company-quickhelp
  :after (company)
  :init
  (progn
    (add-hook 'after-init-hook 'company-quickhelp-mode)))

(use-package yasnippet
  :init
  (setq yas-snippet-dirs '("~/.emacs.d/private/snippets"))
  (yas-global-mode 1)
  :config
  (yas-reload-all)
  (global-set-key (kbd "M-/") 'company-yasnippet))

(use-package which-key
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
    (setq which-key-sort-order #'which-key-prefix-then-key-order
	  which-key-sort-uppercase-first nil
	  which-key-add-column-padding 1
	  which-key-max-display-columns nil
	  which-key-min-display-lines 5)
    (which-key-mode)))

(provide 'init-completion)

;;; init-completion.el ends here
