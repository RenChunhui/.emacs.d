;; #52811b
;; #fecc00
;; #cda256
;; #d6c7a5
;; #9bbeaa

;;; tea-theme.el --- core paths
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

(deftheme tea
  "A dark medium contrast theme")

(let ((class '((class color) (min-colors 89))))
  (custom-theme-set-faces
   'tea
   ;; basic colors
   `(default ((,class (:background "#F5F5F5" :foreground "#333333"))))
   `(cursor ((,class (:background "#EEAD0E"))))
   `(fringe ((,class (:background "#F5F5F5"))))
   `(highlight ((,class (:background "#E5F7D3"))))

   ;; compilation

   ;; font-lock
   `(font-lock-comment-face ((,class (:foreground "#AAAAAA"))))
   `(font-lock-type-face ((,class (:foreground "#7A3E9D"))))
   `(font-lock-string-face ((,class (:foreground "#448C27"))))
   `(font-lock-variable-name-face ((,class (:foreground "#7A3E9D"))))
   `(font-lock-function-name-face ((,class (:foreground "#AA3731"))))

   ;; line-numbers

   ;; company-mode
   `(company-tooltip ((,class (:background "#C8C8C8"))))
   `(company-tooltip-common ((,class (:foreground "#9969DC"))))
   `(company-tooltip-selection ((,class (:background "#CADFB8"))))

   ;; ivy
   `(ivy-current-match ((,class (:background "#CADFB8"))))

   ;; powerline
   `(powerline-active0 ((,class (:background "#292B2E" :foreground "#FFFFFF"))))
   `(powerline-active1 ((,class (:background "#705697" :foreground "#FFFFFF"))))
   `(powerline-active2 ((,class (:background "#EEAD0E" :foreground "#292B2E"))))

   ;; Compilation faces
   `(next-error ((,class (:inherit region :background "SkyBlue"))))))

(provide-theme 'tea)

;; Local Variables:
;; no-byte-compile: t
;; End:

;;; tea-theme.el ends here