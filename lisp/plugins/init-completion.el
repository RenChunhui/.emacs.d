;;; init-completion.el --- compl
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

(use-package company
  :ensure t
  :bind(("<C-tab>" . company-auto-complete)
	("C-/" . helm-complete))
  :init
  (progn
    (setq-default company-idle-delay 0.2
		  company-minimum-prefix-length 2
		  company-require-match nil
		  company-dabbrev-ignore-case nil
		  company-dabbrev-downcase nil)
    (add-hook 'company-completion-started-hook 'company-turn-off-fci)
    (add-hook 'company-completion-finished-hook 'company-maybe-turn-on-fci)
    (add-hook 'company-completion-cancelled-hook 'company-maybe-turn-on-fci))
  :config
  (global-company-mode)
  (setq company-idle-delay 0.1)
  (setq company-tooltip-limit 10)
  (setq company-minimum-prefix-length 2))

(use-package which-key
  :ensure t
  :config
  (which-key-mode))

(provide 'init-completion)

;;; init-completion.el ends here
