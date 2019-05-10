(defun indent-buffer()
  (interactive)
  (indent-region (point-min) (point-max)))
       
(provide 'init-utils)