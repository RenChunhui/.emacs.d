;;; init-plugins.el --- init package -*- lexical-binding: t -*-
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

(use-package benchmark-init
  :ensure t
  :config
  (add-hook 'after-init-hook 'benchmark-init/deactivate))



;;----------------------------------------------------------------------------
;; Theme
;;----------------------------------------------------------------------------

(use-package dracula-theme
  :ensure t
  :hook (after-init . (lambda ()
			(load-theme 'dracula))))



;;----------------------------------------------------------------------------
;; company
;;----------------------------------------------------------------------------

(use-package company
  :ensure t
  :hook (emacs-startup . global-company-mode)
  :diminish company-mode
  :init
  (progn
    (setq company-idle-delay            0.2
	  company-show-numbers          nil
	  company-tooltip-limit         10
	  company-minimum-prefix-length 2)))



;;----------------------------------------------------------------------------
;; ivy
;;----------------------------------------------------------------------------

(use-package ivy
  :ensure t
  :diminish ivy-mode
  :hook (emacs-startup . ivy-mode)
  :config
  (progn
    (setq ivy-height 12
	  ivy-wrap t
	  ivy-use-virtual-buffers t
	  ivy-fixed-height-minibuffer t)
    (setq-default projectile-completion-system 'ivy)))

(use-package counsel
  :ensure t
  :defer .1
  :bind (("M-x" . counsel-M-x))
  :init
  (progn
    (setq counsel-find-file-ignore-regexp "\\.DS_Store\\'")))

(use-package counsel-projectile
  :ensure t
  :defer .1)

(use-package swiper
  :ensure t
  :defer .1)

  

;;----------------------------------------------------------------------------
;; projectile
;;----------------------------------------------------------------------------

(use-package projectile
  :defer .1
  :diminish projectile-mode
  :hook (emacs-startup . projectile-mode)
  :init
  (progn
    (setq projectile-sort-order 'recentf
	  projectile-cache-file (concat emacs-cache-directory "projectile.cache")
	  projectile-known-projects-file (concat emacs-cache-directory "projectile-bookmarks.eld")
	  projectile-globally-ignored-files '(".DS_Store")))
  :config
  (progn
    (setq projectile-completion-system 'ivy)))



;;----------------------------------------------------------------------------
;; yasnippet
;;----------------------------------------------------------------------------

(use-package yasnippet
  :ensure t
  :diminish yas-minor-mode
  :hook ((emacs-lisp-mode . yas-minor-mode)
	 (js2-mode . yas-minor-mode)
	 (web-mode . yas-minor-mode)
	 (css-mode . yas-minor-mode)
	 (scss-mode . yas-minor-mode)
	 (tide-mode . yas-minor-mode)
	 (typescript-mode . yas-minor-mode))
  :diminish yas-minor-mode
  :init
  (setq yas-snippet-dirs '("~/.emacs.d/snippets"))
  :config
  (yas-reload-all)
  (global-set-key (kbd "M-/") 'company-yasnippet))



;;----------------------------------------------------------------------------
;; flycheck
;;----------------------------------------------------------------------------

(use-package flycheck
  :ensure t
  :diminish flycheck-mode
  :hook ((css-mode  . flycheck-mode)
	 (scss-mode . flycheck-mode)
	 (js2-mode  . flycheck-mode)
	 (tide-mode . flycheck-mode)
	 (typescript-mode . flycheck-mode)))



;;----------------------------------------------------------------------------
;; magit
;;----------------------------------------------------------------------------

(use-package magit
  :ensure t
  :diminish auto-revert-mode)

(use-package diminish
  :ensure t
  :defer 1)

(use-package editorconfig
  :ensure t
  :diminish editorconfig-mode
  :config
  (editorconfig-mode 1))
  
(provide 'init-plugins)

;;; init-plugins.el ends here
