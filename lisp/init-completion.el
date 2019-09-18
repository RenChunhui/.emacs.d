(use-package company
  :hook ((emacs-lisp-mode
	  web-mode
	  css-mode
	  scss-mode
	  typescript-mode
	  rust-mode) . company-mode)
  :diminish company-mode
  :init
  (progn
    (setq company-idle-delay            0.2
	  company-show-numbers          nil
	  company-tooltip-limit         10
	  company-minimum-prefix-length 2)))

(use-package company-box
  :hook (company-mode . company-box-mode)
  :config
  (progn
    (setq company-box-show-single-candidate t
	  company-box-backends-colors nil
	  company-box-max-candidates 50
	  company-box-icons-alist 'company-box-icons-all-the-icons
	  company-box-icons-all-the-icons
	  `((Unknown       . ,(all-the-icons-material "find_in_page"             :height 0.8 :face 'all-the-icons-purple))
	    (Text          . ,(all-the-icons-material "text_fields"              :height 0.8 :face 'all-the-icons-green))
	    (Method        . ,(all-the-icons-material "functions"                :height 0.8 :face 'all-the-icons-red))
	    (Function      . ,(all-the-icons-material "functions"                :height 0.8 :face 'all-the-icons-red))
	    (Constructor   . ,(all-the-icons-material "functions"                :height 0.8 :face 'all-the-icons-red))
	    (Field         . ,(all-the-icons-material "functions"                :height 0.8 :face 'all-the-icons-red))
	    (Variable      . ,(all-the-icons-material "adjust"                   :height 0.8 :face 'all-the-icons-blue))
	    (Class         . ,(all-the-icons-material "class"                    :height 0.8 :face 'all-the-icons-red))
	    (Interface     . ,(all-the-icons-material "settings_input_component" :height 0.8 :face 'all-the-icons-red))
	    (Module        . ,(all-the-icons-material "view_module"              :height 0.8 :face 'all-the-icons-red))
	    (Property      . ,(all-the-icons-material "settings"                 :height 0.8 :face 'all-the-icons-red))
	    (Unit          . ,(all-the-icons-material "straighten"               :height 0.8 :face 'all-the-icons-red))
	    (Value         . ,(all-the-icons-material "filter_1"                 :height 0.8 :face 'all-the-icons-red))
	    (Enum          . ,(all-the-icons-material "plus_one"                 :height 0.8 :face 'all-the-icons-red))
	    (Keyword       . ,(all-the-icons-material "filter_center_focus"      :height 0.8 :face 'all-the-icons-red))
	    (Snippet       . ,(all-the-icons-material "short_text"               :height 0.8 :face 'all-the-icons-red))
	    (Color         . ,(all-the-icons-material "color_lens"               :height 0.8 :face 'all-the-icons-red))
	    (File          . ,(all-the-icons-material "insert_drive_file"        :height 0.8 :face 'all-the-icons-red))
	    (Reference     . ,(all-the-icons-material "collections_bookmark"     :height 0.8 :face 'all-the-icons-red))
	    (Folder        . ,(all-the-icons-material "folder"                   :height 0.8 :face 'all-the-icons-red))
	    (EnumMember    . ,(all-the-icons-material "people"                   :height 0.8 :face 'all-the-icons-red))
	    (Constant      . ,(all-the-icons-material "pause_circle_filled"      :height 0.8 :face 'all-the-icons-red))
	    (Struct        . ,(all-the-icons-material "streetview"               :height 0.8 :face 'all-the-icons-red))
	    (Event         . ,(all-the-icons-material "event"                    :height 0.8 :face 'all-the-icons-red))
	    (Operator      . ,(all-the-icons-material "control_point"            :height 0.8 :face 'all-the-icons-red))
	    (TypeParameter . ,(all-the-icons-material "class"                    :height 0.8 :face 'all-the-icons-red))
	    (Yasnippet     . ,(all-the-icons-material "short_text"               :height 0.8 :face 'all-the-icons-green))
	    (ElispFunction . ,(all-the-icons-material "functions"                :height 0.8 :face 'all-the-icons-red))
	    (ElispVariable . ,(all-the-icons-material "check_circle"             :height 0.8 :face 'all-the-icons-blue))
	    (ElispFeature  . ,(all-the-icons-material "stars"                    :height 0.8 :face 'all-the-icons-orange))
	    (ElispFace     . ,(all-the-icons-material "format_paint"             :height 0.8 :face 'all-the-icons-pink))))))

(use-package yasnippet
  :diminish yas-minor-mode
  :hook ((emacs-lisp-mode
	  js2-mode
	  web-mode
	  css-mode
	  scss-mode
	  typescript-mode) . yas-minor-mode)
  :diminish yas-minor-mode
  :init
  (setq yas-snippet-dirs '("~/.emacs.d/snippets"))
  :config
  (yas-reload-all)
  (global-set-key (kbd "M-/") 'company-yasnippet))
  
(provide 'init-completion)
