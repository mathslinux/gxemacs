;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; utils config file ;;
;; Time-stamp: <2011-08-21-23:38:55 星期日 by geniux>
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 

;; Cutting and pasting uses the clipboard
(setq x-select-enable-clipboard t)

;; Dont ask user a yes-or-no question, ask a y-no-n question.
(fset 'yes-or-no-p 'y-or-n-p)

;; Highlighting matching parenthesis
(show-paren-mode t)

;; Time-stamp setting
(setq time-stamp-active t)
(setq time-stamp-format "%04y-%02m-%02d-%02H:%02M:%02S %:a by geniux")
(add-hook 'before-save-hook 'time-stamp)

;; Automatic reload file when the file changes on disk.
(global-auto-revert-mode t)

;; Automatic Indent according to major mode when enter RET.
(global-set-key "\r" 'newline-and-indent)

;; Set the default width of tab
;; (setq tab-width 4) ;; have no effect
(custom-set-variables '(tab-width 4))

;; Dont backup file
(setq make-backup-files nil)

;; Set the file used for storing customization information.
(setq custom-file (concat temporary-path "my-custom.el"))

;; Aoto complete the pair
(setq skeleton-pair t)
(global-set-key (kbd "(") 'skeleton-pair-insert-maybe)
(global-set-key (kbd "{") 'skeleton-pair-insert-maybe)
(global-set-key (kbd "`") 'skeleton-pair-insert-maybe)
(global-set-key (kbd "\"") 'skeleton-pair-insert-maybe)
(global-set-key (kbd "'") 'skeleton-pair-insert-maybe)
(global-set-key (kbd "<") 'skeleton-pair-insert-maybe)
(global-set-key (kbd "[") 'skeleton-pair-insert-maybe)

;; smart-operator
;; (require 'smart-operator)
;; (smart-operator-mode t)

;; browse
(setq browse-url-browser-function 'browse-url-firefox)