;;; init-evil.el --- evil configuration -*- lexical-binding: t -*-
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
  :defer 1
  :init
  (progn
  	(setq-default evil-vsplit-window-right t
		evil-split-window-below t
		evil-normal-state-tag "NORMAL"
		evil-insert-state-tag "INSERT"
		evil-visual-state-tag "VISUAL"
		evil-emacs-state-tag "EMACS"))
  :config
  (evil-mode 1))

(use-package evil-leader
  :after evil
  :config
  (progn
    (global-evil-leader-mode)
    (evil-leader/set-leader "<SPC>")))

(provide 'init-evil)

;;; init-evil.el ends here
