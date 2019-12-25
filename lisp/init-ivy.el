;;; init-ivy.el --- ivy configuration -*- coding: utf-8; lexical-binding: t -*-
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;;; Code:

(use-package ivy
  :ensure t
  :diminish ivy-mode
  :hook (after-init . ivy-mode)
  :config
  (progn
    (setq ivy-height 12
	  ivy-wrap t
	  ivy-use-virtual-buffers t
	  ivy-fixed-height-minibuffer t)
    (setq-default projectile-completion-system 'ivy)))

(use-package ivy-rich
  :ensure t
  :hook (ivy-mode . ivy-rich-mode))

(use-package counsel
  :ensure t
  :diminish ivy-mode counsel-mode
  :hook (after-init . counsel-mode)
  :bind (("M-x" . counsel-M-x))
  :init
  (progn
    (setq counsel-find-file-ignore-regexp "\\.DS_Store\\'")))

(use-package counsel-projectile
  :ensure t)

(use-package swiper
  :ensure t
  :after ivy)

(provide 'init-ivy)

;;; init-ivy.el ends here