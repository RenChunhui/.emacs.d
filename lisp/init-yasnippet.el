;;; init-yasnippet.el --- yasnippet configuration -*- lexical-binding: t -*-
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

(require 'yasnippet)

(setq yas-snippet-dirs '("~/.emacs.d/private/snippets"))

(add-hook 'emacs-lisp-mode-hook 'yas-minor-mode)
(add-hook 'js2-mode-hook 'yas-minor-mode)
(add-hook 'web-mode-hook 'yas-minor-mode)
(add-hook 'css-mode-hook 'yas-minor-mode)
(add-hook 'scss-mode-hook 'yas-minor-mode)
(add-hook 'tide-mode-hook 'yas-minor-mode)
(add-hook 'typescript-mode-hook 'yas-minor-mode)

(eval-after-load 'yasnippet
  '(progn
     (yas-reload-all)
     (global-set-key (kbd "M-/") 'company-yasnippet)))

(provide 'init-yasnippet)

;;; init-yasnippet.el ends here
