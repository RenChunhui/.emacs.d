

;;----------------------------------------------------------------------------
;; Display a summary of loading time.
;;----------------------------------------------------------------------------

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

(provide 'core-startup)
