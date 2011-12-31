;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Org-mode config file ;;
;; Time-stamp: <2011-12-06-13:37:26 星期二 by geniux>
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-to-list 'load-path (concat site-lisp-path "share/emacs/site-lisp/"))
(require 'org-install)

(add-hook 'org-mode-hook 
	  (lambda () (setq truncate-lines nil)))
(setq org-todo-keywords
      '((sequence "TODO(t)" "DOING(d)" "|" "DONE" "CANCEL(c)")
        (sequence "REPORT(r)" "DEBUG(b)" "|" "FIXED(f!)")
        (sequence "TODO" "|" "DONE")))
;; (setq org-log-done 'note)
(setq org-log-done nil)
