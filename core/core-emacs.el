(prefer-coding-system 'utf-8)

;; remove tool bar
(tool-bar-mode -1)

;; remove scroll bar
(scroll-bar-mode -1)

;; remove tooltip
(tooltip-mode -1)

;; default font
(set-default-font "DroidSansMono Nerd Font-13")

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
(global-linum-mode t)

;; PATH
(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
(setq exec-path (append exec-path '("/usr/local/bin")))

;; nice fonts in macOS
(setq mac-allow-anti-aliasing t)

;; delete trailing whitespace in all modes
(add-hook 'before-save-hook #'delete-trailing-whitespace)

(electric-pair-mode t)

(provide 'core-emacs)

;;; core-emacs.el ends here
