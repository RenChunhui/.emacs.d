;; init.el --- My personal Emacs configuration.
;;
;; Copyright (c) 2018
;;
;; Author  : Chunhui Ren <renchunhui2008@gmail.com>
;; Repo    : https://github.com/RenChunhui/.emacs.d
;;
;; License: GPLv3
;;

(package-initialize)

(load-file (concat (file-name-directory load-file-name)
		   "core/core-path.el"))

(require 'core-emacs)

(require 'init-html)

