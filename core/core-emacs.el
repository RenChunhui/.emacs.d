;;; core-emacs.el --- core config
;;
;; Copyright (c) 2018
;;
;; Author  : Chunhui Ren <renchunhui2008@gmail.com>
;; URL     : https://github.com/RenChunhui/.emacs.d
;; Version : 1.0.0
;;
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;; (_)___|_| |_| |_|\__,_|\___|___/
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;;; Code:

(defun emacs/init ()
  "Perform startup initialzation."
  (prefer-coding-system 'utf-8)

  ;; 不生成临时文件
  (setq-default make-backup-files nil)

  ;; default font
  (set-frame-font "Droidsansmono Nerd Font-13")

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

  ;; 显示列号
  (global-linum-mode t)

  ;; PATH
  (setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
  (setq exec-path (append exec-path '("/usr/local/bin")))

  ;; nice fonts in macOS
  (setq mac-allow-anti-aliasing t)

  (setq ns-use-srgb-colorspace nil)

  ;; delete trailing whitespace in all modes
  (add-hook 'before-save-hook #'delete-trailing-whitespace)

  ;; 显示括号匹配
  (electric-pair-mode t)

  (emacs//remove-gui-elements))

(defun emacs//remove-gui-elements ()
  "Remove the menu bar, tool bar and scroll bar."
  (when (and (fboundp 'tool-bar-mode) (not (eq tool-bar-mode -1)))
    (tool-bar-mode -1))
  (when (and (fboundp 'menu-bar-mode) (not (eq menu-bar-mode -1)))
    (menu-bar-mode -1))
  (when (and (fboundp 'scroll-bar-mode) (not (eq scroll-bar-mode -1)))
    (scroll-bar-mode -1))
  (when (and (fboundp 'tooltip-mode) (not (eq tooltip-mode -1)))
    (tooltip-mode -1)))

(emacs/init)

(provide 'core-emacs)

;;; core-emacs.el ends here
