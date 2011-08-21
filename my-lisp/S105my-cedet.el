;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; cedet mode config file ;;
;; Time-stamp: <2011-06-07-20:43:21 星期二 by geniux>
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq semantic-default-submodes '(global-semantic-idle-scheduler-mode
                                  global-semanticdb-minor-mode
                                  global-semantic-idle-summary-mode
                                  global-semantic-mru-bookmark-mode
								  global-semantic-decoration-mode
								  global-semantic-highlight-func-mode ))
(semantic-mode t)


;; 代码跳转, 跳回 from emacser.com
(defun semantic-ia-fast-jump-back ()
  (interactive)
  (if (ring-empty-p (oref semantic-mru-bookmark-ring ring))
      (error "Semantic Bookmark ring is currently empty"))
  (let* ((ring (oref semantic-mru-bookmark-ring ring))
         (alist (semantic-mrub-ring-to-assoc-list ring))
         (first (cdr (car alist))))
    (if (semantic-equivalent-tag-p (oref first tag) (semantic-current-tag))
        (setq first (cdr (car (cdr alist)))))
    (semantic-mrub-switch-tags first)))

(defun semantic-ia-fast-jump-or-back (&optional back)
  (interactive "P")
  (if back
      (semantic-ia-fast-jump-back)
    (semantic-ia-fast-jump (point))))
(define-key semantic-mode-map [f12] 'semantic-ia-fast-jump-or-back)
(define-key semantic-mode-map [C-f12] 'semantic-ia-fast-jump-or-back)
(define-key semantic-mode-map [S-f12] 'semantic-ia-fast-jump-back)