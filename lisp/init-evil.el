(use-package evil
  :ensure t
  :init
  (progn
  	(setq-default evil-vsplit-window-right t
		evil-split-window-below t
		evil-normal-state-tag "NORMAL"
		evil-insert-state-tag "INSERT"
		evil-visual-state-tag "VISUAL"
		evil-motion-state-tag "MOTION"
		evil-emacs-state-tag "EMACS"))
  :config
  (evil-mode 1))

(use-package evil-leader
  :ensure t
  :config
  (progn
    (global-evil-leader-mode)
    (evil-leader/set-leader "<SPC>")))

(provide 'init-evil)
