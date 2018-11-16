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

(progn
 ;; make emacs use standard keys

  ;; Select All. was move-beginning-of-line
  (global-set-key (kbd "s-a") 'mark-whole-buffer-buffer)

  ;; Find. was forward-char
  (global-set-key (kbd "s-f") 'isearch-forward)

  ;; New. was next-line
  (global-set-key (kbd "s-n") 'xah-new-empty-buffer)

  ;; New Window. was nil
  (global-set-key (kbd "C-S-n") 'make-frame-command)

  ;; Open. was open-line
  (global-set-key (kbd "s-o") 'ido-find-file)

  ;; Save. was isearch-forward
  (global-set-key (kbd "s-s") 'save-buffer)

  ;; Save As. was nil
  (global-set-key (kbd "C-s-s") 'write-file)

  ;; Paste. was scroll-up-command
  (global-set-key (kbd "s-v") 'yank)

  ;; Close. was kill-region
  (global-set-key (kbd "s-w") 'kill-buffer)

  ;; Redo. was yank
  (global-set-key (kbd "s-y") 'redo)

  ;; Undo. was suspend-frame
  (global-set-key (kbd "s-z") 'undo)
  ;;
  )

(provide 'init-keymap)

;;; init-keymap.el ends here
