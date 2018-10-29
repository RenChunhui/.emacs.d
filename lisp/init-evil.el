;;; init-evil.el --- Vim key mode
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
    :config
    (global-evil-leader-mode)
    (evil-leader/set-leader "<SPC>")))

(provide 'init-evil)

;;; init-evil.el ends here
