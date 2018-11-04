(add-hook 'emacs-startup-hook 'emacs//fancy-startup-screen)

(defun emacs//fancy-startup-screen ()
  "Display fancy startup screen.
If CONCISE is non-nil, display a concise version of the
splash screen in another window."
  (let ((splash-buffer (get-buffer-create "*GNU Emacs*")))
    (with-current-buffer splash-buffer
      (emacs-buffer//fancy-splash-head))
    (switch-to-buffer splash-buffer)))

(defun emacs-buffer//fancy-splash-head ()
  (let* ((image-file "~/.emacs.d/assets/emacs.png")
	 (spec (create-image image-file))
	 (image-width (and spec (car (image-size spec))))
	 (window-width (window-width)))
    (when spec
      (when (> window-width image-width)
	(insert (propertize " " 'display
			    `(space :align-to (+ center (-0.5 . ,spec)))))
        (insert-image spec)
        (insert "\n\n")))))

(provide 'init-startup)
