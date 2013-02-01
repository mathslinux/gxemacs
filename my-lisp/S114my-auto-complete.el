;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Auto-complete config file ;;
;; Time-stamp: <2012-07-11-17:43:00 星期三 by geniux>
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defconst auto-complete-path (concat site-lisp-path "auto-complete"))
(add-to-list 'load-path auto-complete-path)

;;; Require
(require 'auto-complete-semantic nil t)  ;optional
(require 'auto-complete-config)

(add-to-list 'ac-dictionary-directories (concat auto-complete-path "lisps/auto-complete/ac-dict"))
(ac-config-default)


(add-hook 'c-mode-common-hook '(lambda ()
        (make-local-variable 'ac-sources)
        (setq ac-sources (append ac-sources '(ac-source-semantic)))))
		
;; For semantic backend.
(add-hook 'c-mode-common-hook
		  (lambda ()
			(local-set-key [(control return)] 'semantic-ia-complete-symbol)))

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
