;;; core-layers.el --- core layers
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

(with-temp-message ""
  (require 'all-the-icons)
  (require 'powerline)
  (require 'init-evil)
  (require 'init-ivy)
  (require 'init-base)
  (require 'gnus-bindings))

(run-with-idle-timer 2 nil
  #'(lambda ()
    (require 'init-completion)
    (require 'init-after)
    (require 'init-css)
    (require 'init-html)
    (require 'init-javascript)
    (require 'init-json)
    (require 'init-markdown)
    (require 'init-org)
    (require 'init-scss)
    (require 'init-shell)
    (require 'init-typescript)
    (require 'init-vim)
    (require 'init-yaml)))

(provide 'core-layers)

;;; core-layers.el ends here
