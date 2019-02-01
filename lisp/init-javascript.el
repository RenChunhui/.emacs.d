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

(use-package js-doc
  :config
  (progn
    (setq js-doc-mail-address "renchunhui2008@gmail.com"
	  js-doc-author (format "Ren Chunhui <%s>" js-doc-mail-address)
	  js-doc-url "http://renchunhui.github.io"
	  js-doc-license "MIT License")))

(provide 'init-javascript)
