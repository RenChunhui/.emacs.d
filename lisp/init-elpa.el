;;; init-elpa.el --- settings and helpers for package.el -*- lexical-binding: t -*-
;;
;; Copyright (c) 2019 Chunhui Ren
;;
;; Author : Chunhui Ren <renchunhui2008@gmail.com>
;; URL    : https://github.com/renchunhui/.emacs.d
;; Version: 1.0.0
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;;; Code:

(require 'package)

(setq package--init-file-ensured t
      package-user-dir (expand-file-name "elpa" emacs-cache-directory)
      package-enable-at-startup nil
      package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("melpa-stable" . "https://stable.melpa.org/packages/")
			 ("gnu" . "https://elpa.gnu.org/packages/")))

(package-initialize)

(defun require-package (package &optional min-version no-refresh)
  "Install given PACKAGE, optionally requiring MIN-VERSION.
If NO-REFRESH is non-nil, the available package lists will not be
re-downloaded in order to locate PACKAGE."
  (or (package-installed-p package min-version)
      (let* ((known (cdr (assoc package package-archive-contents)))
	     (versions (mapcar #'package-desc-version known)))
	(if (cl-find-if (lambda (v) (version-list-<= min-version v)) versions)
	    (package-install package)
	  (if no-refresh
	      (error "No version of %s >= %S is available" package min-version)
	    (package-refresh-contents)
	    (require-package package min-version t))))))

(defun maybe-require-package (package &optional min-version no-refresh)
  "Try to install PACKAGE, and return non-nil if successful.
In the event of failure, return nil and print a warning message.
Optionally require MIN-VERSION.  If NO-REFRESH is non-nil, the
available package lists will not be re-downloaded in order to
locate PACKAGE."
  (condition-case err
      (require-package package min-version no-refresh)
    (error
     (message "Couldn't install optional package `%s': %S" package err)
     nil)))

(provide 'init-elpa)

;;; init-elpa.el ends here
