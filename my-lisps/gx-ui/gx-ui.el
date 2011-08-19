;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; UI config file
;; Time-stamp: <2011-05-16-21:40:05 星期一 by geniux>
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 
;; 主題設置
(require 'color-theme)
(load-file (concat ui-config-path "/color-theme-blackboard.el"))
(color-theme-blackboard)

;; 顯示行號和列號
(setq line-number-mode t)
(setq column-number-mode t)		; has been openned
(global-linum-mode t)			; show line number

;; 顯示標籤
(require 'tabbar)
(tabbar-mode t)
