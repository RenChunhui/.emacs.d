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


(defun indent-buffer ()
  "Indent current buffer."
  (interactive)
  (save-excursion
    (indent-region (point-min) (point-max) nil)))

(defun delete-this-file ()
  "Delete the current file.and kill thie buffer."
  (interactive)
  (unless (buffer-file-name)
    (error "No file is currently beingedited"))
  (when (yes-or-no-p (format "Really delete '%s'?"
			     (file-name-nondirectory buffer-file-name)))
    (delete-file (buffer-file-name))
    (kill-this-buffer)))

(defun rename-this-file (new-name)
  "Rename both current buffer and file it's visiting to NEW-NAME."
  (interactive "sNew name: ")
  (let ((name (buffer-name))
	(filename (buffer-file-name)))
    (unless filename
      (error "Buffer '%s' is not visiting a file!" name))
    (progn
      (when (file-exists-p filename)
	(rename-file filename new-name 1))
      (set-visited-file-name new-name)
      (rename-buffer new-name))))

;; (defun kill-buffer ()
;;   "Kill current buffer."
;;   (interactive))

(provide 'init-functions)

;;; init-functions.el ends here
