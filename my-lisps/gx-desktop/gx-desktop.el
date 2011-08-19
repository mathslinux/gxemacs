;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Session and desktop config file ;;
;; Time-stamp: <2011-05-08-18:08:52 星期日 by geniux>
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Session setting
(require 'session)
(add-hook 'after-init-hook 'session-initialize)

;; Desktop setting
(load "desktop")
;;(setq desktop-path 'desktop-config-path)
(add-to-list 'desktop-path desktop-config-path)
(setq desktop-dirname desktop-config-path)
(setq desktop-base-file-name ".emacs.desktop")
(add-to-list 'desktop-modes-not-to-save 'info-mode)

;; auto save
(desktop-save-mode t)
