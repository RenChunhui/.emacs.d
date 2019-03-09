;;; init-startup.el --- customuration startup screen -*- lexical-binding: t -*-
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

(defconst tea-emacs-buffer-name "*GNU Emacs*"
  "The name of the EMACS buffer.")

(defconst tea-emacs-buffer-logo-title "Welcome to GNU Emacs!"
  "The title displayed beneath the logo.")

(defconst tea-emacs-buffer--window-width 80
  "Current width of the home buffer if responsive, 80 otherwise.
See `tea-emacs-startup-buffer-responsive'.")

(defvar tea-emacs-buffer--last-width nil
  "Previous width of emacs-buffer.")

(defvar tea-emacs-buffer--note-widgets nil
  "List of widgets used in currently inserted notes.
Allows to keep track of widgets to delete when removing them.")

(defun emacs-buffer/set-mode-line (format &optional redisplay)
  "Set mode-line format for Emacs buffer.
FORMAT: the `mode-line-format' variable Emacs will use to build the mode-line.
If REDISPLAY is non-nil then force a redisplay as well"
  (with-current-buffer (get-buffer-create tea-emacs-buffer-name)
    (setq mode-line-format format)))
  ;;(when redisplay (emacs//redisplay)))

(defun emacs-buffer/append (msg &optional messagebuf)
  "Append MSG to Emacs buffer.
If MESSAGEBUF is not nil then MSG is also written in message buffer."
  (with-current-buffer (get-buffer-create tea-emacs-buffer-name)
    (goto-char (point-max))
    (let ((buffer-read-only nil))
      (insert msg)
      (when messagebuf
	(message "(Emacs) %s" msg)))))

(defun emacs-buffer//get-buffer-width ()
  "Return the length of longest line in the current buffer."
  (save-excursion
    (goto-char 0)
    (let ((current-max 0))
      (while (not (eobp))
	(let ((line-length (-(line-end-position) (line-beginning-position))))
	  (if (< current-max line-length)
	      (setq current-max line-length)))
	(forward-line 1))
      current-max)))

(defun emacs-buffer//center-line (&optional real-width)
  "When point is at the end of a line, center it.
REAL-WIDTH: the real width of the line.  If the line contains an image, the size
            of that image will be considered to be 1 by the calculation method
            used in this function.  As a consequence, the caller must calculate
            himself the correct length of the line taking into account the
            images he inserted in it."
  (let* ((width (or real-width (current-column)))
	 (margin (max 0 (floor (/ (- tea-emacs-buffer--window-width
				     width)
				  2)))))
    (beginning-of-line)
    (insert (make-string margin ?\s))
    (end-of-line)))

(defun emacs-buffer//insert-logo ()
  "Display logo image."
  (let* ((title tea-emacs-buffer-logo-title)
	 (spec (create-image "~/.emacs.d/assets/logo.png"))
	 (size (image-size spec))
	 (width (car size))
	 (left-margin (max 0 (floor (- tea-emacs-buffer--window-width width) 2))))
    (goto-char (point-min))
    (insert "\n")
    (insert (make-string left-margin ?\s))
    (insert-image spec)
    (insert "\n\n")
    (insert (make-string (max 0 (floor (/ (- tea-emacs-buffer--window-width
					     (+ (length title) 1)) 2))) ?\s))
    (insert (format "%s\n\n" title))))

(defun emacs-buffer//insert-loaded-time (start-time)
  "Display a summary of loading time.
START-TIME"
  (unless tea-emacs-startup-time
    (setq tea-emacs-startup-time
	  (float-time (time-subtract (current-time) emacs-start-time))))
  (emacs-buffer/append
   (format "%s packages loaded in %.03fs"
	   (length package-activated-list)
	   tea-emacs-startup-time
	   )))

(defun emacs-buffer//insert-agenda (list-size)
  "Add the list of LIST-SIZE items of agenda."
  (if (and (boundp 'show-week-agenda-p) show-week-agenda-p)
      ))

(defun emacs-buffer/goto-buffer (&optional refresh)
  "Create the special buffer for `emacs-buffer-mode' and switch to it.
REFRESH if the buffer should be redrawn."
  (interactive)
  (let ((buffer-exists (buffer-live-p (get-buffer tea-emacs-buffer-name)))
	(save-line nil))
    (when (not buffer-exists)
      (setq tea-emacs-buffer--note-widgets nil))
    (when (or (not (eq tea-emacs-buffer--last-width (window-width)))
	      (not buffer-exists)
	      refresh)
      (setq tea-emacs-buffer--window-width (if tea-emacs-startup-buffer-responsive
					       (window-width)
					     80)
	    tea-emacs-buffer--last-width tea-emacs-buffer--window-width)
      (with-current-buffer (get-buffer-create tea-emacs-buffer-name)
	(save-excursion
	  (when (> (buffer-size) 0)
	    (set 'save-line (line-number-at-pos))
	    (let ((inhibit-read-only t))
	      (erase-buffer)))
	  (emacs-buffer//insert-logo)
	  (emacs-buffer//insert-loaded-time emacs-start-time)
	  (emacs-buffer//center-line)))
      (switch-to-buffer tea-emacs-buffer-name))))

(add-hook 'emacs-startup-hook 'emacs-buffer/goto-buffer)

(add-hook 'window-setup-hook
	  (lambda ()
	    (add-hook 'window-configuration-change-hook
		      'emacs-buffer//resize-on-hook)
	    (emacs-buffer//resize-on-hook)))

(defun emacs-buffer//resize-on-hook ()
  "Hook run on window resize events to redisplay the home buffer."
  (let ((home-buffer (get-buffer-window tea-emacs-buffer-name))
	(frame-win (frame-selected-window)))
    (when (and tea-emacs-startup-buffer-responsive
	       home-buffer
	       (not (window-minibuffer-p frame-win)))
      (with-selected-window home-buffer
	(emacs-buffer/goto-buffer)))))


;; (add-hook 'emacs-startup-hook 'emacs/init-startup-screen)

;; (add-hook 'window-setup-hook
;; 	  (lambda ()
;; 	    (add-hook 'window-configuration-change-hook
;; 		      'emacs-buffer-refresh)
;; 	    (emacs-buffer-refresh)))

(defun emacs/init-startup-screen ()
  "Display fancy startup screen."
  (interactive)
  (let ((splash-buffer (get-buffer-create tea-emacs-buffer-name)))
    (with-current-buffer splash-buffer
      (emacs//insert-header))
    (switch-to-buffer splash-buffer)))

(defun emacs//insert-header ()
  "Display an image and welcome info."
    (let* ((title tea-emacs-buffer-logo-title)
           (spec (create-image "~/.emacs.d/assets/logo.png"))
           (size (image-size spec))
           (width (car size))
           (left-margin (max 0 (floor (- tea-emacs-buffer--window-width width) 2))))
      (goto-char (point-min))
      (insert "\n")
      (insert (make-string left-margin ?\s))
      (insert-image spec)
      (insert "\n\n")
      (insert (make-string (max 0 (floor (/ (- tea-emacs-buffer--window-width
                                               (+ (length title) 1)) 2))) ?\s))
      (insert (format "%s\n\n" title))))

(provide 'init-startup)

;;; init-startup.el ends here
