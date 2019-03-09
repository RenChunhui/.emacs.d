;;; init-hydra.el --- hydra configuration -*- lexical-binding: t -*-
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

(eval-when-compile
    (require 'evil))

(defhydra hydra-space (:color blue :hint nil :idle .2)
  "

   Vim Keymap:

    Find              Manage             Do                Mode
  ------------------------------------------------------------------------------
    _f_ File       _w_ Window      _s_ Search           _m_ Mode
    _b_ Buffer     _g_ Git         _R_ Refactor         _d_ Debug
    _r_ Recent     _p_ Project     _v_ Edit Init.el     _e_ Eval
    _n_ Sidebar    _y_ System      _o_ Org              _t_ Test
    _SPC_ Any      _U_ Undo        _u_ Universal Arg..  _=_ Format

"
  ("1" digit-argument)
  ("2" digit-argument)
  ("3" digit-argument)
  ("4" digit-argument)
  ("5" digit-argument)
  ("6" digit-argument)
  ("7" digit-argument)
  ("8" digit-argument)
  ("9" digit-argument)
  ("0" digit-argument)
  ("u" universal-argument)
  ("f" +find-file-dwim)
  ("b" +buffers-dwim)
  ("r" +recentf-dwim)
  ("w" hydra-window/body)
  ("-" split-window-below)
  ("|" split-window-right)
  ("\\" split-window-right)
  ("h" evil-window-left)
  ("l" evil-window-right)
  ("k" evil-window-up)
  ("j" evil-window-down)
  ("." evil-next-buffer)
  (">" evil-prev-buffer :color red)
  ("," evil-prev-buffer)
  ("<" evil-prev-buffer :color red)
  ("<backspace>" delete-window)
  ("DEL" delete-window) ;; For terminals.
  ("s" hydra-search/body)
  ("v" (lambda () (interactive) (find-file "~/.emacs.d/init.el")))
  ("U" undo-tree-visualize)
  ("x" kill-buffer)
  ("y" hydra-system/body)
  ("n" dired-sidebar-toggle-sidebar)
  ("p" matcha-projectile/body)
  ("g" +show-vc-hydra)
  ("SPC" counsel-fzf)
  ("RET" quickrun)
  (";" counsel-M-x)
  (":" eval-expression)
  ("o" hydra-org-space/body)
  ("S" +save-all-buffers)
  ("R" matcha-run-refactor-command)
  ("=" matcha-run-format-command)
  ("d" matcha-run-debug-command)
  ("m" matcha-run-mode-command)
  ("e" matcha-run-eval-command)
  ("t" matcha-run-test-command))

(use-package general
  :ensure t
  :config
  (setq general-override-states '(insert
                                  emacs
                                  hybrid
                                  normal
                                  visual
                                  motion
                                  operator
                                  replace))
  (general-override-mode)
  (general-define-key
   :states '(normal visual motion evilified)
   :keymaps 'override
   "SPC" 'hydra-space/body))

(provide 'init-hydra)

;;; init-hydra.el ends here
