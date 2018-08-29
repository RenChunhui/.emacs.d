(use-package web-mode
  :ensure t
  :mode ("\\.html\\'" . web-mode)
  :init
  (setq web-mode-markup-indent-offset 2
	web-mode-css-indent-offset 2
	web-mode-style-padding 2
	web-mode-script-padding 2
	web-mode-code-indent-offset 2))
    
(provide 'init-html)