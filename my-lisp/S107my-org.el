;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Org-mode config file ;;
;; Time-stamp: <2011-08-21-20:55:12 星期日 by geniux>
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-hook 'org-mode-hook 
	  (lambda () (setq truncate-lines nil)))
(setq org-todo-keywords
      '((sequence "TODO(t)" "DOING(d)" "|" "DONE" "CANCEL(c)")
        (sequence "REPORT(r)" "DEBUG(b)" "|" "FIXED(f!)")
        (sequence "TODO" "|" "DONE")))
(setq org-log-done 'note)