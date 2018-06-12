(require 'package)

(setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
                         ("melpa" . "http://elpa.emacs-china.org/melpa/")))

(package-initialize)

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

(use-package counsel
  :ensure t)

(use-package swiper
  :ensure t
  :bind (("M-x" . counsel-M-x)
	 ("C-x C-f" . counsel-find-file)
	 ("s-f" . swiper)
	 ("C-c g" . counsel-git))
  :config
  (ivy-mode 1))

(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode t)
  :config
  (setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc)))

(provide 'core-packages)

;;; core-packages ends here
