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

  (emacs//remove-gui-elements)
  (emacs//personal-infomation)
  (emacs//calendar))

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

(defun emacs//personal-infomation ()
  "个人信息."
  (setq user-full-name "Chunhui Ren"
	user-mail-address "renchunhui2008@gmail.com"))

(defun emacs//calendar ()
  "日历自定义."

  ;; 当前月份居中
  (setq-default calendar-offset 0)

  ;; 每周第一天为周一
  (setq-default calendar-week-start-day 1)

  ;; 阳历节日
  (setq holiday-general-holidays
	'((holiday-fixed 2 14 "情人节")
	  (holiday-fixed 3 8 "妇女节")
	  (holiday-fixed 5 1 "劳动节")
	  (holiday-fixed 10 1 "国庆节")))

  ;; 农历节日
  (setq holiday-local-holidays
	'((holiday-chinese 1 15 "元宵节")
	  (holiday-chinese 5 5 "端午节")
	  (holiday-chinese 8 15 "中秋节")))

  ;; 其他节日
  (setq holiday-other-holidays
	'((holiday-fixed 3 24 "自己生日")
	  (holiday-chinese 10 2 "母亲生日")))
  )

(emacs/init)

(provide 'core-emacs)

;;; core-emacs.el ends here
