
(prefer-coding-system 'utf-8)

;; Suppress GUI features
(setq use-file-dialog nil
      use-dialog-box nil)

(setq inhibit-startup-screen t
      inhibit-splash-screen t
      inhibit-default-init t
      inhibit-startup-echo-area-message t)

(setq initial-scratch-message nil
      initial-major-mode 'fundamental-mode)
      
;; Show a marker in the left fringe for lines not in the buffer
(setq indicate-empty-lines t)

;; No tool bar
(if (fboundp 'tool-bar-mode)
    (tool-bar-mode -1))

(if (fboundp 'set-scroll-bar-mode)
    (set-scroll-bar-mode nil))

(if (fboundp 'menu-bar-mode)
    (menu-bar-mode -1))

(fset 'yes-or-no-p 'y-or-n-p)

(electric-pair-mode t)

(global-hl-line-mode t)

(global-font-lock-mode 1)

(global-visual-line-mode 1)

(set-face-attribute 'default nil :font "SF Mono-13")
(set-fontset-font t 'han (font-spec :family "STkaiti" :size 16))
(set-fontset-font t 'cjk-misc (font-spec :family "STkaiti" :size 16))

(provide 'init-gui-frames)
