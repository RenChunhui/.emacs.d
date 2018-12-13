;;; init-flycheck.el --- flyche
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

(require 'flycheck)

(add-hook 'after-init-hook 'global-flycheck-mode)

(set-face-attribute 'flycheck-warning nil
                    :background theme-warning
                    :foreground "#262626"
                    :underline nil)

(set-face-attribute 'flycheck-error nil
                    :background theme-error
                    :foreground "#262626"
                    :underline nil)

(provide 'init-flycheck)

;;; init-flycheck.el ends here
