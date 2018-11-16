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

(setq package-enable-at-startup nil)

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(require 'init-const)
(require 'init-emacs)
(require 'init-package)

(require 'init-evil)
(require 'init-completion)
(require 'init-ivy)
(require 'init-project)
(require 'init-recentf)
(require 'init-directory)
(require 'init-flycheck)
(require 'init-vc)
(require 'init-others)
(require 'init-org)
(require 'init-calendar)
(require 'init-filetype)

(require 'server)
(unless (server-running-p)
  (server-start))

(provide 'init)

;;; init.el ends here

;; Local Variables:
;; coding: utf-8
;; no-byte-compile: t
;; End:
