;;; init-os.el --- os configuration -*- coding: utf-8; lexical-binding: t -*-
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;;; Code:

(setq mac-option-modifier 'meta
      mac-command-modifier 'super)

(global-set-key (kbd "s-<return>") 'toggle-frame-fullscreen)

(global-set-key (kbd "s-a") 'mark-whole-buffer)
(global-set-key (kbd "s-c") 'kill-ring-save)
(global-set-key (kbd "s-x") 'kill-region)
(global-set-key (kbd "s-v") 'yank)

(global-set-key (kbd "s-z") 'undo)

(global-set-key (kbd "s-s") 'save-buffer)

(provide 'init-os)

;;; init-os.el ends here
