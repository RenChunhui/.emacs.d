;;; material-design-theme.el --- core paths
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

(deftheme material-design
  "Material design theme.")

(defvar base16-theme
  "Styling guideines:
base00 - Default background
base01 - Lighter background(used for status bars)
base02 - Selection background
base03 - Comments,Invisibles,Line hightlighting
base04 - Dark Foreground(used for status bars)
base05 - Default foreground, Caret, Deimiters, Operators
base06 - Light foreground(not often used)
base07 - Light background(not often used)
base08 - Variables, XML tags, Markup link text, Markup lists, Diff deleted
base09 - Integers, Boolean, Constants, XML Attributes, Markup link url
base0A - Classes, Markup bold, Search text background
base0B - Strings, Inherited class, Markup code, Diff inserted
base0C - Support, Regular expressions, Escape characters, Markup quotes
base0D - Functions, Methods, Attribute IDs, Headings
base0F - Deprecated, Opening/Closing Embedded Language Tags.
"
  '(
    ("base00" . "#181818")
    ("base01" . "#282828")
    ("base02" . "#383838")
    ("base03" . "#585858")
    ("base04" . "#b8b8b8")
    ("base05" . "#d8d8d8")
    ("base06" . "#e8e8e8")
    ("base07" . "#f8f8f8")
    ("base08" . "#ab4642")
    ("base09" . "#dc9656")
    ("base0A" . "#f7ca88")
    ("base0B" . "#a1b56c")
    ("base0C" . "#86c1b9")
    ("base0D" . "#7cafc2")
    ("base0E" . "#aa759f")
    ("base0F" . "#a16946")))

(let ((class '((class color) (min-colors 89))))
  (custom-theme-set-faces
   'material-design
   `(default ((,class (:background base16-set-face("base00")))))
   ;;`(default ((,class (:background "#242424" :foreground "#f6f3e8"))))
   `(cursor ((,class (:background "#656565"))))
   
   ))

(defun base16-set-face (key)
  "Get base16 theme as key."
  (cdr (assoc "key" base16-theme)))

(custom-theme-set-variables
 'material-design
 '(ansi-color-names-vector ["#242424" "#e5786d" "#95e454" "#cae682"
			    "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"]))

(provide-theme 'material-design)

;; Local Variables:
;; no-byte-compile: t
;; End:

;;; material-design-theme.el ends here
