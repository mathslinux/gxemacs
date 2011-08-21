;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Instant Messaging config file ;;
;; Time-stamp: <2011-08-21-23:04:03 星期日 by geniux>
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; emacs-jabber
(add-to-list 'load-path (concat site-lisp-path "jabber/share/emacs/site-lisp/"))
(load "jabber-autoloads")
(setq jabber-account-list
      '(("riegamaths@gmail.com"
         (:network-server . "talk.google.com")
         (:connection-type . ssl))))
