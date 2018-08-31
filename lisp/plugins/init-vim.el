(use-package evil
  :ensure t
  :config
  (evil-mode t))

(use-package evil-leader
    :ensure t
    :config
    (global-evil-leader-mode)
    (evil-leader/set-leader "<SPC>"))

(provide 'init-vim)