(use-package evil
  :ensure t
  :init
  (progn
  	(setq-default evil-vsplit-window-right t
		evil-split-window-below t
		evil-normal-state-tag "Ⓝ"
		evil-insert-state-tag "Ⓘ"
		evil-visual-state-tag "Ⓥ"
		evil-motion-state-tag "Ⓜ"
		evil-emacs-state-tag "Ⓔ"))
  :config
  (evil-mode 1))

(use-package evil-leader
  :ensure t
  :config
  (progn
    (global-evil-leader-mode)
    (evil-leader/set-leader "<SPC>")))

(provide 'init-evil)
