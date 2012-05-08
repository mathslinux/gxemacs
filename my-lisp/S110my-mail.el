;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Mail config file
;; Time-stamp: <2012-05-08-17:41:38 星期二 by geniux>
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; TODO
;; http://www.lirui.name/post/144.html

;; (load-library "smtpmail")
;; (load-library "nnimap")
;; (load-library "starttls")
;; (setq gnus-select-method '(nnimap "imap.gmail.com"
;; 				  (nnimap-address "imap.gmail.com")
;; 				  (nnimap-server-port 993)
;; 				  (nnimap-authinfo-file "~/.imap-authinfo")
;; 				  (nnimap-stream ssl)))

;; (setq smtpmail-starttls-credentials '(("smtp.gmail.com" 587 nil nil))
;;       smtpmail-smtp-server "smtp.gmail.com"
;;       smtpmail-default-smtp-server "smtp.gmail.com"
;;       send-mail-function 'smtpmail-send-it
;;       message-send-mail-function 'smtpmail-send-it
;;       smtpmail-smtp-service 587
;;       smtpmail-auth-credentials '(("smtp.gmail.com"
;; 				   587
;; 				   "riegamaths@gmail.com"
;; 				   nil)))

(setq gnus-select-method '(nnimap "imap.gmail.com"
 				  (nnimap-address "imap.gmail.com")
 				  (nnimap-server-port 993)
				  ;; next line sets autologin information
				  ;; we store all information to a single file, whose content looks like
				  ;; below:
				  ;; machine imap.gmail.com login your-email-account password your-password port 993
 				  (nnimap-authinfo-file "~/.emacs.d/temporary/.imap-authinfo")
 				  (nnimap-stream ssl)))
(setq user-full-name "mathslinux")
(setq user-mail-address "riegamaths@gmail.com")
(setq message-signature-file (concat temporary-path "/signature.file"))
