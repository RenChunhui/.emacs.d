;;; core-mode-line.el --- custome mode line

;; Author: Chunhui Ren

;;; Commentary:

;;; Code:

(defun spaceline--unicode-number (str)
  "Return a nice unicode representation of a single-digit number STR."
  (cond
   ((string= "1" str) "➊")
   ((string= "2" str) "➋")
   ((string= "3" str) "➌")
   ((string= "4" str) "➍")
   ((string= "5" str) "➎")
   ((string= "6" str) "➏")
   ((string= "7" str) "➐")
   ((string= "8" str) "➑")
   ((string= "9" str) "➒")
   ((string= "0" str) "➓")))

(defun window-number-mode-line ()
  "The current window number.  Requires 'window-numbering-mode' to be enabled."
  (when (bound-and-true-p window-numbering-mode)
    (let* ((num (window-numbering-get-number))
	   (str (when num (int-to-string num))))
      (spaceline--unicode-number str))))

(setq-default mode-line-format
	      (list
	       ;; window number
	       '(:eval (propertize
			(window-number-mode-line)
			'face
			'font-lock-type-face))
	       ;; buffer name
	       "%b"

	       ;; line and column
	       "("
	       (propertize "%02l" 'face 'font-lock-type-face) "|"
	       (propertize "%02c" 'face 'font-lock-type-face)
	       ")"

	       ;; the current major mode for the buffer
	       " ["
	       '(:eval (propertize "%m" 'face 'font-lock-string-face
				   'help-echo buffer-file-coding-system))
	       "] "

	       ;; time
	       "\xe381 %H:%M"

	       ))

(provide 'core-mode-line)

;;; core-mode-line.el ends here
