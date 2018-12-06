;;; init.el --- core paths
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

(defconst tea-emacs-version "1.0.0" "Coffee Emacs version.")
(defconst tea-emacs-min-version "26.1" "Minimal version of Emacs.")

(add-to-list 'load-path (expand-file-name "core" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "core/themes/" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
;; themes
(add-to-list 'custom-theme-load-path (expand-file-name "core/themes/" user-emacs-directory))

(require 'core-emacs)
(emacs/init)

(require 'server)
(unless (server-running-p)
  (server-start))

(provide 'init)

;;; init.el ends here
