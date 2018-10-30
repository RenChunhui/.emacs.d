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

(require 'package)

(setq package-user-dir "~/.emacs.d/.cache/elpa")
(setq package-enable-at-startup nil)

;; Initialize use-package
(setq package-archives '(("melpa-cn" . "http://elpa.emacs-china.org/melpa/")
                         ("org-cn"   . "http://elpa.emacs-china.org/org/")
                         ("gnu-cn"   . "http://elpa.emacs-china.org/gnu/")))

(package-initialize)

;; No backup file
(setq-default make-backup-files nil)

;; Stop Emacs from useing init.el for customization code
(setq custom-file
      (concat user-emacs-directory "custom.el"))

;; Bootstrap config
(load-file (concat (file-name-directory load-file-name)
		   "lisp/init-load-paths.el"))

(require 'init-status-bar)
(require 'init-org)
(require 'init-calendar)

(require 'init-config)
(require 'init-complete)
(require 'init-evil)
(require 'init-ivy)
(require 'init-cache)
(require 'init-chinese)
(require 'init-editor)
(require 'init-filetree)
(require 'init-flycheck)
(require 'init-projectile)

(require 'init-html)
(require 'init-css)
(require 'init-scss)
(require 'init-javascript)
(require 'init-typescript)
(require 'init-json)
(require 'init-yaml)
(require 'init-org)
(require 'init-markdown)
(require 'init-shell)

(require 'server)
(unless (server-running-p)
  (server-start))

(provide 'init)

;;; init.el ends here

;; Local Variables:
;; coding: utf-8
;; no-byte-compile: t
;; End:
