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

(use-package yasnippet
  :hook ((emacs-lisp-mode . yas-minor-mode)
	 (js2-mode . yas-minor-mode)
	 (web-mode . yas-minor-mode)
	 (css-mode . yas-minor-mode)
	 (scss-mode . yas-minor-mode)
	 (tide-mode . yas-minor-mode)
	 (typescript-mode . yas-minor-mode))
  :diminish yas-minor-mode
  :init
  (setq yas-snippet-dirs '("~/.emacs.d/private/snippets"))
  :config
  (yas-reload-all)
  (global-set-key (kbd "M-/") 'company-yasnippet))

(provide 'init-yasnippet)

;;; init-yasnippet.el ends here