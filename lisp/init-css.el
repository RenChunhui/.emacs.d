(use-package css-mode
  :mode ("\\.css\\'" . css-mode))

(use-package scss-mode
  :mode (("\\.scss\\'" . scss-mode)
	 ("\\.postcss\\'" . scss-mode)))

(provide 'init-css) 
