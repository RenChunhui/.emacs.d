(defface powerline-highlight-face '((t (:background "DarkGoldenrod2"
                                             :foreground "#3E3D31"
                                             :inherit mode-line)))
  "Powerline face 3."
  :group 'powerline)

(defmacro diminish-major-mode (mode-hook abbrev)
  "Macro for diminish major mode with MODE-HOOK and ABBREV."
  `(add-hook ,mode-hook
             (lambda () (setq mode-name ,abbrev))))

(setq ns-use-srgb-colorspace nil)

(if *modeline-icon-enable*
    (progn
      (diminish-major-mode 'emacs-lisp-mode-hook (propertize (format " %s " icon-elisp)      'face 'elisp-face))
      (diminish-major-mode 'web-mode-hook        (propertize (format " %s " icon-html)       'face 'html-face))
      (diminish-major-mode 'css-mode-hook        (propertize (format " %s " icon-css)        'face 'css-face))
      (diminish-major-mode 'scss-mode-hook       (propertize (format " %s " icon-scss)       'face 'scss-face))
      (diminish-major-mode 'js2-mode-hook        (propertize (format " %s " icon-javaScript) 'face 'javaScript-face))
      (diminish-major-mode 'typescript-mode-hook (propertize (format " %s " icon-typescript) 'face 'typescript-face))
      (diminish-major-mode 'json-mode-hook       (propertize (format " %s " icon-json)       'face 'json-face))
      (diminish-major-mode 'yaml-mode-hook       (propertize (format " %s " icon-yaml)       'face 'yaml-face))
      (diminish-major-mode 'org-mode-hook        (propertize (format " %s " icon-default)    'face 'org-face))
      (diminish-major-mode 'markdown-mode-hook   (propertize (format " %s " icon-markdown)   'face 'markdown-face))
      (diminish-major-mode 'dashboard-mode-hook  (propertize (format " %s " icon-dashboard)  'face 'dashboard-heading)))
  (progn
    (diminish-major-mode 'text-mode-hook (propertize "Text"))
    (diminish-major-mode 'fundamental-mode-hook (propertize " Fundamental "))
    (diminish-major-mode 'dashboard-mode-hook   (propertize " Dashboard "  'face '(:background "#672F14")))
    (diminish-major-mode 'emacs-lisp-mode-hook  (propertize " Emacs-Lisp " 'face '(:background "#A52ECB")))
    (diminish-major-mode 'org-mode-hook         (propertize " Org-mode "   'face 'org-face))
    (diminish-major-mode 'web-mode-hook         (propertize " HTML "       'face 'html-face))
    (diminish-major-mode 'css-mode-hook         (propertize " CSS "        'face 'css-face))
    (diminish-major-mode 'scss-mode-hook        (propertize " Sass "       'face 'scss-face))
    (diminish-major-mode 'js2-mode-hook         (propertize " JavaScript " 'face 'javaScript-face))
    (diminish-major-mode 'typescript-mode-hook  (propertize " TypeScript " 'face 'typescript-face))
    (diminish-major-mode 'tide-mode-hook        (propertize " TypeScript " 'face 'typescript-face))
    (diminish-major-mode 'json-mode-hook        (propertize " JSON "       'face 'json-face))
    (diminish-major-mode 'yaml-mode-hook        (propertize " YAML "       'face 'yaml-face))
    (diminish-major-mode 'markdown-mode-hook    (propertize " Markdown "   'face 'markdown-face))))



;;;###autoload
(defun powerline-custom-theme ()
  "Mini powerline theme."
  (interactive)
  (setq-default mode-line-format '("%e"
				   (:eval
				    (let* ((active (powerline-selected-window-active))
					   (mode-line-buffer-id (if active 'mode-line-buffer-id 'mode-line-buffer-id-inactive))
			  		   (mode-line (if active 'mode-line 'mode-line-inactive))
					   (face0 (if active 'powerline-active0 'powerline-inactive0))
			  		   (face1 (if active 'powerline-active1 'powerline-inactive1))
			  		   (face2 (if active 'powerline-active2 'powerline-inactive2))
					   (face3 (if active 'powerline-highlight-face 'mode-line))
					   
					   (separator-left (intern (format "powerline-%s-%s"
									   (powerline-current-separator)
									   (car powerline-default-separator-dir))))
					   (separator-right (intern (format "powerline-%s-%s"
									    (powerline-current-separator)
									    (cdr powerline-default-separator-dir))))
					   
					   ;; left
					   (lhs (list (powerline-raw " " face3)
						      (powerline-raw (insert-winum-number) face3)
						      (powerline-raw " " face3)
						      (funcall separator-left face3 mode-line)
						      (powerline-raw " %b ")
						      (powerline-raw (insert-major-mode))
						      (powerline-raw (insert-version-control))
						      (powerline-raw " ")
						      (powerline-raw (insert-flycheck))))
					   
					   ;; center
					   (center (list (powerline-raw evil-mode-line-tag)))
					   
					   ;; right
					   (rhs (list (powerline-raw (insert-buffer-encoding))
						      (powerline-raw (replace-regexp-in-string  "%" "%%" (format-mode-line '(-3 "%p"))))
						      (powerline-raw " " mode-line)
						      )))

				      (concat (powerline-render lhs)
					      (powerline-fill-center mode-line (/ (powerline-width center) 2.0))
					      (powerline-render center)
					      (powerline-fill mode-line (powerline-width rhs))
					      (powerline-render rhs)))))))

(defun winum-unicode-number (str)
  (format-mode-line
   '(:eval 
     (concat
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
       ((string= "0" str) "➓"))))))

(defun buffer-encoding-segment ()
  "The full `buffer-file-coding-system'."
  (format-mode-line
   '(:eval
      (format "%s" buffer-file-coding-system))))

(defun buffer-encoding-abbrev-segment ()
  "The line ending convention used in the buffer."
  (format-mode-line
  '(:eval
    (let ((buf-coding (format "%s" buffer-file-coding-system)))
    (if (string-match "\\(dos\\|unix\\|mac\\)" buf-coding)
        (match-string 1 buf-coding)
      buf-coding)))))

(use-package winum
  :init
  (winum-mode))

(use-package powerline
  :init
  (progn
    (setq powerline-default-separator 'utf-8)
    (powerline-custom-theme))
  :config
  (progn
    (defun insert-winum-number ()
      "Window number."
      (if *modeline-icon-enable*
	  (winum-unicode-number (winum-get-number-string))
	(format-mode-line '(:eval (format " %s " (winum-get-number-string))))))
    
    (defun insert-version-control ()
      "Git & SVN."
      (format-mode-line
       '(:eval
	 (cond
	  ((string-match "Git[:-]" vc-mode)
	   (let ((branch (mapconcat 'concat (cdr (split-string vc-mode "[:-]")) "-")))
	     (concat
	      (propertize (format " %s %s " git_branch branch)))))
	  (t (format "%s" vc-mode))))))
    
    (defun insert-flycheck ()
      "Flycheck."
      (format-mode-line
       '(:eval
	 (pcase flycheck-last-status-change
	   (`finished (if flycheck-current-errors
			  (let-alist (flycheck-count-errors flycheck-current-errors)
			    (let* ((fly-error (or .error 0))
				   (fly-warning (or .warning 0))
				   (fly-info (or .info )))
			      (concat
			       (propertize (format "✖ %s " fly-error) 'face 'error)
			       (propertize (format "⚠ %s" fly-warning 'face 'warning)))))
			(propertize "✔" 'face 'success)))
	   
	   (`running (propertize "⟲" 'face 'info))
	   (`no-checker (propertize "✖" 'face 'warning))
	   (`not-checked "☠" 'face 'error)
	   (`errored (propertize "⚠" 'face 'error))
	   (`interrupted "⛔ Interrupted")))))
    
    (defun insert-evil-mode ()
      "Evil mode."
      (format-mode-line '(:eval (format " %s " (evil-mode-line-tag)))))
    
    (defun insert-buffer-encoding ()
      "Display the encoding and eol style of the buffer the same way atom does."
      (propertize
       (concat (let ((sys (coding-system-plist buffer-file-coding-system)))
		 (cond ((memq (plist-get sys :category)
			      '(coding-category-undecided coding-category-utf-8))
			" UTF-8 ")
		       (t (upcase (symbol-name (plist-get sys :name))))))
	       (pcase (coding-system-eol-type buffer-file-coding-system)
		 (0 "LF")
		 (1 "RLF")
		 (2 "CR"))
	       " ")))
    
    (defun insert-major-mode ()
      "Major mode."
      (format-mode-line '(:eval (format " %s " (powerline-major-mode)))))))

(provide 'init-modeline)
