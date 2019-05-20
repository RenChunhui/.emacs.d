

(add-to-list 'load-path (expand-file-name "site-lisp/awesome-tab" user-emacs-directory))
(require 'awesome-tab)

(setq awesome-tab-style 'slant)

(awesome-tab-mode t)
(provide 'init-tab)
