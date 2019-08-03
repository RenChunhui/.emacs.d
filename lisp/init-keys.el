;;; init-keys.el --- Emacs keys basic -*- coding: utf-8; lexical-binding: t -*-
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;;; Code:

(progn
  (global-set-key (kbd "M-f") 'find-file)
  (global-set-key (kbd "M-s") 'save-buffer)
  (global-set-key (kbd "M-w") 'kill-buffer)

  (global-set-key (kbd "M-c") 'kill-ring-save)
  (global-set-key (kbd "M-x") 'kill-region)
  (global-set-key (kbd "M-v") 'yank))

(provide 'init-keys)

;;; init-keys.el ends here
