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

;; Produce backtraces when errors occur
(setq debug-on-error t)

(load-file (concat (file-name-directory load-file-name)
                    "core/core-load-paths.el"))
(load (concat (file-name-directory load-file-name) "core/core-functions"))

(require 'core-config)
(require 'core-keymap)
(require 'core-emacs)

;; Allow assets from emacsclient
(add-hook 'after-init-hook
	  (lambda ()
	    (require 'server)
	    (unless (server-running-p)
	      (server-start))))

(provide 'init)

;; Local Variables:
;; coding: utf-8
;; no-byte-compile: t
;; End:
;;; init.el ends here
