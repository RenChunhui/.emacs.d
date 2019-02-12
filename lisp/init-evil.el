;;; init-evil.el --- evil configuration
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

(require 'evil)
(require 'evil-leader)

(evil-leader/set-leader "<SPC>")

(add-hook 'after-init-hook 'evil-mode)
(add-hook 'after-init-hook 'global-evil-leader-mode)

(provide 'init-evil)

;;; init-evil.el ends here
