

(package-initialize)

(add-to-list 'load-path (expand-file-name "core" user-emacs-directory))

(require 'core-emacs)
(require 'core-packages)
(require 'core-themes)
(require 'core-dev)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (flycheck avy atom-one-dark-theme zenburn-theme which-key web-mode use-package scss-mode org-bullets json-mode js2-mode counsel company-tern))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
