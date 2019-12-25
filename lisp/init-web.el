;;; init-web.el --- web configuration -*- coding: utf-8; lexical-binding: t -*-
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;;; Code:

(use-package web-mode
  :ensure t
  :mode ("\\.html\\'" . web-mode)
  :defer t
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
  :defer t
  :mode ("\\.css\\'" . css-mode))

(use-package scss-mode
  :ensure t
  :defer t
  :mode (("\\.scss\\'" . scss-mode)
	 ("\\.postcss\\'" . scss-mode)))

(use-package typescript-mode
  :ensure t
  :mode "\\.ts$")

(use-package tide
  :ensure t
  :after (typescript-mode company flycheck)
  :hook ((typescript-mode . tide-setup)
         (typescript-mode . tide-hl-identifier-mode)
         (before-save . tide-format-before-save))
  :init
  (progn
    (setq tide-tsserver-executable "/usr/local/bin/tsserver")))
           
(provide 'init-web)

;;; init-web.el ends here
