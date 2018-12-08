(setq-default mode-line-format
      (list
       " " mode-line-modified
       " %[" mode-line-buffer-identification "%] %l %6 "
       mode-line-misc-info
       mode-line-end-spaces))
(setq global-mode-string '((t jabber-activity-mode-string)
			  "" display-time-string appt-mode-string))
(provide 'core-modeline)