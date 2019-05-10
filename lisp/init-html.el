;;; init-html.el --- html langulage configuration -*- lexical-binding: t -*-
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

(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))

(eval-after-load 'web-mode
  '(progn
     ;; make org-mode export fail, I use evil and evil-matchit
     ;; to select text, so expand-region.el is not used
     (remove-hook 'web-mode-hook 'er/add-web-mode-expansions)
     (setq web-mode-enable-auto-closing t) ; enable auto close tag in text-mode
     (setq web-mode-enable-auto-pairing t)
     (setq web-mode-enable-css-colorization t)
     (setq web-mode-imenu-regexp-list
           '(("<\\(h[1-9]\\)\\([^>]*\\)>\\([^<]*\\)" 1 3 ">" nil)
             ("^[ \t]*<\\([@a-z]+\\)[^>]*>? *$" 1 " id=\"\\([a-zA-Z0-9_]+\\)\"" "#" ">")
             ("^[ \t]*<\\(@[a-z.]+\\)[^>]*>? *$" 1 " contentId=\"\\([a-zA-Z0-9_]+\\)\"" "=" ">")
             ;; angular imenu
             (" \\(ng-[a-z]*\\)=\"\\([^\"]+\\)" 1 2 "=")))))

(provide 'init-html)

;;; init-html.el ends here
