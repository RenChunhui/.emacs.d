;;; init-modeline.el --- modeline configuration -*- lexical-binding: t -*-
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

(defmacro diminish-major-mode (mode-hook abbrev)
  "Macro for diminish major mode with MODE-HOOK and ABBREV."
  `(add-hook ,mode-hook
             (lambda () (setq mode-name ,abbrev))))

(diminish-major-mode 'text-mode-hook (propertize "Text"))
(diminish-major-mode 'fundamental-mode-hook (propertize "Fundamental"))
(diminish-major-mode 'dashboard-mode-hook (propertize " Dashboard " 'face '(:background "#672F14")))
(diminish-major-mode 'emacs-lisp-mode-hook (propertize " Emacs-Lisp " 'face '(:background "#A52ECB")))
(diminish-major-mode 'org-mode-hook (propertize " Org-mode " 'face '(:background "#77AA99")))
(diminish-major-mode 'web-mode-hook (propertize " HTML " 'face '(:background "#E44D26")))
(diminish-major-mode 'css-mode-hook (propertize " CSS " 'face '(:background "#ebebeb")))
(diminish-major-mode 'scss-mode-hook (propertize " Sass " 'face '(:background "#cd6799")))
(diminish-major-mode 'js2-mode-hook (propertize " JavaScript " 'face '(:background "#f5de19")))
(diminish-major-mode 'typescript-mode-hook (propertize " TypeScript " 'face '(:background "#007acc")))
(diminish-major-mode 'tide-mode-hook (propertize " TypeScript " 'face '(:background "#007acc")))
(diminish-major-mode 'json-mode-hook (propertize " JSON " 'face '(:background "#f5de19")))
(diminish-major-mode 'yaml-mode-hook (propertize " YAML " 'face '(:background "#fbc02d")))
(diminish-major-mode 'markdown-mode-hook (propertize " Markdown " 'face '(:background "#755838")))

(defpowerline replace-flycheck
  (powerline-raw
   (format-mode-line
    '(:eval
      (pcase flycheck-last-status-change
	(`finished (if flycheck-current-errors
		       (let-alist (flycheck-count-errors flycheck-current-errors)
			 (let* ((fly-error (or .error 0))
				(fly-warning (or .warning 0))
				(fly-info (or .info )))
			   (concat
			    (propertize (format "✖ %s" fly-error) 'face 'error)
			    (propertize (format " ⚠ %s" fly-warning 'face 'warning)))))
		     (propertize "✔" 'face 'success)))
	
	(`running (propertize "⟲" 'face 'info))
	(`no-checker (propertize "☣" 'face 'warning))
	(`not-checked "☠" 'face 'error)
	(`errored (propertize "⚠" 'face 'error))
	(`interrupted "⛔ Interrupted"))))))

(defun replace-buffer-encoding ()
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

;;;###autoload
(defun powerline-mini-theme ()
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
					   
					   (separator-left (intern (format "powerline-%s-%s"
									   (powerline-current-separator)
									   (car powerline-default-separator-dir))))
					   (separator-right (intern (format "powerline-%s-%s"
									    (powerline-current-separator)
									    (cdr powerline-default-separator-dir))))
					   ;; left
					   (lhs (list (powerline-raw (format-mode-line '(:eval (format " %s " (winum-get-number-string)))) face2)
						      (powerline-raw evil-mode-line-tag)
						      (powerline-raw " %b " mode-line)
						      (replace-flycheck)))
					   ;; center
					   (center (list (powerline-vc)))
					   ;; right
					   (rhs (list (powerline-raw (replace-buffer-encoding))
						      (powerline-major-mode)
						      (powerline-raw " " mode-line)
						      (powerline-raw (replace-regexp-in-string  "%" "%%" (format-mode-line '(-3 "%p"))))
									(powerline-raw " " mode-line)
						      )))
				      
				      (concat (powerline-render lhs)
					      (powerline-fill-center mode-line (/ (powerline-width center) 2.0))
					      (powerline-render center)
					      (powerline-fill mode-line (powerline-width rhs))
					      (powerline-render rhs)))))))

(use-package winum
  :config
  (progn
    (winum-mode)))

(use-package powerline
  :init
  (setq powerline-default-separator 'nil)
  (powerline-mini-theme))

(provide 'init-modeline)

;;; init-modeline.el ends here