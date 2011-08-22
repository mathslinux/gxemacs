;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Instant Messaging config file ;;
;; Time-stamp: <2011-08-22-14:09:37 by mathslinux>
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; emacs-jabber
(add-to-list 'load-path (concat site-lisp-path "share/emacs/site-lisp/"))
(load "jabber-autoloads")
(setq jabber-account-list
      '(("riegamaths@gmail.com"
         (:network-server . "talk.google.com")
         (:connection-type . ssl))))

;; twitter
;; (require 'epa-file)
;; (epa-file-enable)
;; (add-to-list 'load-path (concat lisps-path "/twittering-mode-2.0.0"))
;; (require 'twittering-mode)
;; (setq twittering-allow-insecure-server-cert t)
;; (setq twittering-oauth-use-ssl nil)
;; (setq twittering-use-ssl nil)
;; (twittering-enable-unread-status-notifier)
;; (setq-default twittering-icon-mode t)
;; ; This tells twittering-mode which time line buffers 
;; ; to open when starting
;; (setq twittering-initial-timeline-spec-string
;;       '(":home"
;; 		":friends"
;;         ":replies"
;;         ":direct_messages"
;;         "citizen428/tupaleros"))