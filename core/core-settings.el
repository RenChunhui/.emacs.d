;; auto-save
;; keymap
;; line-number
;; mode
;; dired
;;; Code:

(defun emacs//personal-infomation ()
  "个人信息设置."
  (setq user-full-name "Chunhui Ren"
	user-mail-address "renchunhui2008@gmail.com"))

(defun emacs//load-theme ()
  "Default theme."
  (load-theme 'chunhui t))

(defun emacs//remove-gui-elements ()
  "移除不需要的GUI元素."
  (tool-bar-mode -1)
  (scroll-bar-mode -1)
  (tooltip-mode -1))

(defun emacs//env-path ()
  "Env path."
  (setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
  (setq exec-path (append exec-path '("/usr/local/bin"))))

(defun emacs//auto-save-enable ()
    "Auto save file."
    (interactive)
    (run-with-idle-timer 30 t #'auto-save-buffers))

(defun emacs//line-number-enable ()
  "Configuration for display line number.")

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

(defun emacs//startup-fullscreen ()
  "Default startup fullscreen."
  (setq ns-use-native-fullscreen nil
	ns-use-fullscreen-animation nil)
  (run-at-time "5sec" nil
	       (lambda ()
		 (let ((fullscreen (frame-parameter (select-frame) 'fullscreen)))
		   (when (memq fullscreen '(fullscreen fullboth))
		     (set-frame-parameter (select-frame) 'fullscreen 'maximized))
		   (toggle-frame-fullscreen))))
  (setq frame-resize-pixelwise t))


(defun emacs//monospace ()
  "中英文等宽."
  ;;(setq face-font-rescale-alist `(("WenQuanYi Micro Hei" . ,(/ 16.0 13))))

  (set-face-attribute 'default nil :font "FuraMono Nerd Font Mono-13")

  ;;(set-fontset-font t 'han      (font-spec :family "WenQuanYi Micro Hei"))
  ;;(set-fontset-font t 'cjk-misc (font-spec :family "WenQuanYi Micro Hei")))
  )
;;(add-to-list 'default-frame-alist '(fullscreen . maximized))

(provide 'core-settings)

;;; core-settings.el ends here
