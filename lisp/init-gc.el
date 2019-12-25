(setq gc-cons-threshold 402653184
      gc-cons-percentage 0.6)

(add-hook 'emacs-startup-hook
	  (lambda ()
	    (setq gc-cons-threshold 16777216
		  gc-cons-percentage 0.1
		  file-name-handler-alist nil)))
