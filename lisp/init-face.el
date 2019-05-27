;;; init-face.el --- face configuration -*- coding: utf-8; lexical-binding: t -*-
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

(defconst default          "\xe612")
(defconst html             "\xe736")
(defconst css              "\xe749")
(defconst scss             "\xe603")
(defconst javascript       "\xe74e")
(defconst typescript       "\xe628")
(defconst json             "\xe60b")
(defconst yaml             "\xe612")
(defconst markdown         "\xe73e")
(defconst elisp            "\xe926")

;; dashboard
(defconst history          "\xf7d9")
(defconst project          "\xe601")
(defconst repo             "\xf401")
(defconst calendar         "\xf073")

;; folder
(defconst folder           "\xe5ff")
(defconst folder_open      "\xe5fe")

;; git status
(defconst git_branch       "\xe725")
(defconst git_commit       "\xe729")
(defconst git_compare      "\xe728")
(defconst git_merge        "\xe727")
(defconst git_pull_request "\xe726")

;; lip box
(defconst box_cube "\xf1b2")

(defconst flycheck_error   "\xf658")
(defconst flycheck_warning "\xf071")
(defconst dashboard        "\xf463")

(provide 'init-face)

;;; init-styles.el ends here
