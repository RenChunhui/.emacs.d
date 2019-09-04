;;; init-vcs.el --- version control system configuration -*- coding: utf-8; lexical-binding: t -*-
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;;; Code:

(use-package magit
  :ensure t
  :diminish auto-revert-mode
  :bind (("C-x g" . magit-status)
	 ("C-x M-g" . magit-dispatch)))

(provide 'init-vcs)

;;; init-vcs.el ends here
