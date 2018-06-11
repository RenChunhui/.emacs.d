;; core-emacs.el --- My personal Emacs configuration.
;;
;; Copyright (c) 2018
;;
;; Author  : Chunhui Ren <renchunhui2008@gmail.com>
;; Repo    : https://github.com/RenChunhui/.emacs.d
;;
;; License: GPLv3
;;

(require 'core-packages)
(require 'core-common)
(require 'core-display)
(require 'core-theme)

(defun emacs/init ()
  "Initialization."
  (prefer-coding-system 'utf-8)
  (emacs/remove-gui-elements))

(defun emacs/remove-gui-elements ()
  "Remove the tool bar and scroll bars."
  (when (and (fboundp 'tool-bar-mode) (not (eq tool-bar-mode -1)))
    (tool-bar-mode -1))
  (when (and (fboundp 'scroll-bar-mode) (not (eq scroll-bar-mode -1)))
    (scroll-bar-mode -1))
  (when (and (fboundp 'tooltip-mode) (not (eq tooltip-mode -1)))
    tooltip-mode -1))

(emacs/init)

(provide 'core-emacs)
