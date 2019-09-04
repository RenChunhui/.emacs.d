(use-package company
  :ensure t
  :hook (emacs-startup . global-company-mode)
  :diminish company-mode
  :init
  (progn
    (setq company-idle-delay            0.2
	  company-show-numbers          nil
	  company-tooltip-limit         10
	  company-minimum-prefix-length 2)))

(provide 'init-company)