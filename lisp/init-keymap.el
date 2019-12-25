;;; init-keymap.el --- keymap configuration -*- coding: utf-8; lexical-binding: t -*-
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;;; Code:

(progn
  (setq mac-command-modifier 'super
	mac-option-modifier 'meta)
  (global-set-key (kbd "s-<return>") 'toggle-frame-fullscreen))

(use-package which-key
  :ensure t
  :defer 1
  :init
  (progn
    (setq which-key-add-column-padding 1
	  which-key-max-display-columns nil))
  :config
  (which-key-mode 1))

(provide 'init-keymap)

;;; init-keymap.el ends here
