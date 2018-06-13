

(package-initialize)

(add-to-list 'load-path (expand-file-name "core" user-emacs-directory))

(require 'core-emacs)
(require 'core-packages)
(require 'core-themes)
(require 'core-dev)
(require 'core-mode-line)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("cea3ec09c821b7eaf235882e6555c3ffa2fd23de92459751e18f26ad035d2142" "c968804189e0fc963c641f5c9ad64bca431d41af2fb7e1d01a2a6666376f819c" "ef403aa0588ca64e05269a7a5df03a5259a00303ef6dfbd2519a9b81e4bce95c" "b3bcf1b12ef2a7606c7697d71b934ca0bdd495d52f901e73ce008c4c9825a3aa" "f2dd097452b79276ce522df2f8aeb37f6d90f504529616aa46122d549910e46d" default)))
 '(package-selected-packages
   (quote
    (window-numbering zenburn-theme which-key web-mode use-package scss-mode org-bullets json-mode js2-mode flycheck editorconfig counsel company-tern color-theme-modern base16-theme atom-one-dark-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
