;;; init.el --- My personal Emacs configuration.
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
(require 'init-css)
(require 'init-scss)
(require 'init-js)
(require 'init-json)
(require 'init-yaml)
(require 'init-md)
(require 'init-org)
(require 'init-pdf)

(provide 'init)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (spaceline org-bullets json-mode company-tern tern js2-mode scss-mode web-mode atom-one-dark-theme treemacs-projectile treemacs counsel-projectile projectile flycheck yasnippet counsel which-key company use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
