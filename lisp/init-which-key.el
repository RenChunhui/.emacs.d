;;; init-keymap.el --- keymap configuration
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

(require 'which-key)

(eval-after-load 'which-key
  '(progn
     (which-key-mode)
     (setq which-key-prefix-prefix "")
     (which-key-add-key-based-replacements
     "SPC a" "Application"

     "SPC b" "Buffer"
     "SPC bk" "kill"
     "SPC bs" "switch"

     "SPC c" "Comments"
     "SPC d" "Dired"
     "SPC e" "Error"

     "SPC f" "File"
     "SPC ff" "find"
     "SPC fl" "locate"

     "SPC g" "Git"

     "SPC h" "Help"
     "SPC hv" "variable"
     "SPC hf" "function"

     "SPC i" "Insert"
     "SPC j" "Jump"
     "SPC o" "Org mode"
     "SPC r" "Recent"
     "SPC s" "Search"
     "SPC t" "Toggle"

     "SPC w" "Window"
     "SPC wd" "delete"
     "SPC wo" "delete other"
     "SPC wh" "move left"
     "SPC wj" "move down"
     "SPC wk" "move up"
     "SPC wl" "move right"
     "SPC w|" "split right"
     "SPC w-" "split below")))


(provide 'init-which-key)

;;; init-which-key.el ends here
