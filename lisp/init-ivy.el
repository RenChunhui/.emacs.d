;;; init-ivy.el --- ivy configuration -*- coding: utf-8; lexical-binding: t -*-
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
  :config
  (progn
    (setq ivy-height 12
	  ivy-wrap t
	  ivy-fixed-height-minibuffer t)
    (setq-default projectile-completion-system 'ivy)))

(use-package counsel
  :hook (after-init . counsel-mode))

(use-package counsel-projectile)

(use-package swiper)

(provide 'init-ivy)

(provide 'init-ivy)

;;; init-ivy.el ends here
