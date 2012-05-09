;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Instant Messaging config file ;;
;; Time-stamp: <2012-05-09-10:53:16 星期三 by geniux>
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



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ERC configure ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; General config
(load "~/.ercpass")						;; Load my password file
(setq erc-nick "mathslinux")
(setq erc-away-nickname "mathslinux{away}")
(setq erc-user-full-name "mathslinux")

;; Auto login 
(require 'erc-services)
(erc-services-mode 1)
(setq erc-nickserv-identify-mode (quote autodetect))
(setq erc-prompt-for-nickserv-password nil)
(setq erc-nickserv-passwords
	  '((freenode     (("mathslinux" . ,freenode-pass)
					   ("nick-two" . ,test)))
		(DALnet       (("nickname" . ,test)))))

;; Channel config
(setq erc-autojoin-channels-alist '(("freenode.net"
                                     "#ubuntu-cn" "#gentoo-cn"
                                     "#emacs" "#lisp" "#python")
                                    ("oftc.net" "#arch-cn" "#qemu" "#ovirt" "emacs-cn")))

;; Channel specific prompt
(setq erc-prompt (lambda ()
                   (if (and (boundp 'erc-default-recipients)
                            (erc-default-target))
                       (erc-propertize (concat (erc-default-target) ">")
                                       'read-only t
                                       'rear-nonsticky t
                                       'front-nonsticky t)
                     (erc-propertize (concat "ERC>")
                                     'read-only t
                                     'rear-nonsticky t
                                     'front-nonsticky t))))

;; Automatically truncate buffer
(defvar erc-insert-post-hook)
(add-hook 'erc-insert-post-hook
          'erc-truncate-buffer)
(setq erc-truncate-buffer-on-save t)

(defun erc-start ()
  (interactive)
  (erc :server "irc.freenode.net" :port 6667 :nick "mathslinux" :password freenode-pass)
  ;; (erc-ssl :server "irc.oftc.net" :port 6667 :nick "mathslinux" :password oftc-pass)) 
  (erc :server "irc.oftc.net" :port 6667 :nick "mathslinux" :password oftc-pass))

;; Enable log
(require 'erc-log)
(erc-log-mode 1)
(setq erc-log-channels-directory "~/Dropbox/Temporary/erc"
      erc-save-buffer-on-part t
      erc-log-file-coding-system 'utf-8
      erc-log-write-after-send t
      erc-log-write-after-insert t)
 
(unless (file-exists-p erc-log-channels-directory)
  (mkdir erc-log-channels-directory t))
