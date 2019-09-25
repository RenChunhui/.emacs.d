(setq package-user-dir "~/.emacs.d/.cache/elpa")

(package-initialize)

(setq package-archives '(("gnu-cn" . "http://elpa.emacs-china.org/gnu/")
                         ("melpa-cn" . "http://elpa.emacs-china.org/melpa/")))

(package-refresh-contents)

(defconst emacs-packages
  '(use-package
    diminish
    benchmark-init
    memoize
    doom-themes
    dashboard
    powerline
    winum
    company
    company-box
    yasnippet
    ivy
    ivy-rich
    counsel
    counsel-projectile
    swiper
    projectile
    magit
    pangu-spacing
    cnfonts
    editorconfig
    flycheck

    ;; language
    web-mode
    css-mode
    scss-mode
    typescript-mode
    tide
    json-mode
    yaml-mode
    markdown-mode)
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