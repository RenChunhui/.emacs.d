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

(load-file (concat (file-name-directory load-file-name) 
                    "core/core-load-paths.el"))

(require 'core-config)
(require 'core-emacs)

(require 'server)
(unless (server-running-p)
  (server-start))

(provide 'init)

;;; init.el ends here
