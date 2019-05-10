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

(require 'ivy)
(require 'counsel)
(require 'counsel-projectile)
(require 'swiper)

(add-hook 'after-init-hook (lambda ()
			     (ivy-mode)
			     (counsel-mode)))

(eval-after-load "ivy"
  '(progn
     (setq ivy-height 12
	   ivy-wrap t
	   ivy-fixed-height-minibuffer t)
     (setq-default projectile-completion-system 'ivy)))

(provide 'init-ivy)

;;; init-ivy.el ends here
