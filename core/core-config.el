;; 自定义常量初使化值

(defvar emacs-maximized-at-startup t)

(defconst emacs-cache-directory
  (expand-file-name (concat user-emacs-directory ".cache/"))
  "Emacs storage area for persistent files")

(provide 'core-config)