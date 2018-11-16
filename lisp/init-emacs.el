;; UTF-8 as default encoding
(prefer-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(setq-default buffer-file-coding-system 'utf-8)

;; Remove GUI elements
(tool-bar-mode -1)
(scroll-bar-mode -1)
(tooltip-mode -1)

;; Fonts
(set-face-attribute 'default nil :font "DroidSansMono Nerd Font Mono-13")

(setq visible-bell t)

(setq fill-column 120)

;; Highlighting
(global-font-lock-mode t)

;; highlighting current line
(global-hl-line-mode t)

;; always show line numbers
(global-display-line-numbers-mode)

;; auto insert closing bracket
(electric-pair-mode t)

;; show cursor position within line
(column-number-mode t)

;; display time
(display-time-mode t)

;; stop creating those backup~ files
(setq make-backup-files nil)

;; stop creating those #auto-save# files
(setq auto-save-default nil)

;; type y/n instead of yes/no
(defalias 'yes-or-no-p 'y-or-n-p)

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

(add-hook 'term-setup-hook
	  (lambda ()
	    ))

(add-hook 'window-setup-hook
	  (lambda ()))

(provide 'init-emacs)
