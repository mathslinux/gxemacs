;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Mail config file
;; Time-stamp: <2011-08-21-23:43:09 星期日 by geniux>
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; TODO
;; http://www.lirui.name/post/144.html

(load-library "smtpmail")
(load-library "nnimap")
(load-library "starttls")
(setq gnus-select-method '(nnimap "imap.gmail.com"
				  (nnimap-address "imap.gmail.com")
				  (nnimap-server-port 993)
				  (nnimap-authinfo-file "~/.imap-authinfo")
				  (nnimap-stream ssl)))

(setq smtpmail-starttls-credentials '(("smtp.gmail.com" 587 nil nil))
      smtpmail-smtp-server "smtp.gmail.com"
      smtpmail-default-smtp-server "smtp.gmail.com"
      send-mail-function 'smtpmail-send-it
      message-send-mail-function 'smtpmail-send-it
      smtpmail-smtp-service 587
      smtpmail-auth-credentials '(("smtp.gmail.com"
				   587
				   "riegamaths@gmail.com"
				   nil)))