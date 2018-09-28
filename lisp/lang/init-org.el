;;; init-org.el --- org mode
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

(use-package org
  :defer t
  :config
  (evil-leader/set-key
    "a" 'org-agenda
    "c" 'org-capture
    "dd" 'org-deadline
    "ds" 'org-schedule
    "dt" 'org-time-stamp))

(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda ()
			     (org-bullets-mode 1))))

(provide 'init-org)

;;; init-org.el ends here
