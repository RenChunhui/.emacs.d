;;; core-mode-line.el --- custom mode line.
;;
;; Copyright (c) 2018
;;
;; Author  : Chunhui Ren <renchunhui2008@gmail.com>
;; URL     : https://github.com/RenChunhui/.emacs.d
;; Version : 1.0.0

;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;;; Code:

(defun file-type-icon ()
  "This is file type icon."
  (cond
   ((string= major-mode "text-mode") "\xf40e")
   ((string= major-mode "makefile-mode") "\xe779")
   ((string= major-mode "json-mode") "\xe60b")
   ((string= major-mode "yaml-mode") "\xe612")
   ((string= major-mode "python-mode") "\xe73c")
   ((string= major-mode "css-mode") "\xe749")
   ((string= major-mode "scss-mode") "\xe603")
   ((string= major-mode "html-mode") "\xe736")
   ((string= major-mode "markdown-mode") "\xe73e")
   ((string= major-mode "gfm-mode" "\xe73e"))
   ((string= major-mode "org-mode") "\xe612")
   ((string= major-mode "js2-mode") "\xe74e")
   ((string= major-mode "js-mode") "\xe74e")
   ((string= major-mode "tern-mode") "\xe74e")
   ((string= major-mode "web-mode") "\xe736")))

(setq-default mode-line-format
	      (list
	       " %1"
	       '(:eval (propertize
			(file-type-icon)
			'face
			'font-lock-type-face))))

(provide 'core-mode-line)

;;; core-mode-line.el ends here
