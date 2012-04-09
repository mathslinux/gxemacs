;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Org-mode config file ;;
;; Time-stamp: <2012-04-09-19:06:49 星期一 by geniux>
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


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Publishing setting
(require 'org-publish)

;; Store all related files to dropbox
(setq org-root-dir "~/Dropbox/Doc/org/")
(setq org-publish-dir "~/Dropbox/Doc/public_html/")

;; qemu-kvm project
(setq qemu-kvm-root-dir "~/Dropbox/Doc/org/QEMU_KVM/")
(setq qemu-kvm-publish-dir "~/Dropbox/Doc/public_html/QEMU_KVM/")

(setq org-publish-project-alist
      `(("org-note"
         :base-directory ,org-root-dir
         :publishing-directory ,org-publish-dir
         :base-extension "org"
         :recursive t
         :publishing-function org-publish-org-to-html
		 :headline-levels 4		  ; Just the default for this project.
         :auto-index t
         :index-filename "index.org"
         :index-title "index"
         :link-home "index.html")
		 ;; :makeindex t
		 ;; :auto-sitemap t                ; Generate sitemap.org automagically...
		 ;; :sitemap-filename "sitemap.org"  ; ... call it sitemap.org (it's the default)...
		 ;; :sitemap-title "Sitemap")         ; ... with title 'Sitemap'.
        ("org-static"
         :base-directory ,org-root-dir
         :publishing-directory ,org-publish-dir
         :recursive t
         :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf\\|zip\\|gz\\|txt\\|el" 
         :publishing-function org-publish-attachment)
		("qemu-kvm-note"
         :base-directory ,qemu-kvm-root-dir
         :publishing-directory ,qemu-kvm-publish-dir
         :base-extension "org"
         :recursive t
         :publishing-function org-publish-org-to-html
		 :headline-levels 4		  ; Just the default for this project.
         :auto-index t
         :index-filename "index.org"
         :index-title "index"
         :link-home "index.html")
		("org" :components ("org-notes" "org-static"))))
