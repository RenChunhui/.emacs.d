;;; init-company.el --- company mode configuration -*- lexical-binding: t -*-
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

(require 'company)

(defvar company-etags-update-interval 1800
  "The interval (seconds) to update candidate cache.
Function `tags-completion-table' sets up variable `tags-completion-table'
by parsing tags files.
The interval stops the function being called too frequently.")

(defvar company-etags-timer nil
  "Timer to avoid calling function `tags-completion-table' too frequently.")

(add-hook 'after-init-hook 'global-company-mode)

(eval-after-load 'company
  '(progn
     (setq company-idle-delay 0.1
	   company-show-numbers t
	   company-tooltip-limit 10
	   company-minimum-prefix-length 1)))

(eval-after-load 'company-etags
  '(progn
     ;; insert major-mode not inherited from prog-mode
     ;; to make company-etags work
     (defadvice company-etags--candidates (around company-etags--candidates-hack activate)
       (let* ((prefix (car (ad-get-args 0)))
              (tags-table-list (company-etags-buffer-table))
              (tags-file-name tags-file-name)
              (completion-ignore-case company-etags-ignore-case))
         (and (or tags-file-name tags-table-list)
              (fboundp 'tags-completion-table)
              (save-excursion
                (unless (and company-etags-timer
                             tags-completion-table
                             (> (length tags-completion-table) 0)
                             (< (- (float-time (current-time)) (float-time company-etags-timer))
                                company-etags-update-interval))
                  (setq company-etags-timer (current-time))
                  ;; `visit-tags-table-buffer' will check the modified time of tags file. If it's
                  ;; changed, the tags file is reloaded.
                  (visit-tags-table-buffer))
                ;; In function `tags-completion-table', cached variable `tags-completion-table' is
                ;; accessed at first. If the variable is empty, it is set by parsing tags file
                (all-completions prefix (tags-completion-table))))))

     (add-to-list 'company-etags-modes 'web-mode)))

(setq hippie-expand-try-function-list '(try-expand-debbrev
					try-expand-debbrev-all-buffers
					try-expand-debbrev-from-kill
					try-complete-file-name-partially
					try-complete-file-name
					try-expand-all-abbrevs
					try-expand-list
					try-expand-line
					try-complete-lisp-symbol-partially
					try-complete-lisp-symbol))
          
(global-set-key (kbd "s-/") 'hippie-expand)

(provide 'init-company)

;;; init-company.el ends here
