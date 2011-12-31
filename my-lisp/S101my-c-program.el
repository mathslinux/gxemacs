;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; c mode config file ;;
;; Time-stamp: <2011-12-13-10:43:27 Tuesday by geniux>
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'cc-mode)

(add-hook 'c-mode-hook 'gx-c-mode)
;; 设置imenu的排序方式为按名称排序
(setq imenu-sort-function 'imenu--sort-by-name)

(defun gx-mode-auto-pair ()
  (interactive)
  (make-local-variable 'skeleton-pair-alist)
  ;;有空格版本
  ;;  (setq skeleton-pair-alist  '(
  ;;			           (?` ?` _ "''")
  ;;			           (?\( ?  _ " )")
  ;;	  		           (?\[ ?  _ " ]")
  ;;  			           (?{ \n > _ \n ?} >)))
  (setq skeleton-pair-alist  '(
			       (?` ?` _ "''")
			       (?\(   _ ")")
			       (?\[   _ "]")
			       (?{ \n > _ \n ?} >)))
  (setq skeleton-pair t)
  (local-set-key (kbd "(") 'skeleton-pair-insert-maybe)
  (local-set-key (kbd "{") 'skeleton-pair-insert-maybe)
  (local-set-key (kbd "`") 'skeleton-pair-insert-maybe)
  (local-set-key (kbd "\"") 'skeleton-pair-insert-maybe)
  (local-set-key (kbd "'") 'skeleton-pair-insert-maybe)
  (local-set-key (kbd "<") 'skeleton-pair-insert-maybe)
  (local-set-key (kbd "[") 'skeleton-pair-insert-maybe))

(add-hook 'c-mode-hook 'gx-mode-auto-pair)
(add-hook 'c++-mode-hook 'gx-mode-auto-pair)

(defun gx-c-mode()
  (interactive)
  (c-set-style "linux")
  ;;(c-toggle-auto-state)
  (c-toggle-hungry-state)
  (setq c-basic-offset 4)
  (imenu-add-menubar-index)
  (which-function-mode t)
  )


(load "sourcepair")
(define-key c-mode-map (kbd "<f11>") 'sourcepair-load)

;; c/h 跳转
(setq sourcepair-source-path    '( "." "../*" ))
(setq sourcepair-header-path    '( "." "include" "../include" "../*"))
(setq sourcepair-recurse-ignore '( "CVS" "Obj" "Debug" "Release" ))

;; cscope
(require 'xcscope)
(setq cscope-do-not-update-database t)

;; doxygen
(require 'doxymacs)
(add-hook 'c-mode-common-hook 'doxymacs-mode)
(defun my-doxymacs-font-lock-hook ()
  (if (or (eq major-mode 'c-mode) (eq major-mode 'c++-mode))
	  (doxymacs-font-lock)))
(add-hook 'font-lock-mode-hook 'my-doxymacs-font-lock-hook)

