;;; core-emacs.el --- core configuration
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

(require 'core-settings)
(require 'core-startup)
(require 'core-layers)

(defun emacs/init ()
  "初使化设置."
  (emacs//personal-infomation)
  (emacs//load-theme)
  (emacs//remove-gui-elements)
  (emacs//display)
  (emacs//auto-save-enable)
  (emacs//monospace))

(emacs/init)

(provide 'core-emacs)

;;; core-emacs.el ends here
