
(defun emacs/init ()
  "Perform startup initialization."
  (emacs//remove-gui-elements)
  (prefer-coding-system 'utf-8)
  (require 'core-config)
  (require 'init-packages)
  (emacs//toggle-fullscreen)
  (emacs//general)
  (packages/initialize)
  (emacs//default-font)
  (emacs//startup-screen)
  (require 'core-keymap)
  )

(defun emacs//remove-gui-elements ()
  "Remove the menu bar, tool bar and scroll bar."
  (tool-bar-mode -1)
  (scroll-bar-mode -1)
  (tooltip-mode -1))

(defun emacs//toggle-fullscreen ()
  "Toggle full screen"
  (interactive)
  (set-frame-parameter
     nil 'fullscreen
     (when (not (frame-parameter nil 'fullscreen)) 'fullboth)))

(defun emacs//default-font ()
  "Default font."
  (set-face-attribute 'default nil :font "DroidSansMono Nerd Font Mono-13"))

(defun emacs//startup-screen ()
  "Startup screen."
  (setq initial-buffer-choice nil)
  (setq inhibit-startup-screen t))

(defun emacs//general ()
  "General."
  (setq visible-bell t)
  (setq fill-column 120)

  ;; Highlighting
  (global-font-lock-mode t)

  ;; Highlighting current line
  (global-hl-line-mode t)

  ;; Show line number
  (global-display-line-numbers-mode)

  ;; Auto insert closing bracket
  (electric-pair-mode t)

  ;; Show cursour position within line
  (column-number-mode t)

  ;; Display time
  (display-time-mode t)

  ;; stop creating those backup~ files
  (setq make-backup-files nil)

  ;; stop creating those #auto-save# files
  (setq auto-save-default nil)

  ;; type y/n instead of yes/no
  (defalias 'yes-or-no-p 'y-or-n-p))

(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
(setq exec-path (append exec-path '("/usr/local/bin")))

(defvar init-time 'nil)
(defun emacs//display-summary()
  (message "%s packages loaded in %.03fs"
	   (length package-activated-list)
	   (or init-time
	       (setq init-time
		     (float-time (time-subtract (current-time) before-init-time))))))

(add-hook 'after-init-hook
	  (lambda ()
	    (setq gc-cons-threshold (* 128 1024 1024)
		  gc-cons-percentage 0.9)
	    ;; nice scrolling
	    (setq scroll-margin 0
		  scroll-conservatively 100000
		  scroll-preserve-screen-position 1)))

(add-hook 'emacs-startup-hook
	  (lambda ()
	    (emacs//display-summary)
	    ))

(provide 'core-emacs)
