 ;;; init-osx.el --- OSX related configuration -*- lexical-binding: t -*-
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

;; Menu bar is not annoying in OSX
(menu-bar-mode 1)

;; Set keys for Apple keyboard, for emacs in OS X
(setq mac-option-modifier 'meta)
(setq mac-command-modifier 'super)

;; Make the browser the OSX default
(setq browse-url-browser-function 'browse-url-default-macosx-browser)

;; In dired, move deletions to trash
(setq delete-by-moving-to-trash t)

;; Keybinding to toggle full screen mode
(when (fboundp 'toggle-frame-fullscreen)
  (global-set-key (kbd "<s-return>") 'toggle-frame-fullscreen))

;; Ignore .DS_Store files with ido mode
;;(add-to-list 'ido-ignore-files "\\.DS_Store")

;; Don't open files from the workspace in a new frame
(setq ns-pop-up-frames nil)

(provide 'init-osx)

;;; init-osx.el ends here
