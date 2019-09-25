;;; init-gui.el --- gui configuration -*- coding: utf-8; lexical-binding: t -*-
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;;; Code:

(use-package doom-themes
  :ensure t
  :custom
  (doom-themes-org-config)
  :init
  (load-theme 'doom-one t))

(use-package dashboard
  :ensure t
  :diminish (dashboard-mode page-break-lines-mode)
  :init
  (progn
    (setq dashboard-center-content t
	  dashboard-set-heading-icons t
	  dashboard-set-file-icons t
	  dashboard-items '((recents . 5)
			    (projects . 5)
			    (agenda . 5))
	  dashboard-set-footer nil))
  :config
  (dashboard-setup-startup-hook))

(use-package winum
  :ensure t
  :init
  (setq winum-auto-setup-mode-line nil)
  :config
  (winum-mode))

(use-package powerline
  :ensure t
  :custom-face
  (html-face		((t (:background "#E44D26" :foreground "#FFF"))))
  (css-face		((t (:background "#ebebeb" :foreground "#FFF"))))
  (scss-face		((t (:background "#cd6799" :foreground "#FFF"))))
  (js-face		((t (:background "#f5de19" :foreground "#FFF"))))
  (ts-face		((t (:background "#007acc" :foreground "#FFF"))))
  (json-face		((t (:background "#f5de19" :foreground "#FFF"))))
  (yaml-face		((t (:background "#fbc02d" :foreground "#FFF"))))
  (org-face		((t (:background "#77AA99" :foreground "#FFF"))))
  (markdown-face	((t (:background "#755838" :foreground "#FFF"))))
  :init
  (setq powerline-default-separator 'utf-8)
  (defmacro diminish-major-mode (mode-hook abbrev)
    "Macro for diminish major mode with MODE-HOOK and ABBREV."
    `(add-hook ,mode-hook
	       (lambda () (setq mode-name ,abbrev))))

  (defun winum-unicode-number (str)
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
     ((string= "10" str) "➓")
     (t str)))

  ;;;###autoload
  (defpowerline powerline-custom-window-number
    (winum-unicode-number (winum-get-number-string)))
  
  ;;;###autoload
  (defun powerline-custom-theme ()
    "Custom mode line."
    (interactive)
    (setq-default mode-line-format
		  '("%e"
		    (:eval
		     (let* ((active (powerline-selected-window-active))
			    (mode-line-buffer-id (if active 'mode-line-buffer-id 'mode-line-buffer-id-inactive))
			    (mode-line (if active 'mode-line 'mode-line-inactive))
          (highlight-face (if active 'highlight 'active-strict))
			    (face0 (if active 'powerline-active0 'powerline-inactive0))
			    (face1 (if active 'powerline-active1 'powerline-inactive1))
			    (face2 (if active 'powerline-active2 'powerline-inactive2))
			    (separator-left (intern (format "powerline-%s-%s"
							    (powerline-current-separator)
							    (car powerline-default-separator-dir))))
			    (separator-right (intern (format "powerline-%s-%s"
							     (powerline-current-separator)
							     (cdr powerline-default-separator-dir))))
			    (lhs (list (powerline-raw " " highlight-face)
				       (powerline-custom-window-number highlight-face)
				       (powerline-raw " " highlight-face)
				       (funcall separator-left highlight-face face1)
				       (powerline-buffer-id face1)
				       (funcall separator-left face1 face0)
				       (powerline-vc)))
			    (rhs (list (powerline-raw global-mode-string)
				       (powerline-major-mode)
				       (powerline-raw " ")
				       (powerline-raw (replace-regexp-in-string  "%" "%%" (format-mode-line '(-3 "%p"))))
				       (powerline-raw " ")))
			    (center (list (powerline-raw " "))))
		       (concat (powerline-render lhs)
			       (powerline-fill-center mode-line (/ (powerline-width center) 2.0))
			       (powerline-render center)
			       (powerline-fill mode-line (powerline-width rhs))
			       (powerline-render rhs)))))))
  :config
  (powerline-custom-theme)
  (progn
    (diminish-major-mode	'text-mode-hook		(propertize "Text"))
    (diminish-major-mode	'fundamental-mode-hook	(propertize " Fundamental "))
    (diminish-major-mode	'dashboard-mode-hook	(propertize " Dashboard "  'face '(:background "#672F14")))
    (diminish-major-mode	'emacs-lisp-mode-hook	(propertize " Emacs-Lisp " 'face '(:background "#A52ECB")))
    (diminish-major-mode	'org-mode-hook		(propertize " Org-mode "   'face 'org-face))
    (diminish-major-mode	'web-mode-hook		(propertize " HTML "       'face 'html-face))
    (diminish-major-mode	'css-mode-hook		(propertize " CSS "        'face 'css-face))
    (diminish-major-mode	'scss-mode-hook		(propertize " Sass "       'face 'scss-face))
    (diminish-major-mode	'js2-mode-hook		(propertize " JavaScript " 'face 'javaScript-face))
    (diminish-major-mode	'typescript-mode-hook	(propertize " TypeScript " 'face 'typescript-face))
    (diminish-major-mode	'tide-mode-hook		(propertize " TypeScript " 'face 'typescript-face))
    (diminish-major-mode	'json-mode-hook		(propertize " JSON "       'face 'json-face))
    (diminish-major-mode	'yaml-mode-hook		(propertize " YAML "       'face 'yaml-face))
    (diminish-major-mode	'markdown-mode-hook	(propertize " Markdown "   'face 'markdown-face))))

(provide 'init-gui)

;;; init-gui.el ends here
