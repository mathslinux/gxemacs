;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Auto-complete config file ;;
;; Time-stamp: <2011-08-22-22:12:22 星期一 by geniux>
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defconst auto-complete-path (concat site-lisp-path "auto-complete"))
(add-to-list 'load-path auto-complete-path)
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories (concat auto-complete-path "lisps/auto-complete/ac-dict"))
(ac-config-default)

(setq ac-modes (append ac-modes '(org-mode jabber-chat-mode erc-mode html-mode makefile-mode makefile-gmake-mode)))
