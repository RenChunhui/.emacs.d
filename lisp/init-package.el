;;; init-package.el --- init package
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

(require 'package)

(setq package--init-file-ensured t
      package-user-dir (expand-file-name "elpa" tea-emacs-cache-directory)
      package-enable-at-startup nil
      package-archives '(("melpa" . "http://elpa.emacs-china.org/melpa/")
			 ("gnu"   . "http://elpa.emacs-china.org/gnu/")))

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(provide 'init-package)

;;; init-package.el ends here
