;;; init-load-paths.el --- core paths
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
(defconst emacs-lisp-directory
  (expand-file-name (concat user-emacs-directory "lisp/"))
  "Emacs LISP directory.")

(defconst emacs-cache-directory
  (expand-file-name (concat user-emacs-directory ".cache/"))
  "Emacs storage area for persistent files")

;; load paths
(mapc 'add-to-load-path
      `(,emacs-lisp-directory
    ,(concat emacs-lisp-directory "config/")
    ,(concat emacs-lisp-directory "extensions/")
    ,(concat emacs-lisp-directory "languages/")
    ,(concat emacs-lisp-directory "vendor/")
    ,(concat emacs-lisp-directory "themes/")))

;; themes
(add-to-list 'custom-theme-load-path (concat emacs-lisp-directory
					     "themes/"))

(provide 'init-load-paths)

;;; core-load-paths.el ends here
