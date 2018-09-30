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

;; 标记 calendar 上有 diary 的日期
(setq-default mark-diary-entries-in-calendar t)

;; 设置星期一为每周的第一天
(setq-default calendar-week-start-day 1)

;; 让calendar自动标记出节假日的日期
(setq-default calendar-mark-holidays-flag t)

;; 让calendar自动标记出记有待办事项的日期
(setq-default calendar-mark-diary-entries-flag t)

;; 在mode-line上显示还有多少分钟到约会的倒计时
(setq-default appt-display-mode-line t)

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
