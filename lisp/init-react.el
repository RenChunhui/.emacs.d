;; init-react.el --- react.js framework

;;; Commentary:
;;; Code:

(use-package rjsx-mode
  :ensure t
  :mode (("\.jsx\\'" . rjsx-mode)
	 ("\\index.androiid.js\\'" . rjsx-mode)
	 ("\\index.ios.js\\'" . rjsx-mode))
  :magic (("^import React" . rjsx-mode)
	  ("/\\*\\* @jsx React\\.DOM \\*/" . rjsx-mode))
  :config
  (add-hook 'rjsx-mode-hook
	    (lambda ()
	      (setq indent-tabs-mode nil)
	      (setq js-indent-level 2)
	      (setq js2-strict-missing-semi-warning nil))))

(provide 'init-react)

;;; init-react.el ends here
