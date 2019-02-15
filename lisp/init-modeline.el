

(defmacro diminish-major-mode (mode-hook abbrev)
  "Macro for diminish major mode with MODE-HOOK and ABBREV."
  `(add-hook ,mode-hook
             (lambda () (setq mode-name ,abbrev))))

(diminish-major-mode 'text-mode-hook (propertize "\x612"))
(diminish-major-mode 'fundamental-mode-hook "\xe926")
(diminish-major-mode 'emacs-lisp-mode-hook (propertize " \xe926 " 'face '(:background "#A52ECB")))
(diminish-major-mode 'lisp-interaction-mode-hook (propertize " \xe612 " 'face '(:background "#A52ECB")))
(diminish-major-mode 'org-mode-hook (propertize " \xe917 " 'face '(:background "#77AA99")))
(diminish-major-mode 'web-mode-hook (propertize " \xf81c " 'face '(:background "#E44D26")))
(diminish-major-mode 'css-mode-hook (propertize " \xe749 " 'face '(:background "#ebebeb")))
(diminish-major-mode 'scss-mode-hook (propertize " \xe603 " 'face '(:background "#cd6799")))
(diminish-major-mode 'js2-mode-hook (propertize " \xe74e " 'face '(:background "#f5de19")))
(diminish-major-mode 'typescript-mode-hook (propertize " \xe628 " 'face '(:background "#007acc")))
(diminish-major-mode 'tide-mode-hook (propertize " \xe628 " 'face '(:background "#007acc")))
(diminish-major-mode 'json-mode-hook (propertize " \xe60b " 'face '(:background "#f5de19")))
(diminish-major-mode 'yaml-mode-hook (propertize " \xe612 " 'face '(:background "#fbc02d")))
(diminish-major-mode 'markdown-mode-hook (propertize " \xf853 " 'face '(:background "#755838")))

(defpowerline replace-vc-mode
  (when vc-mode
    (powerline-raw
     (format-mode-line
      (cond
       ((string-match "Git[:-]" vc-mode)
	(let ((branch (mapconcat 'concat (cdr (split-string vc-mode "[:-]")) "-")))
	  (concat
	   (propertize "" 'face `(:height 1.2) 'display '(raise -0.1))
	   (propertize (format " %s " branch) 'face `(:height 0.9)))))
       (t (format "%s" vc-mode)))))))

(defpowerline replace-flycheck
  (powerline-raw
   (format-mode-line
    '(:eval
      (pcase flycheck-last-status-change
	(`finished (if flycheck-current-errors
		       (let ((count (let-alist (flycheck-count-errors flycheck-current-errors)
				      (+ (or .warning 0) (or .error 0)))))
			 (propertize (format "✖ %s Issue%s" count (if (eq 1 count) "" "s"))))
		     (propertize "✔ No Issues")))
	(`running (propertize "⟲ Running..."))
	(`no-checker (propertize "⚠ No Checker"))
	(`not-checked "✖ Disabled")
	(`errored (propertize "⚠ Error"))
	(`interrupted "⛔ Interrupted"))))))

(defun replace-buffer-encoding ()
  "Display the encoding and eol style of the buffer the same way atom does."
  (propertize
   (concat (pcase (coding-system-eol-type buffer-file-coding-system)
	     (0 " LF")
	     (1 " RLF")
	     (2 " CR"))
	   (let ((sys (coding-system-plist buffer-file-coding-system)))
	     (cond ((memq (plist-get sys :category)
			  '(coding-category-undecided coding-category-utf-8))
		    " UTF-8 ")
		   (t (upcase (symbol-name (plist-get sys :name))))))
	   " ")))

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

			  ;; left
                          (lhs (list (powerline-raw " " face1)
				     (powerline-raw (format-mode-line '(:eval (format "%s" (winum-get-number-string)))) face1)
                                     (powerline-raw " " face1)
                                     (let ((evil-face (powerline-evil-face)))
                                       (if evil-mode
                                           (powerline-raw (powerline-evil-tag) evil-face)))
				     (powerline-raw " %b ")
                                     (powerline-major-mode)
				     (powerline-raw " " mode-line)
                                     (when (and (boundp 'vc-mode) vc-mode)
                                       (replace-vc-mode))
                                     
                                     (powerline-raw " " mode-line)
                                     (replace-flycheck)
                                     (powerline-raw " " mode-line)

                                     (when (boundp 'erc-modified-channels-object)
                                       (powerline-raw erc-modified-channels-object face1 'l))

				     ))

			  ;; right
                          (rhs (list (powerline-raw (format-mode-line '(:eval (propertize (format-time-string " %H:%M")))))
                                     (powerline-raw " " mode-line)
                                     
                                     (powerline-raw " " mode-line)
                                     (powerline-raw "%l:%c " mode-line)
                                     
				     (powerline-raw (replace-buffer-encoding))
				     (powerline-raw " " face2)
                                     (powerline-raw (replace-regexp-in-string  "%" "%%" (format-mode-line '(-3 "%p"))) face2 'r))))
		     
                     (concat (powerline-render lhs)
                             (powerline-fill mode-line (powerline-width rhs))
                             (powerline-render rhs)))))))

(use-package diminish
  :after (editorconfig company)
  :diminish company-mode
  :diminish counsel-mode
  :diminish evil-org-mode
  :diminish editorconfig-mode
  :diminish eldoc-mode
  :diminish flycheck-mode
  :diminish ivy-mode
  :diminish projectile-mode
  :diminish undo-tree-mode
  :diminish which-key-mode
  :diminish yas-minor-mode)

(use-package powerline
  :init
  (setq powerline-default-separator 'slant)
  (powerline-custom-theme))

(provide 'init-modeline)
