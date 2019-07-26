;;; init-osx.el --- osx configuration -*- coding: utf-8; lexical-binding: t -*-
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;;; Code:

;; Set keys for Apple keyboard, for emacs in OS X
(setq mac-option-modifier 'meta)
(setq mac-command-modifier 'super)

;; In dired, move deletions to trash
(setq delete-by-moving-to-trash t)

;; Keybinding to toggle full screen mode
(when (fboundp 'toggle-frame-fullscreen)
  (global-set-key (kbd "<s-return>") 'toggle-frame-fullscreen))

;; Don't open files from the workspace in a new frame
(setq ns-pop-up-frames nil)

(provide 'init-osx)

;;; init-osx.el ends here
