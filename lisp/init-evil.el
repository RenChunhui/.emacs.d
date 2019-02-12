;;; init-evil.el --- evil configuration
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
  :init
  (progn
  	(setq-default evil-vsplit-window-right t
		evil-split-window-below t
		evil-normal-state-tag "Ⓝ • "
		evil-insert-state-tag "Ⓘ • "
		evil-visual-state-tag "Ⓥ • "
		evil-emacs-state-tag "Ⓔ • "))
  :config
  (evil-mode 1))

(use-package evil-leader
  :config
  (progn
    (global-evil-leader-mode)
    (evil-leader/set-leader "<SPC>")))

(provide 'init-evil)

;;; init-evil.el ends here
