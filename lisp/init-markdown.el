(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode ("/README\\(?:\\.\\(?:markdown\\|md\\)\\)?\\'" . gfm-mode)
  :init
  (setq markdown-enable-wiki-links t
	markdown-italic-underscore t
	markdown-asymmetric-header t
	markdown-make-gfm-checkboxes-buttons t
	markdown-fontify-code-blocks-natively t
	markdown-hide-urls nil
	markdown-enable-math t
	markdown-gfm-uppercase-checkbox t))
    
(provide 'init-markdown)