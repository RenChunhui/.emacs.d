(defun packages/initialize ()
  (setq package-enable-at-startup nil)
  
    (require 'package)
    
    (setq package-archives '(("melpa" . "https://melpa.org/packages/")
			     ("gnu" . "https://elpa.gnu.org/packages/"))
          package-user-dir "~/.emacs.d/.cache/elpa")

    (package-initialize)

    (unless (package-installed-p 'use-package)
      (package-refresh-contents)
      (package-install 'use-package))
    
    (load-packages))

(defun load-packages ()
  (require 'init-completion)
  (require 'init-ivy)
  (require 'init-project)
  (require 'init-window)
  (require 'init-evil)
  (require 'init-html)
  (require 'init-css)
  (require 'init-javascript)
  (require 'init-typescript)
  (require 'init-json)
  (require 'init-yaml)
  (require 'init-markdown)
  (require 'init-org)
  (require 'init-vc)
  )

(provide 'init-packages)
