(setq package-user-dir "~/.emacs.d/.cache/elpa")

(package-initialize)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
("melpa-stable" . "https://stable.melpa.org/packages/")
        ("gnu" . "https://elpa.gnu.org/packages/")))

(package-refresh-contents)

(defconst ora-packages
  '(use-package
    company
    company-quickhelp
    company-box
    dashboard
    evil
    evil-leader
    flycheck
    counsel
    counsel-projectile
    swiper
    which-key
    lsp-mode
    lsp-ui
    company-lsp
    winum
    powerline
    projectile
    editorconfig
    atom-one-dark-theme
    treemacs
    treemacs-evil
    treemacs-projectile
    treemacs-icons-dired
    treemacs-magit
    yasnippet

    ;; language
    web-mode
    css-mode
    scss-mode
    js2-mode
    tern
    company-tern
    tide
    json-mode
    yaml-mode
    markdown-mode)
  "List of packages that I like.")

;; install required
(dolist (package ora-packages)
  (unless (package-installed-p package)
    (package-install package)))

;; upgrade installed
(save-window-excursion
  (package-list-packages t)
  (package-menu-mark-upgrades)
  (package-menu-execute t))