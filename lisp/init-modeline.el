;;(require 'powerline-evil)

(defun mode-line-render (left right)
  "Return a string of `window-width' length containing LEFT, and RIGHT
 aligned respectively."
  (let* ((available-width (- (window-width) (length left) 2)))
    (format (format " %%s %%%ds " available-width) left right)))

(defun replace-evil-mode ()
  (format-mode-line
   '(:eval
     (propertize (format "%s" (evil-generate-mode-line-tag evil-state))))))

(defun format-major-mode ()
  (let* ((major-mode (format-mode-line "%m"))
	 (replace-table '(Emacs-Lisp "𝝀"
				     Fundamental "ℱ"))
	 (replace-name (plist-get replace-table (intern major-name))))
    (if replace-name replace-name major-name)))

(defun unicode-number (str)
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
     ((string= "0" str) "⑩")
     ))))

(defun replace-winum-mode ()
  (when (bound-and-true-p winum-mode)
    (let* ((num (winum-get-number))
	   (str (when num (int-to-string num))))
      (unicode-number str))))



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
  "Powerline's Vim-like mode-line with evil state at the beginning in color."
  (interactive)
  (setq-default mode-line-format
                '("%e"
                  (:eval
                   (let* ((active (powerline-selected-window-active))
                          (mode-line (if active 'mode-line 'mode-line-inactive))
                          (face1 (if active 'powerline-active1 'powerline-inactive1))
                          (face2 (if active 'powerline-active2 'powerline-inactive2))
                          (separator-left (intern (format "powerline-%s-%s"
                                                          (powerline-current-separator)
                                                          (car powerline-default-separator-dir))))
                          (separator-right (intern (format "powerline-%s-%s"
                                                           (powerline-current-separator)
                                                           (cdr powerline-default-separator-dir))))
                          (lhs (list (let ((evil-face (powerline-evil-face)))
                                       (if evil-mode
                                           (powerline-raw (powerline-evil-tag) evil-face)))
                                     (powerline-buffer-id `(mode-line-buffer-id ,mode-line) 'l)
                                     ;;(powerline-raw "[" mode-line 'l)
                                     ;;(powerline-major-mode mode-line)
                                     ;;(powerline-process mode-line)
                                     ;;(powerline-raw "]" mode-line)
                                     (when (buffer-modified-p)
                                       (powerline-raw "[+]" mode-line))
                                     (when buffer-read-only
                                       (powerline-raw "[RO]" mode-line))
                                     (powerline-raw "[%z]" mode-line)
                                     ;; (powerline-raw (concat "[" (mode-line-eol-desc) "]") mode-line)
                                     (when (and (boundp 'which-func-mode) which-func-mode)
                                       (powerline-raw which-func-format nil 'l))
                                     (when (boundp 'erc-modified-channels-object)
                                       (powerline-raw erc-modified-channels-object face1 'l))
                                     (powerline-raw "[" mode-line 'l)
                                     (powerline-minor-modes mode-line)
                                     (powerline-raw "%n" mode-line)
                                     (powerline-raw "]" mode-line)
                                     (when (and vc-mode buffer-file-name)
                                       (let ((backend (vc-backend buffer-file-name)))
                                         (when backend
                                           (concat (powerline-raw "[" mode-line 'l)
                                                   (powerline-raw (format "%s / %s" backend (vc-working-revision buffer-file-name backend)))
                                                   (powerline-raw "]" mode-line)))))))
                          (rhs (list (powerline-raw '(10 "%i"))
                                     (powerline-raw global-mode-string mode-line 'r)
                                     (powerline-raw "%l," mode-line 'l)
                                     (powerline-raw (format-mode-line '(10 "%c")))
                                     (powerline-raw (replace-regexp-in-string  "%" "%%" (format-mode-line '(-3 "%p"))) mode-line 'r))))
                     (concat (powerline-render lhs)
                             (powerline-fill mode-line (powerline-width rhs))
                             (powerline-render rhs)))))))

(use-package powerline
  :init
  (powerline-custom-theme))

(provide 'init-modeline)
