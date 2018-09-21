;;; init-javascript.el --- javascript mode
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

(use-package js2-mode
  :ensure t
  :mode ("\\.js\\'" . js2-mode)
  :hook (js2-mode . js2-imenu-extras-mode))

(use-package tern
  :ensure t
  :init
  (setq tern-command '("/usr/local/bin/tern" "--no-port-file"))
  :config
  (add-hook 'js2-mode-hook (lambda ()
			     (tern-mode)
			     (company-mode))))

(use-package company-tern
  :ensure t
  :config (progn
	    (add-to-list 'company-backends 'company-tern)
	    (setq company-tern-meta-as-single-line t)
	    (setq company-tooltip-align-annotations t)))

(use-package lsp-javascript-typescript
  :ensure t
  :ensure-system-package
  (javascript-typescript-langserver . "yarn global add javascript-typescript-langserver")
  :commands lsp-javascript-typescript-server
  :init
  (progn
    (add-hook 'js2-mode #'lsp-javascript-typescript-enable)))

(provide 'init-javascript)

;;; init-javascript.el ends here
