(setq package-user-dir "~/.emacs.d/.cache/elpa")

(package-initialize)

(setq package-archives '(("melpa" . "http://elpa.emacs-china.org/melpa/")
        ("gnu"   . "http://elpa.emacs-china.org/gnu/")))

(package-refresh-contents)

(defconst emacs-packages
  '(use-package
    company
    yasnippet
    which-key
    flycheck
    magit
    editorconfig
    benchmark-init
    memoize
    winum

    dashboard
    doom-themes
    doom-modeline

    ;; evil
    evil
    evil-leader

    ;; lsp
    lsp-mode
    lsp-ui
    company-lsp
    dap-mode

    ;; ivy
    projectile
    counsel
    counsel-projectile
    swiper
    ivy-rich

    ;; language
    web-mode
    css-mode
    scss-mode
    js2-mode
    tide
    json-mode
    yaml-mode
    markdown-mode
    rust-mode
    org-bullets
    racer)
  "List of packages that I like.")

;; install required
(dolist (package emacs-packages)
  (unless (package-installed-p package)
    (package-install package)))

;; upgrade installed
(save-window-excursion
  (package-list-packages t)
  (package-menu-mark-upgrades)
  (package-menu-execute t))
