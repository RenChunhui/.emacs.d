;;; init-functions.el --- functions
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

(defvar init-time 'nil)

(defun emacs//display-summary()
  (message "%s packages loaded in %.03fs"
	   (length package-activated-list)
	   (or init-time
	       (setq init-time
		     (float-time (time-subtract (current-time) before-init-time))))))

(defun indent-buffer ()
  "Indent current buffer."
  (interactive)
  (save-excursion
    (indent-region (point-min) (point-max) nil)))

;; (defun kill-buffer ()
;;   "Kill current buffer."
;;   (interactive))

(provide 'init-functions)

;;; init-functions.el ends here
