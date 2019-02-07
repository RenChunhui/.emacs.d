(cua-mode 1)

;; Select all. was move-beginning-of-line
(global-set-key (kbd "s-a") 'mark-whole-buffer-buffer)

;; Find. was forward-char
(global-set-key (kbd "s-f") 'isearch-forward)

;; Open
(global-set-key (kbd "s-o") 'ido-find-file)

;; Save
(global-set-key (kbd "s-s") 'save-buffer)

;; Save as.
(global-set-key (kbd "s-S-s") 'write-file)

;; Paste
(global-set-key (kbd "s-v") 'yank)

;; Close buffer
(global-set-key (kbd "s-w") 'kill-buffer)

;; Redo
(global-set-key (kbd "s-y") 'redo)

;; Undo
(global-set-key (kbd "s-z") 'undo)

(provide 'core-keymap)
