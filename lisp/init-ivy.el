;;; init-ivy.el --- ivy configuration -*- lexical-binding: t -*-
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

(use-package ivy
  :hook (after-init . ivy-mode)
  :diminish ivy-mode
  :config
  (progn
    (setq ivy-height 12
	  ivy-wrap t
	  ivy-fixed-height-minibuffer t
	  projectile-completion-system 'ivy)))

(use-package counsel
  :hook (after-init . counsel-mode)
  :diminish counsel-mode
  :config
  (progn
    (define-key counsel-find-file-map (kbd "C-h") 'counsel-up-directory)))

(use-package counsel-projectile)

(use-package swiper)

(provide 'init-ivy)

;;; init-ivy.el ends here
