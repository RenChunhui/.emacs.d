(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("gnu" . "https://elpa.gnu.org/packages/"))
      package-user-dir "~/.emacs.d/.cache/elpa")

(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(provide 'init-package)