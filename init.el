;;; init.el --- core paths

;; Copyright (c) 2018 Chunhui Ren

;; Author  : Chunhui Ren <renchunhui2008@gmail.com>
;; URL     : https://github.com/RenChunhui/.emacs.d
;; Version : 1.0.0

;; This file is not part of GNU Emacs.

;;; License: GPLv3

;;; Commentary:

;;; Code:

;; Increase the garbage collection threshold to 128 MB to ease startup
(setq gc-cons-threshold (* 128 1024 1024))

(load-file (concat (file-name-directory load-file-name)
		   "core/core-load-paths.el"))
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

(require 'core-emacs)

(require 'server)
(unless (server-running-p)
  (server-start))

(provide 'init)
;;; init.el ends here
