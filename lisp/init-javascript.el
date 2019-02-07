(use-package js2-mode
  :mode ("\\.js\\'" . js2-mode)
  :hook (js2-mode . js2-imenu-extras-mode))

(use-package tern
  :init
  (setq tern-command '("/usr/local/bin/tern" "--no-port-file"))
  :config
  (add-hook 'js2-mode-hook (lambda ()
			     (tern-mode)
			     (company-mode))))

(use-package company-tern
  :config (progn
	    (add-to-list 'company-backends 'company-tern)
	    (setq company-tern-meta-as-single-line t)
	    (setq company-tooltip-align-annotations t)))

(provide 'init-javascript)
