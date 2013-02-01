;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; cedet mode config file
;; See Config_CEDET.org for detail
;; Time-stamp: <2013-02-01-19:30:28 星期五 by geniux>
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(semantic-mode 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Semantic configure

;; For C/C++
(semantic-gcc-setup)
(defconst cedet-user-include-dirs
  (list ".." "../include" "../.." "../../include"))
;; FIXME
;; (require ’semantic-c nil ‘noerror)
(mapc (lambda (dir)
		(semantic-add-system-include dir 'c++-mode)
		(semantic-add-system-include dir 'c-mode))
	  cedet-user-include-dirs)

(global-semantic-idle-scheduler-mode 1)
(global-semanticdb-minor-mode 1)

;;(semantic-load-enable-code-helpers)
(setq semantic-idle-work-update-headers-flag t)
(global-semantic-idle-summary-mode 1)
(global-semantic-mru-bookmark-mode 1)
;; Do this last.  This allows other minor modes to get loaded
;; in so they appear in the menu properly.
;; (global-senator-minor-mode 1)

;;(semantic-load-enable-guady-code-helpers)
(global-semantic-decoration-mode 1)
;;(global-semantic-decoration-on-includes)
;; (global-semantic-idle-completions-mode 1)
;; (semantic-load-enable-excessive-code-helpers)
(global-semantic-highlight-func-mode 1)
(global-semantic-idle-local-symbol-highlight-mode 1)
;;(global-which-function-mode)
;; (semantic-load-enable-semantic-debugging-helpers)
;; (global-semantic-highlight-edits-mode 1)

;; Code fold

;; Semantic configure
(global-semanticdb-minor-mode 1)
(setq semanticdb-default-save-directory (concat temporary-path "semanticdb/"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; EDE configure

;; (global-ede-mode 1)

;; Enable EDE for a pre-existing C++ project
;; (ede-cpp-root-project "NAME" :file "~/myproject/Makefile")

;; * This enables the use of Exuberent ctags if you have it installed.
;;   If you use C++ templates or boost, you should NOT enable it.
;; (semantic-load-enable-all-exuberent-ctags-support)
;;   Or, use one of these two types of support.
;;   Add support for new languges only via ctags.
;; (semantic-load-enable-primary-exuberent-ctags-support)
;;   Add support for using ctags as a backup parser.
;; (semantic-load-enable-secondary-exuberent-ctags-support)

;; Enable SRecode (Template management) minor-mode.
;; (global-srecode-minor-mode 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 
;; (setq semantic-default-submodes '(global-semantic-idle-scheduler-mode
;;                                   global-semanticdb-minor-mode
;;                                   global-semantic-idle-summary-mode
;;                                   global-semantic-mru-bookmark-mode
;; 								  global-semantic-decoration-mode
;; 								  global-semantic-highlight-func-mode ))
;; (semantic-mode t)


;; (require 'semantic/analyze/refs)

;; ;; 代码跳转, 跳回 from emacser.com
;; (defun semantic-ia-fast-jump-back ()
;;   (interactive)
;;   (if (ring-empty-p (oref semantic-mru-bookmark-ring ring))
;;       (error "Semantic Bookmark ring is currently empty"))
;;   (let* ((ring (oref semantic-mru-bookmark-ring ring))
;;          (alist (semantic-mrub-ring-to-assoc-list ring))
;;          (first (cdr (car alist))))
;;     (if (semantic-equivalent-tag-p (oref first tag) (semantic-current-tag))
;;         (setq first (cdr (car (cdr alist)))))
;;     (semantic-mrub-switch-tags first)))

;; (defun semantic-ia-fast-jump-or-back (&optional back)
;;   (interactive "P")
;;   (if back
;;       (semantic-ia-fast-jump-back)
;;     (semantic-ia-fast-jump (point))))
;; (define-key semantic-mode-map [f12] 'semantic-ia-fast-jump-or-back)
;; (define-key semantic-mode-map [C-f12] 'semantic-ia-fast-jump-or-back)
;; (define-key semantic-mode-map [S-f12] 'semantic-ia-fast-jump-back)
