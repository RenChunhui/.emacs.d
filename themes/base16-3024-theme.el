;;; base16-3024-theme.el --- core paths
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

(require 'base16-theme)

(defvar base16-3024-colors
  '(:base00 "#090300"
    :base01 "#3a3432"
    :base02 "#4a4543"
    :base03 "#5c5855"
    :base04 "#807d7c"
    :base05 "#a5a2a2"
    :base06 "#d6d5d4"
    :base07 "#f7f7f7"
    :base08 "#db2d20"
    :base09 "#e8bbd0"
    :base0A "#fded02"
    :base0B "#01a252"
    :base0C "#b5e4f4"
    :base0D "#01a0e4"
    :base0E "#a16a94"
    :base0F "#cdab53")
  "All colors for Base16 3024 are defined here.")

;; Define the theme
(deftheme base16-3024)

;; Add all the faces to the theme
(base16-theme-define 'base16-3024 base16-3024-colors)

;; Mark the theme as provided
(provide-theme 'base16-3024)

(provide 'base16-3024-theme)

;; Local Variables:
;; no-byte-compile: t
;; End:

;;; base16-3024-theme.el ends here
