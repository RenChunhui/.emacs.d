;; extends
;; (require 'startup)
(require 'mode-line)

;; features
;;(require 'browse)
;;(require 'email)
;;(require 'translate)

(defun emacs/init ()
  "Perform startup initialization."
  (prefer-coding-system 'utf-8)

  ;; No backup file
  (setq-default make-backup-files nil)

  ;; Warn when opening files bigger then 10MB
  (setq large-file-warning-threshold 10000000)

  ;; no message on startup
  (setq initial-scratch-message nil)
  (setq fill-column 80)

  ;; PATH
  (setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
  (setq exec-path (append exec-path '("/usr/local/bin")))

  (emacs//remove-gui-elements)
  (emacs//display)
  (emacs//personal-infomation)
  (emacs//calendar)
  (emacs//monospace))

(defun emacs//remove-gui-elements ()
  "Remove the tool bar and scroll bar."
  (when (and (fboundp 'tool-bar-mode) (not (eq tool-bar-mode -1)))
    (tool-bar-mode -1))
  (when (and (fboundp 'scroll-bar-mode) (not (eq scroll-bar-mode -1)))
    (scroll-bar-mode -1))
  (when (and (fboundp 'tooltip-mode) (not (eq tooltip-mode -1)))
    (tooltip-mode -1)))

(defun emacs//display ()
  "General configuration."
  ;; Highlight current line
  (global-hl-line-mode 1)

  ;; Show line number
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

  (electric-pair-mode t))

(defun emacs//personal-infomation ()
  "Personal infomation."
  (setq user-full-name "Chunhui Ren"
	user-mail-address "renchunhui2008@gmail.com"))

(defun emacs//calendar ()
  "Custom calendar."
  ;; center current month
  (setq-default calendar-offset 0)

  ;; Week in the calendar begins on Monday
  (setq-default calendar-week-start-day 1))

(defun emacs//monospace ()
  "中英文等宽"
  (setq face-font-rescale-alist `(("STkaiti" . ,(/ 16.0 13))))

  (set-face-attribute 'default nil :font "Source Code Pro-13")

  (set-fontset-font t 'han      (font-spec :family "STkaiti"))
  (set-fontset-font t 'cjk-misc (font-spec :family "STkaiti")))

(emacs/init)

(provide 'core-emacs)

;;; core-emacs.el ends here
