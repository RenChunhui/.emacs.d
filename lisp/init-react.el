;; init-react.el --- react.js framework

;;; Commentary:
;;; Code:

(use-package rjsx-mode
  :ensure t
  :mode (("\.jsx\\'" . rjsx-mode)
	 ("\\index.androiid.js\\'" . rjsx-mode)
	 ("\\index.ios.js\\'" . rjsx-mode))
  :magic (("^import React" . rjsx-mode)
	  ("/\\*\\* @jsx React\\.DOM \\*/" . rjsx-mode)))

(provide 'init-react)

;;; init-react.el ends here
