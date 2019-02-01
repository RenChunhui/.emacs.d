(use-package web-mode
  :mode ("\\.html\\'" . web-mode)
  :init
  (progn
    (setq web-mode-markup-indent-offset 2
	  web-mode-css-indent-offset 2
	  web-mode-code-indent-offset 2)))

(provide 'init-html)
