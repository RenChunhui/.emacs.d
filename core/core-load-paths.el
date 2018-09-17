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

(add-to-list 'load-path (expand-file-name "core" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "core/gnus" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "lisp/plugins" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "lisp/lang" user-emacs-directory))

(add-to-list 'custom-theme-load-path (expand-file-name "private/themes" user-emacs-directory))

;;; core-load-path.el ends here
