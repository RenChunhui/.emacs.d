;;; init-values.el --- set values -*- lexical-binding: t -*-
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

(defconst tea-emacs-cache-directory
  (expand-file-name (concat user-emacs-directory ".cache/"))
  "Emacs cache directory.")

(defconst emacs-start-time (current-time))

(defvar tea-emacs-startup-time nil
  "Eemacs full startup duration.")

(defvar tea-emacs-startup-buffer-responsive t
  "Not nil if the home buffer should respond to resize events.")

(provide 'init-values)

;;; init-values.el ends here
