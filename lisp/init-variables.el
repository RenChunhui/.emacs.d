;;; init-styles.el --- styles configuration -*- coding: utf-8; lexical-binding: t -*-
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;;; Code:

(defgroup default-theme nil
  "Default-theme options."
  :group 'faces)

(defface html-face
  '((t :background "#E44D26"
       :foreground "#FFF"))
  "Face for html5."
  :group 'default-theme)

(defface css-face
  '((t :background "#ebebeb"
       :foreground "#FFF"))
  "Face for css."
  :group 'default-theme)

(defface scss-face
  '((t :background "#cd6799"
       :foreground "#FFF"))
  "Face for scss."
  :group 'default-theme)

(defface javascript-face
  '((t :background "#f5de19"
       :foreground "#FFF"))
  "Face for javascript."
  :group 'default-theme)

(defface typescript-face
  '((t :background "#007acc"
       :foreground "#FFF"))
  "Face for typescript."
  :group 'default-theme)

(defface json-face
  '((t :background "#f5de19"
       :foreground "#FFF"))
  "Face for json."
  :group 'default-theme)

(defface yaml-face
  '((t :background "#fbc02d"
       :foreground "#FFF"))
  "Face for yaml."
  :group 'default-theme)

(defface org-face
  '((t :background "#77AA99"
       :foreground "#FFF"))
  "Face for org mode."
  :group 'default-theme)

(defface markdown-face
  '((t :background "#755838"
       :foreground "#FFF"))
  "Face for markdown."
  :group 'default-theme)

(defface winum-face
  '((t :background "#755838"
       :foreground "#FFF"))
  "Face for markdown."
  :group 'default-theme)

(defconst default          "\xe612")
(defconst html             "\xe736")
(defconst css              "\xe749")
(defconst scss             "\xe603")
(defconst javascript       "\xe74e")
(defconst typescript       "\xe628")
(defconst json             "\xe60b")
(defconst yaml             "\xe612")
(defconst markdown         "\xe73e")

;; dashboard
(defconst history          "\xf7d9")
(defconst project          "\xe601")
(defconst repo             "\xf401")
(defconst calendar         "\xf073")

;; git status
(defconst git_branch       "\xe725")
(defconst git_commit       "\xe729")
(defconst git_compare      "\xe728")
(defconst git_merge        "\xe727")
(defconst git_pull_request "\xe726")

(defconst flycheck_error   "\xf658")
(defconst flycheck_warning "\xf071")

(provide 'init-variables)

;;; init-styles.el ends here
