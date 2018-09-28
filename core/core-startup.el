;;; core-startup.el --- startup
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


(defvar mage-init-time 'nil)
(defun emacs//display-summary()
  (message "%s packages loaded in %.03fs"
           (length package-activated-list)
           (or mage-init-time
               (setq mage-init-time
                     (float-time (time-subtract (current-time) before-init-time))))))
(add-hook 'emacs-startup-hook #'emacs//display-summary)

(defun spacemacs/setup-startup-hook ()
  "Add post init processing.")

(add-hook 'emacs-startup-hook 'emacs//fancy-startup-screen)

(defun emacs//fancy-startup-screen ()
  "Display fancy startup screen.
If CONCISE is non-nil, display a concise version of the
splash screen in another window."
  (let ((splash-buffer (get-buffer-create "*GNU Emacs*")))
    (with-current-buffer splash-buffer
      (emacs//fancy-splash-head)
      (emacs//fancy-startup-start))
    (switch-to-buffer splash-buffer)))

(defun emacs//fancy-splash-head ()
  (let* ((image-file "~/.emacs.d/assets/emacs.png")
   (title "Welcome to GNU Emacs.")
	 (spec (create-image image-file))
	 (image-width (and spec (car (image-size spec))))
	 (window-width (window-width)))
    (when spec
      (when (> window-width image-width)
	 (insert (propertize " " 'display
			    `(space :align-to (+ center (-0.5 . ,spec)))))
          (insert-image spec)
          (insert "\n\n")))))

(defun emacs//fancy-startup-start ()
  "Start."
  (insert "START\n")
  (fancy-splash-insert
   :link `("Open a File"
	   ,(lambda (_button) (call-interactively 'find-file))
	   "Specify a new file's name, to edit the file")
   "\n"
   :link `("Open Home Directory"
	   ,(lambda (_button) (dired "~"))
	   "Open you home directory, to operate on its files")
   "    "))

(provide 'core-startup)

;;; core-startup.el ends here
