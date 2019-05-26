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
  :ensure t
  :hook (emacs-startup . global-company-mode)
  :init
  (progn
    (setq company-idle-delay 0.1
	  company-show-numbers nil
	  company-tooltip-limit 10
	  company-minimum-prefix-length 1)))

(use-package company-box
  :ensure t
  :hook (company-mode . company-box-mode)
  :init
  (setq company-box-icons-lsp
      `(( 1  . ,(all-the-icons-faicon "file-text-o" :v-adjust -0.0575))     ; Text
        ( 2  . ,(all-the-icons-faicon "cube" :v-adjust -0.0575))            ; Method
        ( 3  . ,(all-the-icons-faicon "cube" :v-adjust -0.0575))            ; Function
        ( 4  . ,(all-the-icons-faicon "cube" :v-adjust -0.0575))            ; Constructor
        ( 5  . ,(all-the-icons-faicon "tag" :v-adjust -0.0575))             ; Field
        ( 6  . ,(all-the-icons-faicon "tag" :v-adjust -0.0575))             ; Variable
        ( 7  . ,(all-the-icons-faicon "cog" :v-adjust -0.0575))             ; Class
        ( 8  . ,(all-the-icons-faicon "cogs" :v-adjust -0.0575))            ; Interface
        ( 9  . ,(all-the-icons-alltheicon "less"))                          ; Module
        (10  . ,(all-the-icons-faicon "wrench" :v-adjust -0.0575))          ; Property
        (11  . ,(all-the-icons-faicon "tag" :v-adjust -0.0575))             ; Unit
        (12  . ,(all-the-icons-faicon "tag" :v-adjust -0.0575))             ; Value
        (13  . ,(all-the-icons-material "content_copy" :v-adjust -0.2))     ; Enum
        (14  . ,(all-the-icons-faicon "tag" :v-adjust -0.0575))             ; Keyword
        (15  . ,(all-the-icons-material "content_paste" :v-adjust -0.2))    ; Snippet
        (16  . ,(all-the-icons-material "palette" :v-adjust -0.2))          ; Color
        (17  . ,(all-the-icons-faicon "file" :v-adjust -0.0575))            ; File
        (18  . ,(all-the-icons-faicon "tag" :v-adjust -0.0575))             ; Reference
        (19  . ,(all-the-icons-faicon "folder" :v-adjust -0.0575))          ; Folder
        (20  . ,(all-the-icons-faicon "tag" :v-adjust -0.0575))             ; EnumMember
        (21  . ,(all-the-icons-faicon "tag" :v-adjust -0.0575))             ; Constant
        (22  . ,(all-the-icons-faicon "cog" :v-adjust -0.0575))             ; Struct
        (23  . ,(all-the-icons-faicon "bolt" :v-adjust -0.0575))            ; Event
        (24  . ,(all-the-icons-faicon "tag" :v-adjust -0.0575))             ; Operator
        (25  . ,(all-the-icons-faicon "cog" :v-adjust -0.0575))             ; TypeParameter
        ))
  :config
  (setq company-box-backends-colors nil
            company-box-show-single-candidate t
            company-box-max-candidates 50
            company-box-doc-delay 0.5))

(provide 'init-completion)

;;; init-completion.el ends here
