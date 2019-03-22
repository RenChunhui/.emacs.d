;;; init-hydra.el --- hydra -*- lexical-binding: t -*-
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
;; a application
;; b buffer
;; e errors
;; f files
;; g git 
;; h help
;; o org
;; p project
;; q quit
;; r recent
;; s search
;; t toggle
;; w windows


;;; Code:

(use-package hydra
  :init
  (progn
    (setq hydra-is-helpful t
	  hydra-lv t
	  lv-use-separator t))
  :config
  (progn
    ;; Application
    (defhydra hydra-application (:color blue :hint nil)
      "Application")
    
    ;; Buffer
    (defhydra hydra-buffer (:color pink :hint nil)
      "
Buffer:

 ^Navigation^ | ^Mark^        | ^Actions^        | ^View^
-^----------^-+-^----^--------+-^-------^--------+-^----^-------
  _k_:    ʌ   | _m_: mark     | _D_: delete      | _g_: refresh
 _RET_: visit | _u_: unmark   | _S_: save        | _s_: sort
  _j_:    v   | _*_: specific | _a_: all actions | _/_: filter
-^----------^-+-^----^--------+-^-------^--------+-^----^-------
"
      ("j" ibuffer-forward-line)
      ("RET" ibuffer-visit-buffer :color blue)
      ("k" ibuffer-backward-line)

      ("m" ibuffer-mark-forward)
      ("u" ibuffer-unmark-forward)
      ("*" hydra-ibuffer-mark/body :color blue)

      ("D" ibuffer-do-delete)
      ("S" ibuffer-do-save)
      ("a" hydra-ibuffer-action/body :color blue)

      ("g" ibuffer-update)
      ("s" hydra-ibuffer-sort/body :color blue)
      ("/" hydra-ibuffer-filter/body :color blue)

      ("o" ibuffer-visit-buffer-other-window "other window" :color blue)
      ("q" quit-window "quit ibuffer" :color blue)
      ("." nil "toggle hydra" :color blue))

    (defhydra hydra-ibuffer-mark (:color teal :columns 5
					 :after-exit (hydra-buffer/body))
      "Mark"
      ("*" ibuffer-unmark-all "unmark all")
      ("M" ibuffer-mark-by-mode "mode")
      ("m" ibuffer-mark-modified-buffers "modified")
      ("u" ibuffer-mark-unsaved-buffers "unsaved")
      ("s" ibuffer-mark-special-buffers "special")
      ("r" ibuffer-mark-read-only-buffers "read-only")
      ("/" ibuffer-mark-dired-buffers "dired")
      ("e" ibuffer-mark-dissociated-buffers "dissociated")
      ("h" ibuffer-mark-help-buffers "help")
      ("z" ibuffer-mark-compressed-file-buffers "compressed")
      ("b" hydra-buffer/body "back" :color blue))

    (defhydra hydra-ibuffer-action (:color teal :columns 4
					   :after-exit
					   (if (eq major-mode 'ibuffer-mode)
					       (hydra-buffer/body)))
      "Action"
      ("A" ibuffer-do-view "view")
      ("E" ibuffer-do-eval "eval")
      ("F" ibuffer-do-shell-command-file "shell-command-file")
      ("I" ibuffer-do-query-replace-regexp "query-replace-regexp")
      ("H" ibuffer-do-view-other-frame "view-other-frame")
      ("N" ibuffer-do-shell-command-pipe-replace "shell-cmd-pipe-replace")
      ("M" ibuffer-do-toggle-modified "toggle-modified")
      ("O" ibuffer-do-occur "occur")
      ("P" ibuffer-do-print "print")
      ("Q" ibuffer-do-query-replace "query-replace")
      ("R" ibuffer-do-rename-uniquely "rename-uniquely")
      ("T" ibuffer-do-toggle-read-only "toggle-read-only")
      ("U" ibuffer-do-replace-regexp "replace-regexp")
      ("V" ibuffer-do-revert "revert")
      ("W" ibuffer-do-view-and-eval "view-and-eval")
      ("X" ibuffer-do-shell-command-pipe "shell-command-pipe")
      ("b" nil "back"))

    (defhydra hydra-ibuffer-sort (:color amaranth :columns 3)
      "Sort"
      ("i" ibuffer-invert-sorting "invert")
      ("a" ibuffer-do-sort-by-alphabetic "alphabetic")
      ("v" ibuffer-do-sort-by-recency "recently used")
      ("s" ibuffer-do-sort-by-size "size")
      ("f" ibuffer-do-sort-by-filename/process "filename")
      ("m" ibuffer-do-sort-by-major-mode "mode")
      ("b" hydra-buffer/body "back" :color blue))

    (defhydra hydra-ibuffer-filter (:color amaranth :columns 4)
      "Filter"
      ("m" ibuffer-filter-by-used-mode "mode")
      ("M" ibuffer-filter-by-derived-mode "derived mode")
      ("n" ibuffer-filter-by-name "name")
      ("c" ibuffer-filter-by-content "content")
      ("e" ibuffer-filter-by-predicate "predicate")
      ("f" ibuffer-filter-by-filename "filename")
      (">" ibuffer-filter-by-size-gt "size")
      ("<" ibuffer-filter-by-size-lt "size")
      ("/" ibuffer-filter-disable "disable")
      ("b" hydra-buffer/body "back" :color blue))

    ;; Dired
    (defhydra hydra-dired (:color blue :hint nil)
      "Dired")

    ;; Errors
    (defhydra hydra-errors (:color blue :hint nil)
      "Errors")
    
    ;; File
    (defhydra hydra-file (:color pink :hint nil)
      "
File:

 [_f_] Find file    [_F_] Format    [_r_] Rename    [_d_] Delete

 [_SPC_] Cancel
"
      ("f" counsel-find-file)
      ("F" indent-buffer)
      ("r" rename-this-file)
      ("d" delete-this-file)
      ("L" counsel-locate)
      ("SPC" nil))

    ;; Git
    (defhydra hydra-git (:color blue :hint nil)
      "
Git
")

    (defhydra hydra-help ()
      "Help")

    ;; Org
    (defhydra hydra-org (:color blue :hint nil)
      "
Org mode
")

    ;; Project
    (defhydra hydra-project (:color blue :hint nil)
      "
Project: %(projectile-project-root)

 [_f_] Find Finle       [_r_] Recent Files        [_o_] Cache Current File    [_x_] Remove Know Project
 [_d_] Find Directory   [_b_] Switch to Buffer    [_c_] Clear Cache           [_X_] Cleanup Known Projects
 [_o_] Multi Occur      [_s_] Switch Project      [_k_] Kill Buffers

 [_SPC_] Cancel
"
      ("f" projectile-find-file)
      ("r" projectile-recentf)
      ("z" projectile-cache-current-file)
      ("x" projectile-remove-known-project)
      
      ("d" projectile-find-dir)
      ("b" projectile-switch-to-buffer)
      ("c" projectile-invalidate-cache)
      ("X" projectile-cleanup-known-projects)
      
      ("o" projectile-multi-occur)
      ("s" projectile-switch-project)
      ("k" projectile-kill-buffers)
      
      ("SPC" nil))

    ;; Recent
    (defhydra hydra-recent (:color blue :hint nil)
      "
Recent
")

    ;; Search
    (defhydra hydra-search (:color blue :hint nil)
      "
Search
")
    ;; Toggle
    (defhydra hydra-toggle (:color blue :hint nil)
      "
Toggle
")

    ;; Window
    (defhydra hydra-window (:color blue :hint nil)
      "
Window

     ^Move^     ^Split^         ^Switch^		^Resize^
 ^^^^^^^^^^^^^─────────────────────────────────────────────────────────────────────────────
     ^_k_^      [_-_] Horizontal  [_f_] Find File 
     ^^↑^^      [_|_] Vertical	 
 _h_ ←   → _l_      
     ^^↓^^
     ^_j_^       	        	

 [_SPC_] Cancel   [_o_] Delete others    [_d_] Delete

"
      ("h" windmove-left)
      ("j" windmove-down)
      ("k" windmove-up)
      ("l" windmove-right)

      ("" foll)
      
      ("-" (lambda ()
	     (interactive)
	     (split-window-below)
	     (windmove-down)))
      ("|" (lambda ()
	     (interactive)
	     (split-window-right)
	     (windmove-right)))

      ("f" counsel-find-file)
      ("SPC" 'nil)
      ("o" 'delete-other-windows)
      ("d" 'delete-window))
    
    (defhydra hydra-space (:color blue :hint nil)
      "

Evil keymaps:

 [_a_] Application  [_b_] Buffer  [_d_] Dired   [_e_] Errors
 [_f_] File         [_g_] Git     [_r_] Recent  [_w_] Window
 [_o_] Org mode     [_s_] Search

 [_SPC_] Cancel     [_<F1>_] Help
"
      
      ("a" hydra-application/body)
      ("b" hydra-buffer/body)
      ("d" hydra-dired/body)
      ("e" hydra-errors/body)
      ("f" hydra-file/body)
      ("g" hydra-git/body)
      ("<F1>" hydra-help/body)
      ("o" hydra-org/body)
      ("p" hydra-project/body)
      ("SPC" nil)
      ("r" hydra-file/body)
      ("s" hydra-search/body)
      ("t" hydra-toggle/body)
      ("w" hydra-window/body)
      )
    ))

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
