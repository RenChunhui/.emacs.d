;;; core-load-paths.el --- paths configuration
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

(defun add-to-load-path (dir) (add-to-list 'load-path dir))

(defconst tea-emacs-core-directory
  (expand-file-name (concat user-emacs-directory "core/"))
  "Emacs core directory.")

(defconst tea-emacs-lisp-directory
  (expand-file-name (concat user-emacs-directory "lisp/"))
  "Emacs lisp directory.")

(defconst tea-emacs-cache-directory
  (expand-file-name (concat user-emacs-directory ".cache/"))
  "Emacs cache directory.")

;; load paths
(mapc 'add-to-load-path
      `(
        ,tea-emacs-core-directory
        ,(concat tea-emacs-core-directory "vendor/")
        ,tea-emacs-lisp-directory
        ,tea-emacs-cache-directory
        ))

;; themes
(add-to-list 'custom-theme-load-path "~/.emacs.d/core/themes")
(load-theme 'dracula t)

(provide 'core-load-path)

;;; core-load-paths.el ends here
