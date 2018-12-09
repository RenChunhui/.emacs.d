;;; init-project.el --- project configuration
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

(use-package projectile
  :ensure t
  :defer 2
  :init
  (progn
    (setq projectile-sort-order 'recentf
	  projectile-cache-file (concat tea-emacs-cache-directory "projectile.cache")
	  projectile-known-projects-file (concat tea-emacs-cache-directory "projectile-bookmarks.eld")))
  :config
  (projectile-mode)
  (setq projectile-completion-system 'ivy))

(provide 'init-project)

;;; init-project.el ends here
