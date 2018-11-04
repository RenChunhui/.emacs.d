;;; init-config.el --- init config
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

;;----------------------------------------------------------------------------
;; 编码
;;----------------------------------------------------------------------------

(prefer-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(setq-default buffer-file-coding-system 'utf-8)

;;----------------------------------------------------------------------------
;; 移除 GUI 元素
;;----------------------------------------------------------------------------

;; 禁用工具栏
(tool-bar-mode -1)

;; 禁用滚动条
(scroll-bar-mode -1)

;; 禁用提示
(tooltip-mode -1)

;;----------------------------------------------------------------------------
;; 默认主题
;;----------------------------------------------------------------------------

(require 'color-theme-tomorrow)
(color-theme-tomorrow--define-theme night-bright)

;;----------------------------------------------------------------------------
;; 设置全屏
;;----------------------------------------------------------------------------

;; (run-at-time "3sec" nil
;; 	     (lambda ()
;; 	       (interactive)
;; 	       (set-frame-parameter
;; 		nil 'fullscreen
;; 		(unless (frame-parameter nil 'fullscreen)
;; 		  'fullboth))))

;;----------------------------------------------------------------------------
;; 中英文等宽
;;----------------------------------------------------------------------------

(setq face-font-rescale-alist `(("STkaiti" . ,(/ 16.0 13))))
(set-face-attribute 'default nil :font "DroidSansMono Nerd Font Mono-13")
(set-fontset-font t 'han      (font-spec :family "STkaiti"))
(set-fontset-font t 'cjk-misc (font-spec :family "STkaiti"))

;;----------------------------------------------------------------------------
;; Emacs 初使化设置
;;----------------------------------------------------------------------------

;; 关闭出错时的提示声
(setq visible-bell t)

;; 关闭开机画面
(unless noninteractive
  (setq inhibit-startup-message t
	inhibit-splash-screen t
	initial-scratch-message nil))

;; 每行显示内容
(setq fill-column 80)

;; 语法高亮
(global-font-lock-mode t)

;; 高亮当前行
(global-hl-line-mode 1)

;; 显示行号
(global-linum-mode t)

;; 自动补全括号
(electric-pair-mode t)

;; 显示时间
(display-time-mode 1)

;; 增加显示效果
(setq mac-allow-anti-aliasing t)
(setq ns-use-srgb-colorspace nil)

;; 不要自动备份
(setq make-backup-files nil)
(setq auto-save-default nil)

(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
(setq exec-path (append exec-path '("/usr/local/bin")))

(defalias 'yes-or-no-p 'y-or-n-p)

;;----------------------------------------------------------------------------
;; 初使化启动界面
;;----------------------------------------------------------------------------

(setq-default auto-save-list-file-name (concat emacs-cache-directory "autosave")
	      url-configuration-directory (concat emacs-cache-directory "url/"))


(add-hook 'after-init-hook
	  (lambda ()
	    (setq gc-cons-threshold (* 128 1024 1024)
		  gc-cons-percentage 0.9)))

;; Warn when opening files bigger then 10MB
(setq large-file-warning-threshold 10000000)



(defvar mage-init-time 'nil)
(defun emacs//display-summary()
  (message "%s packages loaded in %.03fs"
	   (length package-activated-list)
	   (or mage-init-time
	       (setq mage-init-time
		     (float-time (time-subtract (current-time) before-init-time))))))
(add-hook 'emacs-startup-hook #'emacs//display-summary)

(provide 'init-config)

;;; init-config.el ends here
