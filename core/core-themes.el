;;; core-themes.el --- themes
;;
;; Copyright (c) 2018
;;
;; Author  : Chunhui Ren <renchunhui2008@gmail.com>
;; URL     : https://github.com/RenChunhui/.emacs.d
;; Version : 1.0.0

;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;;; Code:

(use-package zenburn-theme
  :ensure t)

(use-package color-theme-modern
  :ensure t)

(use-package base16-theme
  :ensure t)

(use-package atom-one-dark-theme
    :ensure t
    :config
    (load-theme 'atom-one-dark t))

(provide 'core-themes)

;;; core-themes ends here
