;;; chunhui-theme.el --- core paths
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

(defmacro cached-for (secs &rest body)
  "Cache for SECS the result of the evaluation of BODY."
  (declare (debug t))
  (let ((cache (make-symbol "cache"))
        (last-run (make-symbol "last-run")))
    `(let (,cache ,last-run)
       (lambda ()
         (when (or (null ,last-run)
                   (> (- (time-to-seconds (current-time)) ,last-run)
                      ,secs))
           (setf ,cache (progn ,@body))
           (setf ,last-run (time-to-seconds (current-time))))
         ,cache))))

(deftheme chunhui
  "A dark medium contrast theme")

(defgroup chunhui
  nil
  "A dark theme inspired from One Dark and Niflheim."
  :group 'faces)

(defcustom chunhui-use-paddings-in-mode-line t
  "When non-nil, use top and bottom paddings in the mode-line."
  :type 'boolean)

(defun true-color-p ()
  "Return non-nil on displays that support 256 colors."
  (or
   (display-graphic-p)
   (= (tty-display-color-cells) 16777216)))

(let ((class '((class color) (min-colors 89)))
      (default (if (true-color-p) "#abb2bf" "#afafaf"))
      (light (if (true-color-p) "#ccd4e3" "#d7d7d7"))
      (background (if (true-color-p) "#282c34" "#333333"))
      (background-dark (if (true-color-p) "#24282f" "#222222"))
      (background-darker (if (true-color-p) "#22252c" "#222222"))
      (mode-line-inactive (if "#1c2129" "#222222"))
      (mode-line-active (if (true-color-p) "#6f337e" "#875f87"))
      (background-lighter (if (true-color-p) "#3a3f4b" "#5f5f5f"))
      (background-red (if (true-color-p) "#4c3840" "#5f5f5f"))
      (bright-background-red (if (true-color-p) "#744a5b" "#744a5b"))
      (background-purple (if (true-color-p) "#48384c" "#5f5f5f"))
      (background-blue (if (true-color-p) "#38394c" "#444444"))
      (bright-background-blue (if (true-color-p) "#4e5079" "#4e5079"))
      (background-green (if (true-color-p) "#3d4a41" "#5f5f5f"))
      (bright-background-green (if (true-color-p) "#3f6d54" "#3f6d54"))
      (background-orange (if (true-color-p) "#4a473d" "#5f5f5f"))
      (hl-line (if (true-color-p) "#2C323C" "#333333"))
      (grey (if (true-color-p) "#cccccc" "#cccccc"))
      (grey-dark (if (true-color-p) "#666666" "#666666"))
      (highlight (if (true-color-p) "#3e4451" "#5f5f5f"))
      (comment (if (true-color-p) "#687080" "#707070"))
      (orange (if (true-color-p) "#da8548" "#d7875f"))
      (orange-light (if (true-color-p) "#ddbd78" "#d7af87"))
      (red (if (true-color-p) "#ff6c6b" "#ff5f5f"))
      (purple (if (true-color-p) "#c678dd" "#d787d7"))
      (purple-dark (if (true-color-p) "#64446d" "#5f5f5f"))
      (blue (if (true-color-p) "#61afef" "#5fafff"))
      (blue-dark (if (true-color-p) "#1f5582" "#005f87"))
      (green (if (true-color-p) "#98be65" "#87af5f"))
      (green-light (if (true-color-p) "#9eac8c" "#afaf87"))
      (peach "PeachPuff3")
      (diff-added-background (if (true-color-p) "#284437" "#284437"))
      (diff-added-refined-background (if (true-color-p) "#1e8967" "#1e8967"))
      (diff-removed-background (if (true-color-p) "#583333" "#580000"))
      (diff-removed-refined-background (if (true-color-p) "#b33c49" "#b33c49"))
      (diff-current-background (if (true-color-p) "#29457b" "#29457b"))
      (diff-current-refined-background (if (true-color-p) "#4174ae" "#4174ae")))
      
  (custom-theme-set-faces
   'chunhui
   `(default ((,class (:background ,background :foreground ,default))))
   `(cursor ((,class (:background ,default))))

   ;; Highlighting faces
   `(fringe ((,class (:background ,background-dark :foreground ,comment))))
   `(border ((,class (:foreground ,background-lighter))))
   `(vertical-border ((,class (:foreground ,background-lighter))))
   `(highlight ((,class (:background ,highlight :foreground ,default :underline nil))))
   `(region ((,class (:background ,highlight))))
   `(secondary-selection ((,class (:background ,highlight :foreground ,default))))
   `(isearch ((,class (:background ,orange-light :foreground ,highlight))))
   `(lazy-highlight ((,class (:background ,grey-dark :foreground ,orange-light))))
   `(hl-line ((,class (:background ,hl-line :underline unspecified :inherit nil))))
   `(shadow ((,class (:foreground ,comment))))

   `(match ((,class (:background ,background-green))))

   ;; Font lock faces
   `(font-lock-builtin-face ((,class (:foreground ,blue :weight bold))))
   `(font-lock-comment-face ((,class (:foreground ,comment :slant italic))))
   `(font-lock-constant-face ((,class (:foreground ,orange :weight bold))))
   `(font-lock-function-name-face ((,class (:foreground ,blue))))
   `(font-lock-keyword-face ((,class (:foreground ,purple :weight bold))))
   `(font-lock-string-face ((,class (:foreground ,green))))
   `(font-lock-doc-face ((,class (:foreground ,green-light))))
   `(font-lock-type-face ((,class (:foreground ,blue))))
   `(font-lock-variable-name-face ((,class (:foreground ,blue))))
   `(font-lock-warning-face ((,class (:foreground ,red :weight bold :background ,background-red))))

   ;; Mode line faces
   `(mode-line ((,class (:background ,background-blue :height 0.9 :foreground ,blue
                                     :box ,(when chunhui-use-paddings-in-mode-line
                                             (list :line-width 6 :color background-blue))))))
   `(mode-line-inactive ((,class (:background ,background-darker :height 0.9 :foreground ,default
                                              :box ,(when chunhui-use-paddings-in-mode-line
                                                      (list :line-width 6 :color background-darker))))))
   `(header-line ((,class (:inherit mode-line-inactive))))

   ;; error & success
   `(error ((,class (:foreground ,red :weight bold))))
   `(warning ((,class (:foreground ,orange :weight bold))))
   `(success ((,class (:foreground ,green :weight bold))))

   ;; powerline
   `(powerline-active1 ((,class (:height 0.9 :foreground ,blue :background ,background-darker))))
   `(powerline-active2 ((,class (:height 0.9 :foreground ,blue :background ,background-lighter))))


   ;; ivy
   `(ivy-current-match ((,class (:background ,background-purple :weight bold :foreground ,purple))))
   `(ivy-minibuffer-match-face-1 ((,class (:foreground ,orange))))
   `(ivy-minibuffer-match-face-2 ((,class (:foreground ,green))))
   `(ivy-minibuffer-match-face-3 ((,class (:foreground ,green))))
   `(ivy-minibuffer-match-face-4 ((,class (:foreground ,green))))
   `(ivy-match-required-face ((,class (:foreground ,red :background ,background-red :weight bold))))
   `(ivy-modified-buffer ((,class (:foreground ,red))))
   `(ivy-remote ((,class (:foreground ,blue))))
   `(ivy-highlight-face ((,class (:foreground ,blue :weight bold))))
  )

  (custom-theme-set-variables
   'chunhui
   `(ansi-color-names-vector [,background
                              ,red
                              ,green
                              ,orange
                              ,blue
                              ,purple
                              ,blue-dark
                              ,default])))

(defun chunhui-face-when-active (face)
  "Return FACE if the window is active."
  (when (chunhui--active-window-p)
    face))

;; So the mode-line can keep track of "the current window"
(defvar chunhui-selected-window nil
  "Selected window.")

(defun chunhui--set-selected-window (&rest _)
  "Set the selected window."
  (let ((window (frame-selected-window)))
    (when (and (windowp window)
               (not (minibuffer-window-active-p window)))
      (setq chunhui-selected-window window))))

(defun chunhui--active-window-p ()
  "Return non-nil if the current window is active."
  (eq (selected-window) chunhui-selected-window))

(add-hook 'window-configuration-change-hook #'chunhui--set-selected-window)
(add-hook 'focus-in-hook #'chunhui--set-selected-window)
(advice-add 'select-window :after #'chunhui--set-selected-window)
(advice-add 'select-frame  :after #'chunhui--set-selected-window)

(provide-theme 'chunhui)

;; Local Variables:
;; no-byte-compile: t
;; End:

;;; chunhui-theme.el ends here
