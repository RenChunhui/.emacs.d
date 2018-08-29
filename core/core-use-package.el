;;; core-packages.el --- core packages
;;
;; Copyright (c) 2018
;;
;; Author  : Chunhui Ren <renchunhui2008@gmail.com>
;; URL     : https://github.com/RenChunhui/.emacs.d
;; Version : 1.0.0
;;
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;; (_)___|_| |_| |_|\__,_|\___|___/
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;;; Code:

(require 'package)

(setq package-archives '(("melpa-cn" . "http://elpa.emacs-china.org/melpa/")
                         ("org-cn"   . "http://elpa.emacs-china.org/org/")
                         ("gnu-cn"   . "http://elpa.emacs-china.org/gnu/")))

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-read-all-archive-contents)
  (package-install 'use-package))

(provide 'core-use-package)

;;; core-use-package ends here

