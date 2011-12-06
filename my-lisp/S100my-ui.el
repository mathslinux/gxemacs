;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; UI config file
;; Time-stamp: <2011-12-06-14:06:45 星期二 by geniux>
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Font setting
;; Setting english font
(set-face-attribute 
 'default nil :family "Monaco" :slant 'normal :weight 'normal :height 120 :width 'normal)

(set-face-attribute
 'default nil :font "Monaco 13")

;; Setting chinese font
(set-fontset-font
    (frame-parameter nil 'font)
    'han
    (font-spec :family "微软雅黑" :slant 'normal :weight 'normal :width 'normal :size 15))


;; Theme setting
(require 'color-theme)
;; (load "color-theme-blackboard.el")
;; (color-theme-blackboard)
(color-theme-oswald)
;; (color-theme-rotor)

;; solarized theme
;; (require 'color-theme-solarized)
;; (color-theme-solarized-dark)]
;; (color-theme-solarized-light)

;; 顯示行號和列號
(setq line-number-mode t)
(setq column-number-mode t)		; has been openned
(global-linum-mode t)			; show line number

;; 顯示標籤
(require 'tabbar)
(tabbar-mode t)
;; Cyclic navigation through tabs
(setq tabbar-cycling-scope 'tabs)

;; Hide tool bar
(tool-bar-mode -1)

;; Hide menu bar
(menu-bar-mode -1)

;; Set window's title 
(setq frame-title-format "emacs@%b")

;; Inhibits the startup screen
(setq inhibit-startup-message t)

;; Cancel the scroll
(set-scroll-bar-mode nil)

;; Support full screen
(defun toggle-fullscreen (&optional f)
  (interactive)
  (let ((current-value (frame-parameter nil 'fullscreen)))
	(set-frame-parameter nil 'fullscreen
						 (if (equal 'fullboth current-value)
							 (if (boundp 'old-fullscreen) old-fullscreen nil)
						   (progn (setq old-fullscreen current-value)
								  'fullboth)))))
(global-set-key [f9] 'toggle-fullscreen)
(add-hook 'after-make-frame-functions 'toggle-fullscreen)
(toggle-fullscreen)
