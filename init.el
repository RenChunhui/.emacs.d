;;; init.el --- Personal configuration entry point.
;;
;; Copyright (c) 2018
;;
;; Author  : Chunhui Ren <renchunhui2008@gmail.com>
;; URL     : https://github.com/RenChunhui/.emacs.d
;; Version : 1.0.0

;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;;; Code:

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;; (package-initialize)

;; Increase the garbage collection threshold to 128 MB to ease startup
(setq gc-cons-threshold (* 128 1024 1024))

(load-file (concat (file-name-directory load-file-name)
                     "core/core-load-paths.el"))

(require 'core-emacs)
(require 'core-packages)
(require 'core-themes)
(require 'core-mode-line)

(require 'init-html)
(require 'init-css)
(require 'init-scss)
(require 'init-js)
(require 'init-json)
(require 'init-yaml)
(require 'init-org)
(require 'init-markdown)

(require 'server)
(server-start)

;;; init.el ends here

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (markdown-mode org-bullets json-mode company-tern tern js2-mode scss-mode web-mode atom-one-dark-theme base16-theme color-theme-modern zerodark-theme magit counsel-projectile projectile editorconfig flycheck counsel which-key company use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
