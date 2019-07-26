;;; init-keybindings.el --- keybindings configuration -*- coding: utf-8; lexical-binding: t -*-
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;;; Code:

(use-package which-key
  :ensure t
  :hook (after-init . which-key-mode)
  :init
  (progn
    (setq which-key-sort-order #'which-key-prefix-then-key-order
	  which-key-sort-uppercase-first nil
	  which-key-add-column-padding 1
	  which-key-max-display-columns nil
	  which-key-min-display-lines 5)
    (which-key-add-key-based-replacements
      "SPC a" "Application"
      "SPC b" "Buffer"
      "SPC c" "Comments"
      "SPC d" "Dired"
      "SPC e" "Error"
      "SPC f" "File"
      "SPC g" "Git"
      "SPC h" "Help"
      "SPC i" "Insert"
      "SPC j" "Jump"
      "SPC o" "Org mode"
      "SPC p" "Project"
      "SPC r" "Recent"
      "SPC s" "Search"
      "SPC t" "Toggle"
      "SPC w" "Window"

      "SPC ff" "Find File")))

(provide 'init-keybindings)

;;; init-keybindings.el ends here
