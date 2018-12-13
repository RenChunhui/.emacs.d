(setq package--init-file-ensured t
      package-user-dir (expand-file-name "elpa" tea-emacs-cache-directory)
      package-enable-at-startup nil
      package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("gnu"   . "https://elpa.gnu.org/packages/")))

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
(require 'init-line-number)
(require 'init-lsp)
(require 'init-dictionary)

(provide 'init-packages)
