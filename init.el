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

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
; (package-initialize)

(require 'package)
(setq package-enable-at-startup nil)

;; Stop Emacs from useing init.el for customization code
(setq custom-file
      (concat user-emacs-directory "custom.el"))

;; Increase the garbage collection threshold to 128 MB to ease startup
(setq gc-cons-threshold (* 128 1024 1024)
      gc-cons-percentage 0.9)

;; No backup file
(setq-default make-backup-files nil)

  ;; Warn when opening files bigger then 10MB
(setq large-file-warning-threshold 10000000)

;; Turn on debugging and turn off after init
(setq debug-on-error t)
(add-hook 'after-init-hook (lambda ()
			     (setq debug-on-error nil)))

;; Initialize use-package
(setq package-archives '(("melpa-cn" . "http://elpa.emacs-china.org/melpa/")
                         ("org-cn"   . "http://elpa.emacs-china.org/org/")
                         ("gnu-cn"   . "http://elpa.emacs-china.org/gnu/")))

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
  
;; Bootstrap config
(load-file (concat (file-name-directory load-file-name)
		   "core/core-load-paths.el"))

(require 'core-emacs)

(require 'server)
(unless (server-running-p)
  (server-start))

(provide 'init)

;;; init.el ends here

;; Local Variables:
;; coding: utf-8
;; no-byte-compile: t
;; End:
