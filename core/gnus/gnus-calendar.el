;;; gnus-calendar.el --- calendar
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

;; 设置农历显示
(setq-default chinese-calendar-celestial-stem
          ["甲" "乙" "丙" "丁" "戊" "己" "庚" "辛" "壬" "癸"]
          chinese-calendar-terrestrial-branch
          ["子" "丑" "寅" "卯" "辰" "巳" "午" "未" "申" "酉" "戌" "亥"])

;; 格式化星期和月份
(setq-default calendar-week-start-day 0
	      calendar-day-name-array ["日" "一" "二" "三" "四" "五" "六"]
              calendar-month-name-array ["一月" "二月" "三月" "四月" "五月" "六月" "七月" "八月" "九月" "十月" "十一月" "十二月"])

;; 关注的节日
(setq-default calendar-holidays
	      '((holiday-fixed 1 1 "元旦节")
          (holiday-fixed 2 14 "情人节")
          (holiday-fixed 5 1  "国庆节")
          (holiday-float 5 0 2 "母亲节")
          (holiday-fixed 10 1 "国庆节")
          (holiday-fixed 12 25 "圣诞节")
          (holiday-chinese 1 15 "元宵节")
          (holiday-chinese 5 5  "端午节")
          (holiday-chinese 8 15 "中秋节")))

(defvar chinese-date-diary-pattern
  `((year "年" month "月" day "日")))

(setq-default diary-date-forms chinese-date-diary-pattern)

(provide 'gnus-calendar)

;;; gnus-calendar.el ends here
