(use-package css-mode
  :ensure t
  :mode ("\\.css\\'" . css-mode))

(use-package scss-mode
  :ensure t
  :mode (("\\.scss\\'" . scss-mode)
	 ("\\.postcss\\'" . scss-mode)))

(provide 'init-css) 
