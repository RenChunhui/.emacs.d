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

(use-package lsp-mode
  :ensure t
  :init
  (add-hook 'prog-major-mode 'lsp-mode))

(use-package lsp-ui
  :ensure t
  :after lsp-mode
  :init
  (progn
    (add-hook 'lsp-mode-hook 'lsp-ui-mode)
    (progn
      (require 'lsp-ui-flycheck)))
  :config
  (setq lsp-ui-sideline-enable t
	lsp-ui-sideline-show-symbol t
	lsp-ui-sideline-show-hover t
	lsp-ui-sideline-show-code-actions t))

(use-package company-lsp
  :ensure t
  :after lsp-mode company
  :config
  (push 'company-lsp company-backends))

(use-package which-key
  :ensure t
  :config
  (which-key-mode))


(provide 'init-completion)

;;; init-completion.el ends here
