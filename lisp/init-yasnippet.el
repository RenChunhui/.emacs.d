;;; init-yasnippet.el --- yasnippet configuration
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
  :init
  (setq yas-snippet-dirs '("~/.emacs.d/private/snippets"))
  (dolist (hook (list 'emacs-lisp-mode-hook
		      'js2-mode-hook
		      'web-mode-hook
		      'css-mode-hook
		      'tide-mode-hook
		      'typescript-mode-hook))
    (add-hook hook '(lambda () (yas-minor-mode 1))))
  :config
  (yas-reload-all)
  (global-set-key (kbd "M-/") 'company-yasnippet))

(provide 'init-yasnippet)

;;; init-yasnippet.el ends here
