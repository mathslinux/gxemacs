;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; UI config file
;; Time-stamp: <2011-08-22-14:42:56 by mathslinux>
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Font setting
;; Setting english font
(set-face-attribute 
 'default nil :family "Monaco" :slant 'normal :weight 'normal :height 120 :width 'normal)

;; Setting chinese font
(set-fontset-font
    (frame-parameter nil 'font)
    'han
    (font-spec :family "微软雅黑" :slant 'normal :weight 'normal :width 'normal :size 16))


;; Theme setting
(require 'color-theme)
(load "color-theme-blackboard.el")
(color-theme-blackboard)

;; 顯示行號和列號
(setq line-number-mode t)
(setq column-number-mode t)		; has been openned
(global-linum-mode t)			; show line number

;; 顯示標籤
(require 'tabbar)
(tabbar-mode t)

(tool-bar-mode -1)
