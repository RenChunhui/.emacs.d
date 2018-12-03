(cua-mode 1)

;; 全选
(global-set-key (kbd "s-a") 'mark-whole-buffer-buffer)

;; 查找
(global-set-key (kbd "s-f") 'isearch-forward)

;; 保存
(global-set-key (kbd "s-s") 'save-buffer)

;; 粘贴
(global-set-key (kbd "s-v") 'yank)

(provide 'core-keymap)
