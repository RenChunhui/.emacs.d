;;; init-modeline.el --- custom modeline configuration -*- coding: utf-8; lexical-binding: t -*-
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;;; Code:

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
  (winum-face		((t (:background "#755838" :foreground "#FFF"))))
  :init
  (defmacro diminish-major-mode (mode-hook abbrev)
    "Macro for diminish major mode with MODE-HOOK and ABBREV."
    `(add-hook ,mode-hook
	       (lambda () (setq mode-name ,abbrev))))
  (defun powerline-custom-theme ()
    "Custom powerline theme."
    (interactive))
  :config
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

(provide 'init-modeline)

;;; init-modeline.el ends here
