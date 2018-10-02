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

(require 'core-startup)
(require 'core-layers)

(defun emacs//remove-gui-elements ()
  "Remove the menu bar, tool bar and scrool bars."
  (tool-bar-mode -1)
  (scroll-bar-mode -1)
  (tooltip-mode -1))

(defun emacs//personal-infomation ()
  "Personal infomation."
  (setq user-full-name "Chunhui Ren"
	user-mail-address "renchunhui2008@gmail.com"))

(defun emacs//default-theme ()
  "Load default theme."
  (interactive)
  (load-theme 'chunhui t))

(defun emacs//env-path ()
  "Develop path."
  (setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
  (setq exec-path (append exec-path '("/usr/local/bin"))))

(defun emacs//toggle-fullscreen ()
  "Toggle fullscreen Emacs (non-native on macOS)."
  (interactive)
  (set-frame-parameter
   nil 'fullscreen
   (unless (frame-parameter nil 'fullscreen)
     'fullboth)))

(defun emacs//display ()
  "视觉显示."
  ;; splash screen
  (setq-default inhibit-splash-screen t
		initial-scratch-message nil)

  ;; enable syntax highlighting
  (global-font-lock-mode 1)
  
  (setq fill-column 80)
  ;; 高亮当前行
  (global-hl-line-mode 1)
  ;; 显示行号
  (global-linum-mode t)
  ;; display column number in modeline
  (column-number-mode)
  ;; display current time in modeline
  (display-time-mode 1)
  ;; Only type 'y' or 'n' instead of 'yes' or 'no'
  (fset 'yes-or-no-p 'y-or-n-p)
  (setq mac-allow-anti-aliasing t)
  (setq ns-use-srgb-colorspace nil)
  (setq linum-format " %d ")
  (electric-pair-mode t))

(defun emacs//auto-save-enable ()
    "Auto save file."
    (interactive)
    (run-with-idle-timer 30 t #'auto-save-buffers))

(defun emacs//monospace ()
  "中英文等宽."
  ;;(setq face-font-rescale-alist `(("WenQuanYi Micro Hei" . ,(/ 16.0 13))))

  (set-face-attribute 'default nil :font "FuraMono Nerd Font Mono-13")

  ;;(set-fontset-font t 'han      (font-spec :family "WenQuanYi Micro Hei"))
  ;;(set-fontset-font t 'cjk-misc (font-spec :family "WenQuanYi Micro Hei")))
  )

(defun emacs/init ()
  "Perform startup initialization."
  (emacs//remove-gui-elements)
  (emacs//personal-infomation)
  (emacs//default-theme)
  (emacs//env-path)
  (emacs//toggle-fullscreen)
  (emacs//display)
  (emacs//auto-save-enable)
  (emacs//monospace))

(emacs/init)

(provide 'core-emacs)

;;; core-emacs.el ends here
