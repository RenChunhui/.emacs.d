;;; init-base.el --- base packages
;;
;; Copyright (c) 2018 Chunhui Ren
;;
;; Author  : Chunhui Ren <renchunhui2008@gmail.com>
;; URL     : https://github.com/RenChunhui/.emacs.d
;; Version : 1.0.0
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;;; Code:

(use-package evil
  :ensure t
  :init
  (setq-default evil-want-inter nil)
  (setq-default evil-search-module 'evil-search)
  (setq-default evil-ex-complete-emacs-commands nil)
  (setq-default evil-vsplit-window-right t)
  (setq-default evil-split-window-below t)
  (setq-default evil-shift-round nil)
  (setq-default evil-normal-state-tag "Ⓝ"
		evil-insert-state-tag "Ⓘ"
		evil-visual-state-tag "Ⓥ"
		evil-motion-state-tag "Ⓜ"
		evil-emacs-state-tag  "Ⓔ")
  :config
  (evil-mode 1)

  (use-package evil-leader
    :ensure t
    :config
    (global-evil-leader-mode))

  (use-package evil-surround
    :ensure t
    :config
    (global-evil-surround-mode))

  (use-package evil-indent-textobject
    :ensure t))

;; (use-package zerodark-theme
;;   :ensure t
;;   :config
;;   (load-theme 'zerodark t))

(use-package projectile
  :ensure t
  :config
  (projectile-mode)
  (setq projectile-completion-system 'ivy))

(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode t)
  (add-hook 'after-init-hook #'global-flycheck-mode))

(use-package yasnippet
  :ensure t
  :init
  (yas-global-mode 1))

(use-package winum
  :ensure t
  :config
  (setq winum-auto-setup-mode-line nil)
  (winum-mode))

(use-package magit
  :ensure t)

(use-package editorconfig
  :ensure t
  :config
  (editorconfig-mode))

(use-package powerline
  :ensure t
  :init
  (setq-default powerline-default-separator 'slant))
  
(provide 'init-base)

;;; init-base.el ends here
