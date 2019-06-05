;;; init-company.el --- company mode configuration -*- lexical-binding: t -*-
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
  :hook (emacs-startup . global-company-mode)
  :init
  (progn
    (setq company-idle-delay            0.2
	  company-show-numbers          nil
	  company-tooltip-limit         10
	  company-minimum-prefix-length 2)))

(when *quickhelp-enable*
  (use-package company-quickhelp
    :after (company)
    :commands (company-quickhelp-manual-begin)
    :config
    (company-quickhelp-mode)))

(when *company-box-enable*
  (use-package company-box
    :defer    t
    :after (all-the-icons company)
    :hook (company-mode . company-box-mode)
    :init
    (setq company-box-icons-alist 'company-box-icons-all-the-icons)
    :config
    (setq company-box-backends-colors '((company-lsp      . "#e0f9b5")
                                        (company-elisp    . "#e0f9b5")
                                        (company-files    . "#ffffc2")
                                        (company-keywords . "#ffa5a5")
                                        (company-capf     . "#bfcfff")
                                        (company-dabbrev  . "#bfcfff")))
    (setq company-box-icons-unknown (concat (all-the-icons-material "find_in_page") " "))
    (setq company-box-icons-elisp
          (list
           (concat (all-the-icons-faicon "tag") " ")
           (concat (all-the-icons-faicon "cog") " ")
           (concat (all-the-icons-faicon "cube") " ")
           (concat (all-the-icons-material "color_lens") " ")))
    (setq company-box-icons-yasnippet (concat (all-the-icons-faicon "bookmark") " "))
    (setq company-box-icons-lsp
          `((1 .  ,(concat (all-the-icons-faicon   "text-height")    " ")) ;; Text
            (2 .  ,(concat (all-the-icons-faicon   "tags")           " ")) ;; Method
            (3 .  ,(concat (all-the-icons-faicon   "tag" )           " ")) ;; Function
            (4 .  ,(concat (all-the-icons-faicon   "tag" )           " ")) ;; Constructor
            (5 .  ,(concat (all-the-icons-faicon   "cog" )           " ")) ;; Field
            (6 .  ,(concat (all-the-icons-faicon   "cog" )           " ")) ;; Variable
            (7 .  ,(concat (all-the-icons-faicon   "cube")           " ")) ;; Class
            (8 .  ,(concat (all-the-icons-faicon   "cube")           " ")) ;; Interface
            (9 .  ,(concat (all-the-icons-faicon   "cube")           " ")) ;; Module
            (10 . ,(concat (all-the-icons-faicon   "cog" )           " ")) ;; Property
            (11 . ,(concat (all-the-icons-material "settings_system_daydream") " ")) ;; Unit
            (12 . ,(concat (all-the-icons-faicon   "cog" )           " ")) ;; Value
            (13 . ,(concat (all-the-icons-material "storage")        " ")) ;; Enum
            (14 . ,(concat (all-the-icons-material "closed_caption") " ")) ;; Keyword
            (15 . ,(concat (all-the-icons-faicon   "bookmark")       " ")) ;; Snippet
            (16 . ,(concat (all-the-icons-material "color_lens")     " ")) ;; Color
            (17 . ,(concat (all-the-icons-faicon   "file-text-o")    " ")) ;; File
            (18 . ,(concat (all-the-icons-material "refresh")        " ")) ;; Reference
            (19 . ,(concat (all-the-icons-faicon   "folder-open")    " ")) ;; Folder
            (20 . ,(concat (all-the-icons-material "closed_caption") " ")) ;; EnumMember
            (21 . ,(concat (all-the-icons-faicon   "square")         " ")) ;; Constant
            (22 . ,(concat (all-the-icons-faicon   "cube")           " ")) ;; Struct
            (23 . ,(concat (all-the-icons-faicon   "calendar")       " ")) ;; Event
            (24 . ,(concat (all-the-icons-faicon   "square-o")       " ")) ;; Operator
            (25 . ,(concat (all-the-icons-faicon   "arrows")         " "))) ;; TypeParameter
          )))

(provide 'init-completion)

;;; init-completion.el ends here
