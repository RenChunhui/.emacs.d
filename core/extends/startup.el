(add-hook 'after-init-hook
          (lambda ()
            (org-agenda nil "a")
            (delete-other-windows)))

(provide 'startup)