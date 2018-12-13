(prefer-coding-system 'utf-8)

;; Remove GUI elements
(when (and (fboundp 'tool-bar-mode) (not (eq tool-bar-mode -1)))
    (tool-bar-mode -1))
(when (and (fboundp 'scroll-bar-mode) (not (eq scroll-bar-mode -1)))
    (scroll-bar-mode -1))
(when (and (fboundp 'tooltip-mode) (not (eq tooltip-mode -1)))
    (tooltip-mode -1))

;; Default font
(setq face-font-rescale-alist `(("STkaiti" . ,(/ 16.0 13))))
(set-face-attribute 'default nil :font "DroidSansMono Nerd Font Mono-13")
(set-fontset-font t 'han      (font-spec :family "STkaiti"))
(set-fontset-font t 'cjk-misc (font-spec :family "STkaiti"))

;; fullscreen
(set-frame-parameter
     nil 'fullscreen
     (when (not (frame-parameter nil 'fullscreen)) 'fullboth))

(setq-default ad-redefinition-action 'accept
	      compilation-always-kill t
	      compilation-ask-about-save nil
	      compilation-scroll-output t
	      confirm-nonexistent-file-or-buffer t
	      enable-recursive-minibuffers nil
	      idle-update-delay 2
	      auto-save-default nil
	      create-lockfiles nil
	      history-length 500
	      make-backup-files nil

	      ;; files
	      abbrev-file-name (concat tea-emacs-cache-directory "abbrev.el")
	      auto-save-list-file-name (concat tea-emacs-cache-directory "autosave")
	      backup-directory-alist (list (cons "." (concat tea-emacs-cache-directory "backup/")))
	      server-auth-dir (concat tea-emacs-cache-directory "server/")
	      url-cache-directory (concat tea-emacs-cache-directory "url/")
	      url-configuration-directory (concat tea-emacs-cache-directory "url/"))

(setq custom-file (concat user-emacs-directory "custom.el"))

(setq inhibit-startup-message t
      inhibit-startup-echo-area-message user-login-name
      inhibit-default-init t
      initial-major-mode 'fundamental-mode
      initial-scratch-message nil
      mode-line-format nil)

(setq visible-bell t
      fill-column 120)

(global-font-lock-mode t)
(global-hl-line-mode t)
(display-time-mode t)
(display-battery-mode t)
(electric-pair-mode t)
(column-number-mode t)
(defalias 'yes-or-no-p 'y-or-n-p)

(eval-and-compile
  (unless (or after-init-time noninteractive)
    (setq gc-cons-threshold (* 128 1024 1024)
	  gc-cons-percentage 0.6
	  file-name-handler-alist nil))
  (require 'cl-lib)
  (load (concat tea-emacs-lisp-directory "init-packages") nil t)
  (require 'core-modeline))

(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
(setq exec-path (append exec-path '("/usr/local/bin")))

(defvar init-time 'nil)
(defun emacs//display-summary()
  (message "%s packages loaded in %.03fs"
	   (length package-activated-list)
	   (or init-time
	       (setq init-time
		     (float-time (time-subtract (current-time) before-init-time))))))

(add-hook 'emacs-startup-hook
	  (lambda ()
	    (emacs//display-summary)
	    ))

(provide 'core-emacs)
