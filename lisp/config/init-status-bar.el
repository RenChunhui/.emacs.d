;;; init-status-bar.el --- custom mode line
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

(require 'powerline)

(defun powerline--unicode-number (str)
  "Return a nice unicode representation of a single-digit number STR."
  (powerline-raw
   (format-mode-line
    (concat
     (cond
      ((string= "1" str) "➀ ")
      ((string= "2" str) "➁ ")
      ((string= "3" str) "➂ ")
      ((string= "4" str) "➃ ")
      ((string= "5" str) "➄ ")
      ((string= "6" str) "➅ ")
      ((string= "7" str) "➆ ")
      ((string= "8" str) "➇ ")
      ((string= "9" str) "➈ ")
      ((string= "0" str) "➉ "))))))

(defpowerline powerline-window-number
  (when (bound-and-true-p winum-mode)
    (let* ((num (winum-get-number))
	   (str (when num (int-to-string num))))
      (powerline--unicode-number str))))

(defpowerline powerline-vc
  (when vc-mode
    (powerline-raw
     (format-mode-line
      (cond
       ((string-match "Git[:-]" vc-mode)
	(let ((branch (mapconcat 'concat (cdr (split-string vc-mode "[:-]")) "-")))
	  (concat
	   (propertize (format " %s " branch)))))
       (t (format "%s" vc-mode)))))))

(defpowerline powerline-flycheck
  (powerline-raw
   (format-mode-line
    '(:eval
      (pcase flycheck-last-status-change
	(`finished (if flycheck-current-errors
		       (let ((count (let-alist (flycheck-count-errors flycheck-current-errors)
				      (+ (or .warning 0) (or .error 0)))))
			 (propertize (format "✖ %s Issue%s" count (if (eq 1 count) "" "s"))))
		     (propertize "✔ No Issues")))
	(`running (propertize "⟲ Running"))
	(`no-checker (propertize "⚠ No Checke"))
	(`not-checked "✖ Disabled")
	(`errored (propertize "⚠ Error"))
	(`interrupted "⛔ Interrupted"))))))

(defpowerline powerline-time
  (powerline-raw
   (format-mode-line
    (concat
     (propertize (format-time-string " %H:%M"))))))

;;;###autoload
(defun powerline-custom-theme ()
  "自定义状态栏."
  (interactive)
  (setq-default mode-line-format
		'("%e"
		  (:eval
		   (let* ((active (powerline-selected-window-active))
                          (mode-line-buffer-id (if active 'mode-line-buffer-id 'mode-line-buffer-id-inactive))
			  (mode-line (if active 'mode-line 'mode-line-inactive))
                          (face0 (if active 'powerline-active0 'powerline-inactive0))
			  (face1 (if active 'powerline-active1 'powerline-inactive1))
			  (face2 (if active 'powerline-active2 'powerline-inactive2))

			  (separator-left (intern (format "powerline-%s-%s"
							  (powerline-current-separator)
							  (car powerline-default-separator-dir))))
			  (separator-right (intern (format "powerline-%s-%s"
							   (powerline-current-separator)
							   (cdr powerline-default-separator-dir))))

			  (lhs (list (powerline-raw evil-mode-line-tag face2 'l)
				     (powerline-raw " " face2)
				     (powerline-window-number face1 'l)
					 (funcall separator-left face1 face0)
				     (powerline-raw "%b" face0 'l)
					 (powerline-raw " " face0)
					 (funcall separator-left face0 face1)
				     (powerline-major-mode face1 'l)
					 (powerline-raw " " face1)
					 (funcall separator-left face1 face0)
				     (powerline-raw (flycheck-mode-line-status-text) face0 'l)
					 (powerline-raw " " face0)
					 (funcall separator-left face0 face1)
				     ))
			  (rhs (list (funcall separator-right face1 face0)
				     (powerline-time face0 'r)
				     (funcall separator-right face0 face1)
				     (powerline-raw " " face1)
				     (powerline-raw "Ln %l" face1 'r)
				     (funcall separator-right face1 face0)
				     (powerline-raw " " face0)
				     (powerline-encoding face0 'r)
				     ))

			  (center (list (powerline-vc face1))))

		     (concat (powerline-render lhs)
			     (powerline-fill-center face1 (/ (powerline-width center) 2.0))
			     (powerline-render center)
			     (powerline-fill face1 (powerline-width rhs))
			     (powerline-render rhs)))))))

(powerline-custom-theme)

(provide 'init-status-bar)

;;; init-status-bar.el ends here
