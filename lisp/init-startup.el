;;; init-startup.el --- startup configuration -*- coding: utf-8; lexical-binding: t -*-
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;;; Code:

(defconst emacs-buffer-name "*GNU Emacs*"
  "The name of the EMACS buffer.")

(defconst emacs-buffer-title "Welcome to GNU Emacs!"
  "The title displayed.")

(defconst emacs-buffer--window-width 80
  "Current width of the home buffer if responsive,80 otherwise.")

(defconst emacs-start-time (current-time))

(defvar emacs-startup-time nil
  "Emacs full startup duration.")

(defvar emacs-startup-buffer-responsive t
  "Not nil if the home buffer should respond to resize events.")

(defvar emacs-buffer--last-width nil
  "Previous width of emacs-buffer.")

(provide 'init-startup)

;;; init-startup.el ends here
