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
  (emacs/remove-gui-elements)
  (emacs/display))

(defun emacs/remove-gui-elements ()
  "Remove the tool bar and scroll bars."
  (when (and (fboundp 'tool-bar-mode) (not (eq tool-bar-mode -1)))
    (tool-bar-mode -1))
  (when (and (fboundp 'scroll-bar-mode) (not (eq scroll-bar-mode -1)))
    (scroll-bar-mode -1))
  (when (and (fboundp 'tooltip-mode) (not (eq tooltip-mode -1)))
    tooltip-mode -1))

(defun emacs/display ()
  ;; default font
  (set-default-font "DroidSansMono Nerd Font-13")

  ;; Warn when opening files bigger than 10MB
  (setq large-file-warning-threshold 10000000)

  ;; only type 'y' or 'n' instead of 'yes' or 'no'
  (fset 'yes-or-no-p 'y-or-n-p)

  ;; no splash screen
  (setq inhibit-splash-screen t)

  ;; no message on startup
  (setq initial-scratch-message nil)
  (setq fill-column 80)

  ;; highlight current line
  (global-hl-line-mode 1)
  (global-linum-mode t)

  ;; PATH
  (setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
  (setq exec-path (append exec-path '("/usr/local/bin")))

  ;; nice fonts in macOS
  (setq mac-allow-anti-aliasing t)

  ;; Start fullscreen
  (add-hook 'window-setup-hook 'toggle-frame-fullscreen t)

  ;; delete trailing whitespace in all modes
  (add-hook 'before-save-hook #'delete-trailing-whitespace))

(emacs/init)

(provide 'core-emacs)
