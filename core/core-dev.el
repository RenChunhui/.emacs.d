(use-package web-mode
  :ensure t
  :mode ("\\.html\\'" . web-mode)
  :init
  (setq web-mode-markup-indent-offset 2
	web-mode-css-indent-offset 2
	web-mode-style-padding 2
	web-mode-script-padding 2
	web-mode-code-indent-offset 2))

(use-package css-mode
  :ensure t
  :mode ("\\.css\\'" . css-mode))

(use-package scss-mode
  :ensure t
  :mode (("\\.scss\\'" . scss-mode)
	 ("\\.postcss\\'" . scss-mode)))

(use-package js2-mode
  :ensure t
  :mode ("\\.js\\'" . js2-mode))

(use-package tern
  :ensure t
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

(use-package json-mode
  :ensure t
  :mode ("\\.json\\'" . json-mode))

(use-package yaml-mode
  :mode (("\\.\\(yml\\|yaml\\)\\'" . yaml-mode)
	 ("Procfile\\'" . yaml-mode))
  :config (add-hook 'yaml-mode-hook
		    '(lambda ()
		       (define-key yaml-mode-map "\C-m" newline-and-indent))))

(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(provide 'core-dev)
