;;; core-emacs.el --- core configuration
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

(defconst emacs-start-time (current-time))

(require 'core-keymap)
(require 'core-layers)

(require 'gnus-calendar)
(require 'gnus-dired)
(require 'gnus-bindings)
(require 'gnus-org)

(defun emacs/init ()
  "初使化设置."
  ;; No backup file
  (setq-default make-backup-files nil)

  ;; Warn when opening files bigger then 10MB
  (setq large-file-warning-threshold 10000000)

  ;; PATH
  (setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
  (setq exec-path (append exec-path '("/usr/local/bin")))

  (emacs//remove-gui-elements)
  (emacs//display)
  (emacs//personal-infomation)
  (emacs//monospace))

(defun emacs//remove-gui-elements ()
  "移除不需要的GUI元素."
  (when (and (fboundp 'tool-bar-mode) (not (eq tool-bar-mode -1)))
    (tool-bar-mode -1))
  (when (and (fboundp 'scroll-bar-mode) (not (eq scroll-bar-mode -1)))
    (scroll-bar-mode -1))
  (when (and (fboundp 'tooltip-mode) (not (eq tooltip-mode -1)))
    (tooltip-mode -1)))


(defun emacs//display ()
  "视觉显示."
  "编码格式."
  (prefer-coding-system 'utf-8)
  ;; 启动不显示消息
  (setq initial-scratch-message nil)
  (setq fill-column 80)
  ;; 高亮当前行
  (global-hl-line-mode 1)
  ;; 显示行号
  (global-linum-mode t)
  ;; display column number in modeline
  (column-number-mode)
  ;; No splash screen
  (setq inhibit-splash-screen t)
  ;; display current time in modeline
  (display-time-mode 1)
  ;; Only type 'y' or 'n' instead of 'yes' or 'no'
  (fset 'yes-or-no-p 'y-or-n-p)
  ;; Nice fonts in macOS
  (setq mac-allow-anti-aliasing t)
  (setq ns-use-srgb-colorspace nil)
  ;; 自动补全括号
  (electric-pair-mode t))

(defun emacs//personal-infomation ()
  "个人信息设置."
  (setq user-full-name "Chunhui Ren"
	user-mail-address "renchunhui2008@gmail.com"))

(defun emacs//monospace ()
  "中英文等宽."
  (setq face-font-rescale-alist `(("STkaiti" . ,(/ 16.0 13))))

  (set-face-attribute 'default nil :font "Source Code Pro-13")

  (set-fontset-font t 'han      (font-spec :family "STkaiti"))
  (set-fontset-font t 'cjk-misc (font-spec :family "STkaiti")))

(emacs/init)

(provide 'core-emacs)

;;; core-emacs.el ends here
