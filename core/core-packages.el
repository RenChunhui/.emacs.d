(require 'package)

(setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
                         ("melpa" . "http://elpa.emacs-china.org/melpa/")))

(package-initialize)

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
	(package-refresh-contents)
	(package-install 'use-package))

(use-package company
    :ensure t
    :config
    (global-company-mode)
    (setq company-idle-delay 0.1)
    (setq company-tooltip-limit 10)
    (setq company-minimum-prefix-length 2))

(use-package which-key
  :ensure t
  :config
  (which-key-mode))

;; ivy
(use-package counsel
  :ensure t
  )

(use-package swiper
  :ensure t
  :bind (("M-x" . counsel-M-x)
	 ("C-x C-f" . counsel-find-file))
  :init
  (setq ivy-use-virtual-buffers t)
  :config
  (ivy-mode 1))

(use-package yasnippet
  :ensure t
  :init
  (yas-global-mode 1))

(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode t))

;; projectile
(use-package projectile
  :ensure t
  :config
  (projectile-mode t)
  ;; To enable caching
  (setq projectile-enable-caching t)
  ;; Using projectile everywhere
  (setq projectile-require-project-root nil)
  (setq projectile-completion-system 'ivy))

(use-package counsel-projectile
  :ensure t)

;; spaceline - A mode line
(use-package spaceline
  :ensure t
  :init
  (setq ns-use-srgb-colorspace nil)
  (require 'spaceline-config)
  (spaceline-spacemacs-theme)
  :config
  (setq powerline-default-separator 'slant))

;; 括号自动补全
(electric-pair-mode t)

(provide 'core-packages)

;;; core-packages ends here
