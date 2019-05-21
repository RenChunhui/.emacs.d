;;; init-styles.el --- styles configuration -*- coding: utf-8; lexical-binding: t -*-
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;;; Code:

(defface warning
  '((t :background nil
       :foreground "#ffb86c"))
  "Basic face for warning."
  :group 'basic-faces)

(defface error
  '((t :background nil
       :foreground "#ff5555"))
  "Basic face for error."
  :group 'basic-faces)

(defface html-face
  '((t :background "#E44D26"
       :foreground "#FFF"))
  "Face for html5."
  :group 'lang-mode)

(defface css-face
  '((t :background "#ebebeb"
       :foreground "#FFF"))
  "Face for css."
  :group 'lang-mode)

(defface scss-face
  '((t :background "#cd6799"
       :foreground "#FFF"))
  "Face for scss."
  :group 'lang-mode)

(defface javascript-face
  '((t :background "#f5de19"
       :foreground "#FFF"))
  "Face for javascript."
  :group 'lang-mode)

(defface typescript-face
  '((t :background "#007acc"
       :foreground "#FFF"))
  "Face for typescript."
  :group 'lang-mode)

(defface json-face
  '((t :background "#f5de19"
       :foreground "#FFF"))
  "Face for json."
  :group 'lang-mode)

(defface yaml-face
  '((t :background "#fbc02d"
       :foreground "#FFF"))
  "Face for yaml."
  :group 'lang-mode)

(defface org-face
  '((t :background "#77AA99"
       :foreground "#FFF"))
  "Face for org mode."
  :group 'lang-mode)

(defface markdown-face
  '((t :background "#755838"
       :foreground "#FFF"))
  "Face for markdown."
  :group 'lang-mode)


(defconst default          "\xe612")
(defconst html             "\xe736")
(defconst css              "\xe749")
(defconst scss             "\xe603")
(defconst javascript       "\xe74e")
(defconst typescript       "\xe628")
(defconst json             "\xe60b")
(defconst yaml             "\xe612")
(defconst org              "\xe612")
(defconst markdown         "\xe73e")

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
