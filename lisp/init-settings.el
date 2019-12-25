(progn
  (tool-bar-mode -1)
  (set-scroll-bar-mode nil)
  (fset 'yes-or-no-p 'y-or-n-p)
  (electric-pair-mode t)
  (global-hl-line-mode 1)
  (global-font-lock-mode 1)
  (global-visual-line-mode 1)
  (set-face-attribute 'default nil :font "SF Mono-13")
  (setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
  (setq exec-path (append exec-path '("/usr/local/bin")))

  ;; Indentation
	(setq-default tab-width 2
                tab-always-indent t
                indent-tabs-mode nil
                fill-column 120)
  
	;; Word wrapping
	(setq-default word-wrap t
                truncate-lines t
                truncate-partial-width-windows nil)

	;; Scrolling
	(setq hscroll-margin 2
	      hscroll-step 1
	      scroll-conservatively 10
	      scroll-margin 0
	      scroll-preserve-screen-position t
	      auto-window-vscroll nil
	      mouse-wheel-scroll-amount '(5 ((shit) . 2))
	      mouse-wheel-progressive-speed nil)

  (setq blink-matching-paren nil)

	(setq visible-cursor nil)

	;; Fringes
	(setq indicate-buffer-boundaries nil
	      indicate-empty-lines nil)

	;; Windows
	(setq window-resize-pixelwise t
	      frame-resize-pixelwise t)

	;; macOS
	(setq ns-use-native-fullscreen nil
	      ns-pop-up-frames nil)
  
  (blink-cursor-mode -1)

  (setq x-underline-at-descent-line t)

  (setq window-divider-default-places t
        window-divider-default-bottom-width 1
        window-divider-default-right-width 1)

  (setq visible-bell nil
	ring-bell-function 'ignore

	initial-scratch-message nil
	initial-major-mode 'fundamental-mode
	inhibit-splash-screen t
	inhibit-startup-message t
	inhibit-default-init t

	make-backup-files nil

	auto-save-list-file-name (concat emacs-cache-directory "autosave")
	backup-directory-alist (list (cons "." (concat emacs-cache-directory "backup/")))
	
	inhibit-compacting-font-caches t
	ns-use-srgb-colorspace nil))

(use-package custom
  :ensure nil
  :config
  (progn
    (setq custom-file (expand-file-name "custom.el" emacs-cache-directory))
    (when (file-exists-p custom-file)
      (load custom-file))))

(use-package server
  :config
  (unless (server-running-p) (server-start)))

(use-package electric
  :demand t
  :config
  (electric-indent-mode t))

(use-package display-line-numbers
  :ensure nil
  :hook ((emacs-lisp-mode
	  web-mode
	  js2-mode
	  css-mode
	  scss-mode
	  typescript-mode
	  markdown-mode
	  org-mode
	  json-mode
	  yaml-mode) . display-line-numbers-mode)
  :init
  (setq-default display-line-numbers-width 3))

(use-package bookmark
  :ensure nil
  :init
  (setq bookmark-default-file (concat emacs-cache-directory "bookmarks")))

(use-package recentf
  :ensure nil
  :init
  (progn
    (setq recentf-max-saved-items 10
	  recentf-save-file (concat emacs-cache-directory "recentf")
	  recentf-exclude '((expand-file-name package-user-dir)
			    ".cache"
			    ".cask"
			    ".elfeed"
			    "bookmarks"
			    "cache"
			    "ido.*"
			    "persp-confs"
			    "recentf"
			    "undo-tree-hist"
			    "url"
			    "COMMIT_EDITMSG\\'"))))

(use-package ibuffer
  :ensure nil
  :bind ("C-x C-b" . ibuffer)
  :init
  (progn
    (setq ibuffer-saved-filter-groups
	  '(("Normal"
	     ("Dired" (mode . dired-mode))
	     ("Emacs" (or
		       (name . "^\\*dashboard\\*$" )
		       (name . "^\\*scratch\\*$"   )
		       (name . "^\\*Messages\\*$"  )
		       (name . "^\\*Backtrace\\*$" )))
	     ("Text" (or
		      (mode . org-mode)
		      (mode . markdown-mode)
		      (mode . rst-mode)
		      (mode . text-mode)))
	     ("Languages" (or
			   (mode . emacs-lisp-mode)
			   (mode . javascript-mode)
			   (mode . rust-mode)
			   (mode . css-mode)
			   (mode . scss-mode)
			   (mode . html-mode))))))))

(use-package undo-tree
  :after (after-find-file)
  :config
  (progn
    (setq undo-tree-auto-save-history t
	  undo-limit 800000
	  undo-strong-limit 12000000
	  undo-outer-limit 120000000
	  undo-tree-history-directory-alist
	  `(("." . ,(concat emacs-cache-directory "undo-tree-hist/"))))))

(provide 'init-settings)

;;; init-settings.el ends here
