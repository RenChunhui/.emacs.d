;;; init-styles.el --- styles configuration -*- coding: utf-8; lexical-binding: t -*-
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;;; Code:

(defvar logo-color
  '(
    ("html" . "#E44D26")
    ("css" . "#ebebeb")
    ("scss" . "#cd6799")
    ("javascript" . "#f5de19")
    ("typescript" . "#007acc")
    ("json" . "#f5de19")
    ("yaml" . "#fbc02d")
    ("markdown" . "#755838")
    ("org" . "#77AA99")
    ("elisp" . "#A52ECB")))


(defvar icon-list
  '(
      ("c" . "\xe61e")
      ("cpp" . "\xe61d")
      ("html5" . "\xe736")
      ("css3" . "\xe749")

      ;; Folder
      ("folder" . "\xe5ff")
      ("folder_config" . "\xe5fc")
      ("folder_git" . "\xe5fb")
      ("folder_git_branch" . "\xe5fb")
      ("folder_github" . "\xe5fd")
      ("folder_npm" . "\xe5fa")
      ("folder_open" . "\xe5fe")

      ;; System
      ("windows" . "\xe70f")
      ("android" . "\xe70e")
      ("apple" . "\xe711")

      ("angular" . "\xe753")
      
      ("docker" . "\xe7b0")
      ("firefox" . "\xe745")
      ("git" . "\xe702")
      ("git_branch" . "\xe725")
      ("git_commit" . "\xe729")
      ("git_compare" . "\xe728")
      ("git_merge" . "\xe727")
      ("git_pull_request" . "\xe726")

      ("github" . "\xe70a")
      ("github_alt" . "\xe708")
      ("github_badge" . "\xe709")
      ("gnu" . "\xe779")

      ("grunt" . "\xe74c")
      ("gulp" . "\xe763")
      
      ("ie" . "\xe744")
      ("ionic" . "\xe7a9")
      ("javascript" . "\xe74e")
      ("jquery" . "\xe750")
      ("linux" . "\xe712")
      ("markdown" . "\xe73e")
      ("mitlicence" . "\xe78b")
      ("netbeans" . "\xe79b")
      ("nodejs" . "\xe719")
      ("nodejs_small" . "\xe718")
      ("npm" . "\xe71e")
      ("ruby" . "\xe739")
      ("swift" . "\xe755")
      ("terminal" . "\xe795")
      ("terminal_badge" . "\xe7a2")
      ("vim" . "\xe7c5")
      ("yeoman" . "\xe77a")
      ("disable" . "\xf05e")

      ;; Battery
      ("battery" . "\xf240")
      ("battery_0" . "\xf244")
      ("battery_1" . "\xf243")
      ("battery_2" . "\xf242")
      ("battery_3" . "\xf241")
      ("battery_4" . "\xf240")
      ("battery_empty" . "\xf244")
      ("battery_full" . "\xf240")
      ("battery_half" . "\xf242")
      ("battery_quarter" . "\xf243")
      ("battery_three_quarters" . "\xf241")

      ("beer" . "\xf0fc")
      ("bitbucket" . "\xf171")
      ("book" . "\xf02d")
      ("bookmark" . "\xf02e")
      ("bookmark_o" . "\xf097")
      ("bug" . "\xf188")
      ("calendar" . "\xf073")
      ("check" . "\xf00c")
      ("close" . "\xf00d")
      ("code_fork" . "\xf126")
      ("codepen" . "\xf1cb")
      ("codiepie" . "\xf284")
      ("cube" . "\xf1b2")
      ("cubes" . "\xf1b3")
      ("dashboard" . "\xf0e4")
      ("diamond" . "\xf219")
      ("file" . "\xf15b")
      ("file_text" . "\xf15c")
      ("filter" . "\xf0b0")
      ("flask" . "\xf0c3")
      ("heart" . "\xf004")
      ("heart_o" . "\xf08a")
      ("history" . "\xf1da")
      ("photo" . "\xf03e")
      ("plane" . "\xf072")
      ("star" . "\xf005")
      ("star_half" . "\xf089")
      ("star_half_empty" . "\xf123")
      ("tag" . "\xf02b")
      ("tags" . "\xf02c")
      ("tasks" . "\xf0ae")

      ;; Apple keyboard
      ("apple_keyboard_command" . "\xfb32")
      ("apple_keyboard_control" . "\xfb33")
      ("apple_keyboard_option" . "\xfb34")
      ("apple_keyboard_shift" . "\xfb35")

      ("emoticon" . "\xf6f1")
      ("emoticon_cool" . "\xf6f2")
      ("emoticon_dead" . "\xfb99")
      ("emoticon_devil" . "\xf6f3")
      ("emoticon_excited" . "\xfb9a")
      ("emoticon_happy" . "\xf6f4")
      ("emoticon_neutral" . "\xf6f5")
      
      ("favicon" . "\xe623")
      ("default" . "\xe612")
      ("" . "\x")
      ("" . "\x")
      ("" . "\x")
      ("" . "\x")
      ("" . "\x")
      ("" . "\x")
      ("" . "\x")
      ("" . "\x")
      ("" . "\x")
      ("" . "\x")
      ("" . "\x")
      ("" . "\x")
      ("" . "\x")
      ))

(provide 'init-styles)

;;; init-styles.el ends here
