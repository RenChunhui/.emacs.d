;;; init-evil.el --- evil configuration -*- coding: utf-8; lexical-binding: t -*-
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;;; Code:

(use-package evil
  :ensure t
  :defer .1
  :init
  (progn
    (setq evil-split-window-below t
	  evil-split-window-right t
	  evil-normal-state-tag (propertize "- NORMAL -" 'face '(:foreground "green"))
	  evil-insert-state-tag (propertize "- INSERT -" 'face '(:foreground "blue"))
	  evil-visual-state-tag (propertize "- VISUAL -" 'face '(:foreground "orange"))
	  evil-emacs-state-tag (propertize "- EMACS -" 'face '(:foreground "violet"))))
  :config
  (evil-mode 1))

(use-package evil-leader
  :ensure t
  :after (evil)
  :config
  (progn
    (global-evil-leader-mode)
    (evil-leader/set-leader "<SPC>")))

(provide 'init-evil)

;;; init-evil.el ends here
