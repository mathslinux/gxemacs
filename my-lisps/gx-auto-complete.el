;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Auto-complete config file ;;
;; Time-stamp: <2011-06-11-23:34:54 星期六 by geniux>
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-to-list 'load-path (concat emacs-config-path "lisps/auto-complete"))
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories (concat emacs-config-path "lisps/auto-complete/ac-dict"))
(ac-config-default)

(setq ac-modes (append ac-modes '(org-mode)))
(setq ac-modes (append ac-modes '(jabber-chat-mode)))
(setq ac-modes (append ac-modes '(erc-mode)))
