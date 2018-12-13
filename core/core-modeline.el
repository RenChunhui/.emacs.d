;;; core-modeline.el --- modeline configuration
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

;; 背景色
;;(set-face-background 'mode-line "#6C5194")

;; 前景色
;;(set-face-foreground 'mode-line "#FFFFFF")

(defun mode-line-fill-right (face reserve)
  "Return empty space using FACE and leaving RESERVE space on the right."
  (unless reserve
    (setq reserve 20))
  (when (and window-system (eq 'right (get-scroll-bar-mode)))
    (setq reserve (- reserve 3)))
  (propertize " "
              'display `((space :align-to (- (+ right right-fringe right-margin) ,reserve)))
              'face face))

(defun mode-line-fill-center (face reserve)
  "Return empty space using FACE to the center of remaining space leaving RESERVE space on the right."
  (unless reserve
    (setq reserve 20))
  (when (and window-system (eq 'right (get-scroll-bar-mode)))
    (setq reserve (- reserve 3)))
  (propertize " "
              'display `((space :align-to (- (+ center (.5 . right-margin)) ,reserve
                                             (.5 . left-margin))))
              'face face))

(defconst RIGHT_PADDING 1)

(defun reserve-left/middle ()
  "居中布局."
  (/ (length (format-mode-line mode-line-align-middle)) 2))

(defun reserve-middle/right ()
  "右端排列."
  (+ RIGHT_PADDING (length (format-mode-line mode-line-align-right))))

(defun powerline--unicode-number (str)
  "Return a nice unicode representation of a single-digit number STR."
  (powerline-raw
   (format-mode-line
    (concat
     (cond
      ((string= "1" str) "① ")
      ((string= "2" str) "② ")
      ((string= "3" str) "③ ")
      ((string= "4" str) "④ ")
      ((string= "5" str) "⑤ ")
      ((string= "6" str) "⑥ ")
      ((string= "7" str) "⑦ ")
      ((string= "8" str) "⑧ ")
      ((string= "9" str) "⑨ ")
      ((string= "0" str) "⑩ "))))))

(defun powerline-window-number ()
  (when (bound-and-true-p winum-mode)
    (let* ((num (winum-get-number))
	   (str (when num (int-to-string num))))
      (powerline--unicode-number str))))

(defun modeline-flycheck ()
  "Flycheck mode line."
  (pcase flycheck-last-status-change
            (`not-checked nil)
            (`no-checker nil)
            (`running (propertize "• ⟲" 'face 'success))
            (`errored (propertize "• ✖" 'face 'error))

            (`finished
             (let* ((error-counts (flycheck-count-errors flycheck-current-errors))
                    (no-errors (cdr (assq 'error error-counts)))
                    (no-warnings (cdr (assq 'warning error-counts)))
                    (face (cond (no-errors '(:foreground "#DC3545"))
                                (no-warnings '(:foreground "#FFC107"))
                                (t 'success))))
               (concat
                (propertize " • ")
                (propertize (format "✖ %s" (or no-errors 0)) 'face (cond (no-errors '(:foreground "#DC3545"))
									 (t '(:foreground "#FFFFFF"))))
                (propertize (format " ⚠ %s" (or no-warnings 0)) 'face (cond (no-warnings '(:foreground "#FFC107"))
									   (t '(:foreground "#FFFFFF")))))
             ))

            (`interrupted "⛔")
            (`suspicious '(propertize "?" 'face 'warning))))

(defun modeline-git-vc ()
  "自定义 git 状态."
  (when vc-mode
    (cond
     ((string-match "Git[:-]" vc-mode)
      (let ((branch (mapconcat 'concat (cdr (split-string vc-mode "[:-]")) "-")))
	(concat
	 (propertize "• \xf418")
	 (propertize (format " %s" branch) 'face `(:height 0.9)))))
     (t (format "%s" vc-mode)))))

(defun modeline-time ()
  "自定义时间显示."
  (concat
   (propertize (format-time-string "• %H:%M") 'face `(:height 0.9))
   ))

(defvar mode-line-align-left
  '("%e"
    (:eval
     (concat
      (propertize (format " %s • " evil-mode-line-tag))
      (powerline-window-number)
      (modeline-git-vc)
      (modeline-flycheck)
      "%2 "
      ))))

(defvar mode-line-align-middle
  '(""
    (:eval
     (concat
      (propertize " %b" 'face 'bold)))))

(defvar mode-line-align-right
  '(""
    (:eval
      (concat
        (propertize "%l:%c ")
        (modeline-time)))))


(setq-default mode-line-format
              (list
               mode-line-align-left
               '(:eval (mode-line-fill-center 'mode-line
                                              (reserve-left/middle)))
               mode-line-align-middle
               '(:eval
                 (mode-line-fill-right 'mode-line
                                       (reserve-middle/right)))
               mode-line-align-right))

(provide 'core-modeline)

;;; core-modeline.el ends here
