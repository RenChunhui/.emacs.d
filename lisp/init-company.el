;;; init-company.el --- company mode configuration -*- lexical-binding: t -*-
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
  :diminish company-mode
  :config
  (progn
    (setq company-idle-delay 0.1
	  company-show-numbers t
	  company-tooltip-limit 10
	  company-minimum-prefix-length 1)))

(provide 'init-company)

;;; init-company.el ends here
