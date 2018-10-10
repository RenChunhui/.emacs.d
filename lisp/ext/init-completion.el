;;; init-completion.el --- compl
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

(use-package company
  :ensure t
  :init
  (add-hook 'after-init-hook 'global-company-mode)
  :config (progn
	    (setq company-idle-delay 0.1)
	    (setq company-tooltip-limit 10)
	    (setq company-minimum-prefix-length 2)))

(use-package yasnippet
  :ensure t
  :init
  (setq yas-snippet-dirs
	'("~/.emacs.d/private/snippets"))
  (yas-global-mode 1)
  :config
  (yas-reload-all)
  (global-set-key (kbd "M-/") 'company-yasnippet))

(use-package which-key
  :ensure t
  :config
  (which-key-mode))


(provide 'init-completion)

;;; init-completion.el ends here
