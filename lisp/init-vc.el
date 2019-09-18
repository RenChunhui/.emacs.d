;;; init-vcs.el --- version control system configuration -*- coding: utf-8; lexical-binding: t -*-
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;;; Code:

(use-package magit
  :diminish auto-revert-mode
  :bind (("C-x g" . magit-status)
	 ("C-x M-g" . magit-dispatch)))

(provide 'init-vc)

;;; init-vc.el ends here
