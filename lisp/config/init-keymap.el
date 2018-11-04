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


(defun indent-buffer ()
  (interactive)
  (save-excursion
    (indent-region (point-min) (point-max) nil)))

(global-set-key [f12] 'indent-buffer)

(global-set-key (kbd "s-a") 'mark-whole-buffer)
(global-set-key (kbd "s-f") 'isearch-forward)
(global-set-key (kbd "s-v") 'yank)
(global-set-key (kbd "s-w") 'kill-buffer)
(global-set-key (kbd "s-y") 'redo)
(global-set-key (kbd "s-z") 'undo)

(provide 'init-keymap)

;;; init-keymap.el ends here
