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

(provide 'init-js)
