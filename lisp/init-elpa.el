;;; init-elpa.el --- settings and helpers for package.el -*- lexical-binding: t -*-
;;
;; Copyright (c) 2019 Chunhui Ren
;;
;; Author : Chunhui Ren <renchunhui2008@gmail.com>
;; URL    : https://github.com/renchunhui/.emacs.d
;; Version: 1.0.0
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;;; Code:

(require 'package)

(setq package--init-file-ensured t
      package-user-dir (expand-file-name "elpa" emacs-cache-directory)
      package-enable-at-startup nil
      package-archives '(("melpa-cn" . "http://elpa.emacs-china.org/melpa/")
			 ("gnu-cn" . "http://elpa.emacs-china.org/gnu/")))

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(use-package diminish
  :ensure t)

(use-package benchmark-init
  :ensure t
  :config
  (add-hook 'after-init-hook 'benchmark-init/deactivate))

(use-package memoize
  :ensure t)

(use-package all-the-icons
  :after memoize
  :load-path "site-lisp/all-the-icons")
  
(provide 'init-elpa)

;;; init-elpa.el ends here
