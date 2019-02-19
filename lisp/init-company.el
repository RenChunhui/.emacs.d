;;; init-company.el --- company mode configuration
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

(use-package company
  :hook (after-init . global-company-mode)
  :init
  (progn
    (setq company-idle-delay 0.1
	  company-tooltip-limit 10
	  company-minimum-prefix-length 1)))

(use-package company-quickhelp
  :hook (global-company-mode . company-quickhelp-mode)
  :init
  (progn
    (setq company-quickhelp-delay 0.8
	  company-quickhelp-max-lines 10)))

(provide 'init-company)

;;; init-company.el ends here
