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

(require 'all-the-icons)
(require 'powerline)
(require 'gnus-bindings)
(require 'gnus-org)

(require 'init-evil)
(require 'init-extensions)
(require 'init-completion)
(require 'init-ivy)

(require 'init-languages)

(defvar mage-init-time 'nil)
(defun emacs//display-summary()
  (message "%s packages loaded in %.03fs"
           (length package-activated-list)
           (or mage-init-time
               (setq mage-init-time
                     (float-time (time-subtract (current-time) before-init-time))))))
(add-hook 'emacs-startup-hook #'emacs//display-summary)

(provide 'core-layers)

;;; core-layers.el ends here
