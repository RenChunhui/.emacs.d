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

(load-file (concat (file-name-directory load-file-name)
                     "core/core-load-paths.el"))

(require 'core-emacs)
(require 'core-packages)
(require 'core-themes)

(require 'init-html)
(require 'init-css)
(require 'init-scss)
(require 'init-js)
(require 'init-json)
(require 'init-yaml)
(require 'init-org)

;;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (magit spaceline zenburn-theme window-numbering which-key web-mode use-package scss-mode org-bullets json-mode js2-mode flycheck editorconfig counsel company-tern color-theme-modern base16-theme atom-one-dark-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
