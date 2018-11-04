;;; init-chinese.el --- Chinese
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

(require 'pyim)
(require 'pyim-wbdict)
(require 'youdao-dictionary)

(pyim-wbdict-v98-enable)
(global-set-key (kbd "C-\\") 'toggle-input-method)

;; 启动时加载
(add-hook 'emacs-startup-hook
  #'(lambda ()
      (pyim-restart-1 t)))

(use-package youdao-dictionary
  :defer t
  :config
  (progn
    ;; Enable Cache
    (setq url-automatic-caching t
      ;; Set file path for saving search history
      youdao-dictionary-search-history-file
      (concat emacs-cache-directory ".youdao")
      ;; Enable Chinese word segmentation support
      youdao-dictionary-use-chinese-word-segmentation t)))

(use-package pyim
;;  :if (eq 'pinyin chinese-default-input-method)
  :init
  (progn
    (setq pyim-page-tooltip t
      pyim-default-scheme 'wubi
      pyim-directory (expand-file-name "pyim/" emacs-cache-directory)
      pyim-dcache-directory (expand-file-name "dcache/" pyim-directory)
      default-input-method "pyim")))

(provide 'init-chinese)

;;; init-chinese.el ends here
