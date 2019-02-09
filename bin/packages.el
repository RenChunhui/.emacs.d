(setq package-user-dir "~/.emacs.d/.cache/elpa")

(package-initialize)

(setq package-archives '(("gnu" . "http://elpa.emacs-china.org/gnu/")
                         ("melpa" . "http://elpa.emacs-china.org/melpa/")))

(package-refresh-contents)

(defconst ora-packages
  '(use-package
    company
    company-quickhelp
    yasnippet
    which-key
    neotree
    flycheck
    winum
    magit
    editorconfig
    osx-dictionary

    ;; modeline
    diminish

    ;; chinese
    pyim
    pyim-wbdict
    youdao-dictionary

    ;; ivy
    project
    counsel
    counsel-projectile
    swiper

    ;; evil
    evil
    evil-leader

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
    markdown-mode
    org-bullets
    vimrc-mode)
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
