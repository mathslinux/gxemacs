;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Org-mode config file ;;
;; Time-stamp: <2013-02-01-19:35:21 星期五 by geniux>
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-to-list 'load-path (concat site-lisp-path "share/emacs/site-lisp/"))
(require 'org-install)

(add-hook 'org-mode-hook 
		  (lambda () (setq truncate-lines nil)))
(setq org-todo-keywords
	  '((sequence "TODO(t!)" "NEXT(n)" "WAITTING(w)" "SOMEDAY(s)" "|" "DONE(d@/!)" "ABORT(a@/!)")
		))
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



;; GTD
(setq calendar-week-start-day 1)		; The day of the week begins with 1
(setq org-agenda-span 'week)
(setq org-agenda-restore-windows-after-quit t)
(setq org-agenda-repeating-timestamp-show-all t)
(setq org-agenda-show-all-dates t)
;; 设定时间编辑为15钟的增量
(setq org-time-stamp-rounding-minutes (quote (1 15)))
;; 快速TODO 状态变化选择
(setq org-use-fast-todo-selection t)
(add-to-list 'auto-mode-alist '("\\.\\(org\\|org_archive\\|txt\\)$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)

;; 给已完成事项打上时间戳。可选 note，附加注释
;; (setq org-log-done 'time)

;;设置Remember 模板
(require 'remember)
(setq org-directory "~/org/")
(setq org-default-notes-file "~/org/inbox.org")
(setq remember-annotation-functions '(org-remember-annotation))
(setq remember-handler-functions '(org-remember-handler))
(add-hook 'remember-mode-hook 'org-remember-apply-template)
(org-remember-insinuate)

(define-key global-map "\C-cr" 'org-remember)

(setq org-remember-templates
      '(("Tasks" ?t "* TODO %?\n  %i\n  %a" "~/org/gtd.org")
        ("Appointments" ?a "* Appointment: %?\n%^T\n%i\n  %a" "~/org/gtd.org")))

(setq org-remember-templates '(("New" ?n "* %? %t \n %i\n %a" "~/org/inbox.org" )
							   ("Task" ?t "** TODO %?\n %i\n %a" "~/org/task.org" "Tasks")
							   ("Calendar" ?c "** TODO %?\n %i\n %a" "~/org/task.org" "Tasks")
							   ("Idea" ?i "** %?\n %i\n %a" "~/org/task.org" "Ideas")
							   ("Note" ?r "* %?\n %i\n %a" "~/org/note.org" )
							   ("Project" ?p "** %?\n %i\n %a" "~/org/project.org" %g)))
(setq org-agenda-files (list "~/org/inbox.org" "~/org/task.org"
							  "~/org/note.org" "~/org/project.org"))

(setq org-refile-targets (quote ((org-agenda-files :maxlevel . 5) (nil :maxlevel . 5))))


(setq org-agenda-custom-commands
	  '(
		("p" "Projects"
		 ((tags "PROJECT")))
		("h" "Office and Home Lists"
		 ((agenda)
		  (tags-todo "OFFICE")
		  (tags-todo "HOME")
		  (tags-todo "WEB")
		  (tags-todo "CALL")
		  ))

		("d" "Daily Action List"
		 (
		  (agenda "" ((org-agenda-ndays 1)
					  (org-agenda-sorting-strategy
					   (quote ((agenda time-up priority-down tag-up) )))
					  (org-deadline-warning-days 0)
					  ))))))
