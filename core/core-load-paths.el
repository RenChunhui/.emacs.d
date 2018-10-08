;;; core-load-paths.el --- core paths
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

(defun add-to-load-path (dir)
  "Add DIR to folder."
  (add-to-list 'load-path dir))

;; paths
(defconst emacs-core-directory
  (expand-file-name (concat user-emacs-directory "core/"))
  "Emacs core directory.")
(defconst emacs-lisp-directory
  (expand-file-name (concat user-emacs-directory "lisp/"))
  "Emacs lisp directory.")

(defconst emacs-private-directory
  (expand-file-name (concat user-emacs-directory "private/"))
  "Emacs private directory.")

;; load paths
(mapc 'add-to-load-path
      `(,emacs-core-directory
    ,(concat emacs-core-directory "gnus/")
	,(concat emacs-core-directory "vendor/")
	,(concat emacs-core-directory "vendor/themes/")))

(mapc 'add-to-load-path
      `(,emacs-lisp-directory
    ,(concat emacs-lisp-directory "ext/")
	,(concat emacs-lisp-directory "lang/")))

;; themes
(add-to-list 'custom-theme-load-path (concat emacs-core-directory
					     "vendor/themes/"))

(provide 'core-load-paths)

;;; core-load-paths.el ends here
