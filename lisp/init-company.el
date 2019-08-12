(require 'company)

(add-hook 'after-init-hook 'global-company-mode)
(eval-after-load 'company
  '(progn
     (setq company-idle-delay 0.2
	   company-show-numbers nil
	   company-tooltip-limit 10
	   company-minimum-prefix-length 2)))

(provide 'init-company)

;;; init-company.el ends here
