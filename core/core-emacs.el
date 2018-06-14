(prefer-coding-system 'utf-8)

;; remove tool bar
(tool-bar-mode -1)

;; remove scroll bar
(scroll-bar-mode -1)

;; remove tooltip
(tooltip-mode -1)

;; 启用时间显示
(display-time-mode t)

;; 24 小时制
(setq-default display-time-24hr-format t)

;; 启用邮件设置
(setq-default display-time-use-mail-icon t)

;; 时间变化频率
(setq-default display-time-interval 1000)

(setq-default display-time-string-forms
      '((propertize (format-time-string "%H:%M" now)
		    'face 'bold)))

;; 显示电池
(display-battery-mode t)

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

;; 默认 org 文件目录
(setq-default org-agenda-files '("~/org/todo.org"))

(provide 'core-emacs)

;;; core-emacs.el ends here
