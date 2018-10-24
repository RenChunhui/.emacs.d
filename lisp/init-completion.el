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
  :defer t
  :init
  (progn
    (setq company-idle-delay 0.2
	  company-minimum-prefix-length 2
	  company-require-match nil)
    (add-hook 'after-init-hook 'global-company-mode)))

(use-package yasnippet
  :ensure t
  :init
  (setq yas-snippet-dirs
	'("~/.emacs.d/private/snippets"))
  (yas-global-mode 1)
  :config
  (yas-reload-all)
  (global-set-key (kbd "M-/") 'company-yasnippet))

(use-package which-key
  :ensure t
  :init
  (progn
    (setq which-key-allow-multiple-replacements t)
    (setq which-key-replacement-alist
	  '(
	    (("SPC" . nil) . ("␣" . nil))
	    (("TAB" . nil) . ("⇥" . nil))
	    (("RET" . nil) . ("↩" . nil))
	    (("ESC" . nil) . ("⎋" . nil))
	    (("DEL" . nil) . ("⌫" . nil))

	    (("SPC f" . nil) . ("Files" . nil))

	    (("C-" . nil) . ("⌃" . nil))
	    (("M-" . nil) . ("⌥" . nil))
	    (("s-" . nil) . ("⌘" . nil))))
    (which-key-add-key-based-replacements
      "SPC f" "files"
      "SPC s" "search"
      "SPC o" "org mode"
      "SPC p" "project"))
  :config
  (progn
    (which-key-mode)))


(provide 'init-completion)

;;; init-completion.el ends here
