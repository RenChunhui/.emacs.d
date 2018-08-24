(defconst emacs/system-is-mac
  (eq system-type 'darwin)
  "Running a macOS version of Emacs.")

(defconst emacs/system-is-linux
  (eq system-type 'gnu/linux)
  "Running a GNU/Linux version of Emacs.")

(defconst emacs/system-is-windows
  (eq system-type 'windows-nt)
  "Running a native Microsoft Windows version of Emacs.")

(provide 'core-environment)

;;; core-environment.el ends here
