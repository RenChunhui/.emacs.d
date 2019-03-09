;;; init-which-key.el --- which-key -*- lexical-binding: t -*-
;;
;; Copyright (c) 2018 Chunhui Ren
;;
;; Author  : Chunhui Ren <renchunhui2008@gmail.com>
;; URL     : https://github.com/RenChunhui/.emacs.d
;; Version : 1.0.0
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;;; Code:

(use-package which-key
  :init
  (progn
    (which-key-add-key-based-replacements
      "SPC b" "Buffer"
      "SPC c" "Clock"
      "SPC f" "Files"
      "SPC h" "Help"
      "SPC o" "Org mode"
      "SPC p" "Project"
      "SPC s" "Search"))
  :config
  (progn
    (setq which-key-sort-order #'which-key-prefix-then-key-order
	  which-key-sort-uppercase-first nil
	  which-key-add-column-padding 1
	  which-key-max-display-columns nil
	  which-key-min-display-lines 5)
    (which-key-mode)))

(provide 'init-which-key)

;;; init-which-key.el ends here
