;;; init-symbols.el --- symbols configuration -*- coding: utf-8; lexical-binding: t -*-
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;;; Code:

(defgroup default-theme nil
  "Default-theme options."
  :group 'faces)

(defface elisp-face
  '((t :foreground "#411F5D"))
  "Face for Emacs lisp."
  :group 'default-theme)

(defface html-face
  '((t 
       :foreground "#E44D26"))
  "Face for html5."
  :group 'default-theme)

(defface css-face
  '((t 
       :foreground "#ebebeb"))
  "Face for css."
  :group 'default-theme)

(defface scss-face
  '((t 
       :foreground "#cd6799"))
  "Face for scss."
  :group 'default-theme)

(defface javascript-face
  '((t 
       :foreground "#f5de19"))
  "Face for javascript."
  :group 'default-theme)

(defface typescript-face
  '((t 
       :foreground "#007acc"))
  "Face for typescript."
  :group 'default-theme)

(defface json-face
  '((t 
       :foreground "#f5de19"))
  "Face for json."
  :group 'default-theme)

(defface yaml-face
  '((t 
       :foreground "#fbc02d"))
  "Face for yaml."
  :group 'default-theme)

(defface org-face
  '((t 
       :foreground "#77AA99"))
  "Face for org mode."
  :group 'default-theme)

(defface markdown-face
  '((t 
       :foreground "#755838"))
  "Face for markdown."
  :group 'default-theme)

(defface winum-face
  '((t :background "#755838"
       :foreground "#FFF"))
  "Face for markdown."
  :group 'default-theme)

;; languages
(defconst icon-default          "\xe612")
(defconst icon-html             "\xe736")
(defconst icon-css              "\xe749")
(defconst icon-scss             "\xe603")
(defconst icon-javascript       "\xe74e")
(defconst icon-typescript       "\xe628")
(defconst icon-json             "\xe60b")
(defconst icon-yaml             "\xe612")
(defconst icon-markdown         "\xe73e")
(defconst icon-elisp            "\xe926")

;; dashboard
(defconst icon-history          "\xf7d9")
(defconst icon-project          "\xe601")
(defconst icon-repo             "\xf401")
(defconst icon-calendar         "\xf073")

;; folder
(defconst icon-folder           "\xe5ff")
(defconst icon-folder_open      "\xe5fe")

;; git status
(defconst icon-git_branch       "\xe725")
(defconst icon-git_commit       "\xe729")
(defconst icon-git_compare      "\xe728")
(defconst icon-git_merge        "\xe727")
(defconst icon-git_pull_request "\xe726")

;; lip box
(defconst icon-box_cube "\xf1b2")

(defconst icon-flycheck_error   "\xf658")
(defconst icon-flycheck_warning "\xf071")
(defconst icon-dashboard        "\xf463")

(provide 'init-symbols)

;;; init-symbols.el ends here
