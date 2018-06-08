(require 'package)

(defconst configuration-layer-directory
  (expand-file-name (concat user-emacs-directory "layers/")))

(setq package-enable-at-startup nil)

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
    (setq company-minimum-prefix-length 2)
    :diminish company-mode)

(use-package which-key
  :ensure t
  :config
  (which-key-mode))
    

(provide 'core-packages)
