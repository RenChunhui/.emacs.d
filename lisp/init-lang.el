;;; init-lang.el --- langulages configuration -*- lexical-binding: t -*-
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

(use-package web-mode
  :ensure t
  :mode ("\\.html\\'" . web-mode)
  :config
  (progn
    (setq web-mode-markup-indent-offset 2
	  web-mode-css-indent-offset 2
	  web-mode-code-indent-offset 2
	  web-mode-enable-auto-closing t
	  web-mode-enable-auto-pairing t
	  web-mode-enable-current-element-higlight t)))

(use-package css-mode
  :ensure t
  :mode ("\\.css\\'" . css-mode))

(use-package scss-mode
  :ensure t
  :mode (("\\.scss\\'" . scss-mode)
	 ("\\.postcss\\'" . scss-mode)))

(use-package typescript-mode
  :ensure t
  :mode "\\.ts$")

(use-package tide
  :ensure t
  :after (typescript-mode company)
  :hook ((typescript-mode . tide-setup)
	 (typescript-mode . tide-hl-identifier-mode)
	 (before-save . tide-format-before-save))
  :init
  (progn
    (setq tide-tsserver-executable "/usr/local/bin/tsserver")))

(use-package json-mode
  :ensure t
  :mode ("\\.json\\'" . json-mode))

(use-package yaml-mode
  :ensure t
  :mode (("\\.\\(yml\\|yaml\\)\\'" . yaml-mode)
	 ("Procfile\\'" . yaml-mode))
  :config (add-hook 'yaml-mode-hook
		    '(lambda ()
		       (define-key yaml-mode-map "\C-m" newline-and-indent))))

(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
	 ("\\.md\\'" . markdown-mode))
  :init
  (setq markdown-command "multimarkdown"))
  
(provide 'init-lang)

;;; init-lang.el ends here