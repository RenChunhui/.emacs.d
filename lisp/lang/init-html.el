;;; init-html.el --- html mode
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

;;; init-html.el ends here
