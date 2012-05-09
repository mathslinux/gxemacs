;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Mail config file
;; Time-stamp: <2012-05-09-16:09:30 星期三 by geniux>
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

;; Sort threads by the date of the root node.
(setq gnus-thread-sort-functions '(gnus-thread-sort-by-most-recent-date))

;; Support view html in email content
;; And if you want to really do this, please rename K102my-brower.el
;; in ~/.emacs.d/my-lisp/ to K102my-brower.el and install emacs-w3m package
(setq mm-text-html-renderer 'w3m)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; BBDB setting
(add-to-list 'load-path (concat site-lisp-path "/bbdb"))
(require 'bbdb)

;; Initialize BBDB support for the gnus
(bbdb-initialize 'gnus 'message)

;; Set bbdb data file path
(setq bbdb-file "~/Dropbox/Temporary/bbdb/.bbdb")

;; Automatically add contact address
(setq bbdb/news-auto-create-p t)

;; Dont check whether phone number fit with North America format
(setq bbdb-north-american-phone-numbers-p nil)

;; Tell bbdb my email address
(setq bbdb-user-mail-names
	  (regexp-opt '("riegamaths@gmail.com" "hdrmajia@gmail.com")))

;; Cyrling when complete email address
(setq bbdb-complete-name-allow-cycling t)

;; Other settings
;; (setq bbdb-use-pop-up nil)
