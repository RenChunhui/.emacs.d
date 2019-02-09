(use-package evil
  :init
  (progn
  	(setq-default evil-vsplit-window-right t
		evil-split-window-below t
		evil-normal-state-tag (propertize "NORMAL" 'face '(:foreground "DarkGoldenrod2"))
		evil-insert-state-tag (propertize "INSERT" 'face '(:foreground "chartreuse3"))
		evil-visual-state-tag (propertize "VISUAL" 'face '(:foreground "gray"))
		evil-motion-state-tag (propertize "MOTION" 'face '(:foreground "plum3"))
		evil-emacs-state-tag (propertize "EMACS" 'face '(:foreground "SkyBlue2")))
	(add-hook 'after-init-hook 'evil-mode)))

(use-package evil-leader
  :config
  (progn
    (global-evil-leader-mode)
    (evil-leader/set-leader "<SPC>")))

(provide 'init-evil)
