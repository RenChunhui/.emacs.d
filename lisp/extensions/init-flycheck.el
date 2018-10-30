(use-package flycheck
  :defer t
  :init
  (progn
    (setq flycheck-standard-error-navigation nil
	    flycheck-global-modes nil)
    (global-flycheck-mode 1)))

(provide 'init-flycheck)
