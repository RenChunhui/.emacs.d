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
  :ensure t
  :hook (emacs-startup . global-company-mode)
  :init
  (progn
    (setq company-idle-delay 0.1
	  company-show-numbers nil
	  company-tooltip-limit 10
	  company-minimum-prefix-length 1)))

(when *quickhelp-enable*
  (use-package company-quickhelp
    :ensure t
    :after (company)
    :commands (company-quickhelp-manual-begin)
    :config
    (company-quickhelp-mode)))

(provide 'init-completion)

;;; init-completion.el ends here
