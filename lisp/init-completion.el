;; company
;; ivy
;; yasnippet

(use-package company
  :defer t
  :init
  (progn
    (setq company-idle-delay 0.2
	  company-minimum-prefix-length 2
	  company-require-match nil)
    (add-hook 'after-init-hook 'global-company-mode)))

;; (use-package yasnippet
;;   :init
;;   (setq yas-snippet-dirs
;; 	'("~/.emacs.d/private/snippets"))
;;   (yas-global-mode 1)
;;   :config
;;   (yas-reload-all)
;;   (global-set-key (kbd "M-/") 'company-yasnippet))

(use-package which-key
  :init
  (progn
    (which-key-add-key-based-replacements
      "SPC f" "files"
      "SPC s" "search"
      "SPC o" "org mode"
      "SPC p" "project"))
  :config
  (progn
    (which-key-mode)))

(provide 'init-completion)