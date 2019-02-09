;; prefer coding
(prefer-coding-system 'utf-8)

;; remove tool bar
(tool-bar-mode -1)

;; remove scroll bar
(scroll-bar-mode -1)

;; remove tooltip
(tooltip-mode -1)

;; y/n instead of yes/no
(fset 'yes-or-no-p 'y-or-n-p)

;; show line number
(global-linum-mode t)

;; auto insert closing bracket
(electric-pair-mode t)

;; turn on highlighting current line
(global-hl-line-mode t)

;; enable syntax highlighting
(global-font-lock-mode 1)

;; wrap long lines by word boundary, and arrow up/down move by visual line, etc
(global-visual-line-mode 1)

;; display current time in modeline
(display-time-mode t)

;; set options
(setq user-full-name "Ren Chunhui"
      user-mail-address "renchunhui2008@gmail.com"

      ;; Splash Screen
      inhibit-splash-screen t
      inhibit-startup-message t
      inhibit-startup-echo-area-message user-login-name
      inhibit-default-init t
      initial-scratch-message nil
      initial-major-mode 'fundamental-mode

      ;; Custom file
      custom-file (concat tea-emacs-cache-directory "custom.el")

      ;; Indentation
      tab-width 2
      indent-tabs-mode nil

      ;; Error message
      visible-bell nil
      ring-bell-function 'ignore

      ;; Backup files
      make-backup-files nil
      backup-directory-alist (list (cons "." (concat tea-emacs-cache-directory "backup/")))

      ;; Fullscreen
      ns-use-native-fullscreen nil

      ;; number mode
      column-number-mode t

      ;; Cache
      abbrev-file-name (concat tea-emacs-cache-directory "abbrev.el")
      auto-save-list-file-name (concat tea-emacs-cache-directory "autosave")
      server-auth-dir (concat tea-emacs-cache-directory "server/")
      url-cache-directory (concat tea-emacs-cache-directory "url/")
      url-configuration-directory (concat tea-emacs-cache-directory "url/"))

;; path
(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
(setq exec-path (append exec-path '("/usr/local/bin")))

;; load packages
(eval-and-compile
  (unless (or after-init-time noninteractive)
    (setq gc-cons-threshold (* 128 1024 1024)
	  gc-cons-percentage 0.6
	  file-name-handler-alist nil))
  (require 'cl-lib)
  (load (concat tea-emacs-lisp-directory "init-packages") nil t))

(add-hook 'emacs-startup-hook
	  (lambda ()
	    (emacs//display-summary)))

;; fullscreen
(when (fboundp 'toggle-frame-fullscreen)
  (global-set-key (kbd "<s-return>") 'toggle-frame-fullscreen))

(provide 'core-emacs)
