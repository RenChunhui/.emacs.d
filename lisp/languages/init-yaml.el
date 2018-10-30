;;; init-yaml.el --- yaml mode configuration
;;
;; Copyright (c) 2018 Chunhui Ren
;;
;; Author  : Chunhui Ren <renchunhui2008@gmail.com>
;; URL     : https://github.com/RenChunhui/.emacs.d
;; Version : 1.0.0
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;;; Code:

(use-package yaml-mode
  :mode (("\\.\\(yml\\|yaml\\)\\'" . yaml-mode)
	 ("Procfile\\'" . yaml-mode))
  :config (add-hook 'yaml-mode-hook
		    '(lambda ()
		       (define-key yaml-mode-map "\C-m" newline-and-indent))))

(provide 'init-yaml)

;;; init-yaml.el ends here
