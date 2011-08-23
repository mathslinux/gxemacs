;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Auto-complete config file ;;
;; Time-stamp: <2011-08-23-14:50:59 by mathslinux>
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defconst auto-complete-path (concat site-lisp-path "auto-complete"))
(add-to-list 'load-path auto-complete-path)
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories (concat auto-complete-path "lisps/auto-complete/ac-dict"))
(ac-config-default)

(setq ac-modes (append ac-modes '(org-mode jabber-chat-mode erc-mode
										   html-mode makefile-gmake-mode
										   objc-mode jde-mode sql-mode
										   change-log-mode text-mode
										   makefile-bsdmake-mo
										   autoconf-mode
										   makefile-automake-mode)))