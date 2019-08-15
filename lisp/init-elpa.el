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
      package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("melpa-stable" . "https://stable.melpa.org/packages/")
			 ("gnu" . "https://elpa.gnu.org/packages/")))

(package-initialize)

(provide 'init-elpa)

;;; init-elpa.el ends here
