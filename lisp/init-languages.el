;;; init-languages.el --- languages configuration
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

;;----------------------------------------------------------------------------
;; HTML
;;----------------------------------------------------------------------------

(use-package web-mode
  :mode ("\\.html\\'" . web-mode)
  :init
  (setq web-mode-markup-indent-offset 2
	web-mode-css-indent-offset 2
	web-mode-style-padding 2
	web-mode-script-padding 2
	web-mode-code-indent-offset 2))

;;----------------------------------------------------------------------------
;; CSS
;;----------------------------------------------------------------------------

(use-package css-mode
  :mode ("\\.css\\'" . css-mode))

;;----------------------------------------------------------------------------
;; Scss
;;----------------------------------------------------------------------------

(use-package scss-mode
  :mode (("\\.scss\\'" . scss-mode)
	 ("\\.postcss\\'" . scss-mode)))

;;----------------------------------------------------------------------------
;; ECMAScript
;;----------------------------------------------------------------------------

(use-package js2-mode
  :mode ("\\.js\\'" . js2-mode)
  :hook (js2-mode . js2-imenu-extras-mode))

(use-package tern
  :init
  (setq tern-command '("/usr/local/bin/tern" "--no-port-file"))
  :config
  (add-hook 'js2-mode-hook (lambda ()
			     (tern-mode)
			     (company-mode))))

(use-package company-tern
  :config (progn
	    (add-to-list 'company-backends 'company-tern)
	    (setq company-tern-meta-as-single-line t)
	    (setq company-tooltip-align-annotations t)))

;;----------------------------------------------------------------------------
;; TypeScript
;;----------------------------------------------------------------------------

(use-package tide
  :after (typescript-mode company flycheck)
  :hook ((typescript-mode . tide-setup)
	 (typescript-mode . tide-hl-identifier-mode)
	 (before-save . tide-format-before-save)))

;;----------------------------------------------------------------------------
;; JSON
;;----------------------------------------------------------------------------

(use-package json-mode
  :mode ("\\.json\\'" . json-mode))

;;----------------------------------------------------------------------------
;; YAML
;;----------------------------------------------------------------------------

(use-package yaml-mode
  :mode (("\\.\\(yml\\|yaml\\)\\'" . yaml-mode)
	 ("Procfile\\'" . yaml-mode))
  :config (add-hook 'yaml-mode-hook
		    '(lambda ()
		       (define-key yaml-mode-map "\C-m" newline-and-indent))))

;;----------------------------------------------------------------------------
;; Markdown
;;----------------------------------------------------------------------------

(use-package markdown-mode
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
	 ("\\.md\\'" . markdown-mode))
  :init
  (setq markdown-command "multimarkdown"))

;;----------------------------------------------------------------------------
;; ORG
;;----------------------------------------------------------------------------

(use-package org
  :defer t
  :config
  (evil-leader/set-key
    "oa" 'org-agenda
    "oc" 'org-capture

    ;; "dd" 'org-deadline
    ;; "ds" 'org-schedule
    ;; "dt" 'org-time-stamp
    ;; "dT" 'org-time-stamp-inactive
    ;; "ee" 'org-export-dispatch
    ;; "fi" 'org-feed-goto-inbox
    ;; "fu" 'org-feed-update-all

    ;; "Cc" 'org-clock-cancel
    ;; "Cd" 'org-clock-display
    ;; "Ce" 'org-evaluate-time-range
    ;; "Cg" 'org-clock-goto
    ;; "Ci" 'org-clock-in
    ;; "CI" 'org-clock-in-last
    ;; "Cj" 'org-clock-jump-to-current-clock
    ;; "Co" 'org-clock-out
    ;; "CR" 'org-clock-report
    ;; "Cr" 'org-resolve-clocks

    ;; "Tc" 'org-toggle-checkbox
    ;; "Te" 'org-toggle-pretty-entities
    ;; "Ti" 'org-toggle-inline-images
    ;; "Tl" 'org-toggle-link-display
    ;; "Tt" 'org-show-todo-tree
    ;; "TT" 'org-todo

    ;; "L" 'org-shiftright
    ;; "H" 'org-shiftleft
    ;; "J" 'org-shiftdown
    ;; "K" 'org-shiftup

    ;; ":" 'org-set-tags)
  ))

(use-package org-bullets
  :config
  (add-hook 'org-mode-hook (lambda ()
			     (org-bullets-mode 1))))

;;----------------------------------------------------------------------------
;; Shell
;;----------------------------------------------------------------------------

(setq shell-file-name "/bin/zsh")
(add-to-list 'auto-mode-alist '("\\.zsh$" . shell-script-mode))

;;----------------------------------------------------------------------------
;; Vim
;;----------------------------------------------------------------------------

(use-package vimrc-mode
  :mode "\\.vim[rc]?\\'")

(provide 'init-languages)

;;; init-languages.el ends here
