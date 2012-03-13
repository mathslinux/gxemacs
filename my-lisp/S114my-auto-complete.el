;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Auto-complete config file ;;
;; Time-stamp: <2012-03-13-13:46:30 星期二 by geniux>
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defconst auto-complete-path (concat site-lisp-path "auto-complete"))
(add-to-list 'load-path auto-complete-path)
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories (concat auto-complete-path "lisps/auto-complete/ac-dict"))
(ac-config-default)

;; For semantic backend.
(add-hook 'c-mode-common-hook
		  (lambda ()
			(local-set-key [(control return)] 'semantic-ia-complete-symbol-menu)))

(defun ac-complete-semantic-self-insert (arg)
    (interactive "p")
    (self-insert-command arg)
    (ac-complete-semantic))

(add-hook 'c-mode-common-hook
		  (lambda ()
			(local-set-key "." 'ac-complete-semantic-self-insert)
			(local-set-key ">" 'ac-complete-semantic-self-insert)))

(setq ac-modes (append ac-modes '(org-mode jabber-chat-mode erc-mode
										   html-mode makefile-gmake-mode
										   objc-mode jde-mode sql-mode
										   change-log-mode text-mode
										   makefile-bsdmake-mo
										   autoconf-mode
										   makefile-automake-mode
										   eshell-mode)))
