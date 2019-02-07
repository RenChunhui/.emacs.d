(setq package--init-file-ensured t
      package-user-dir (expand-file-name "elpa" tea-emacs-cache-directory)
      package-enable-at-startup nil
      package-archives '(("melpa" . "http://elpa.emacs-china.org/melpa/")
			 ("gnu"   . "http://elpa.emacs-china.org/gnu/")))

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'init-completion)
(require 'init-ivy)
(require 'init-project)
(require 'init-window)
(require 'init-evil)
(require 'init-flycheck)
(require 'init-html)
(require 'init-css)
(require 'init-javascript)
(require 'init-typescript)
(require 'init-json)
(require 'init-yaml)
(require 'init-markdown)
(require 'init-org)
(require 'init-vc)
(require 'init-lsp)
(require 'init-dictionary)
(require 'init-editorconfig)

(provide 'init-packages)
