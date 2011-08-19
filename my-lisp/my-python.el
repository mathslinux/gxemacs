;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; python mode config file ;;
;; Time-stamp: <2011-06-07-10:39:31 星期二 by geniux>
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; pyemacs
(autoload 'pymacs-apply "pymacs")
(autoload 'pymacs-call "pymacs")
(autoload 'pymacs-eval "pymacs" nil t)
(autoload 'pymacs-exec "pymacs" nil t)
(autoload 'pymacs-load "pymacs" nil t)

(require 'pymacs)
(pymacs-load "ropemacs" "rope-")
(setq ropemacs-enable-autoimport t)

;;pdb setup, note the python version
(setq pdb-path '/usr/lib/python2.7/pdb.py
	  gud-pdb-command-name (symbol-name pdb-path))
(defadvice pdb (before gud-query-cmdline activate)
  "Provide a better default command line when called interactively."
  (interactive
   (list (gud-query-cmdline pdb-path
							(file-name-nondirectory buffer-file-name)))))

;;;;;;;;;;;;;;;;;;;; 折叠 ;;;;;;;;;;;;;;;;;;;;
(defface codepilot-folding-overlay
  '((default (:inherit region :box (:line-width 1 :color "DarkSeaGreen1" :style released-button)))
    (((class color)) (:background "DarkSeaGreen2" :foreground "black")))
  "*Font used by folding overlay."
  :group 'codepilot)

(defun cptree-ov-delete ()
  (interactive)
  (dolist (o (overlays-at (point)))
    (cptree-delete-overlay o 'cptree)))

(defvar cptree--overlay-keymap nil "keymap for folding overlay")

(unless cptree--overlay-keymap
  (let ((map (make-sparse-keymap)))
    (define-key map [mouse-1] 'cptree-ov-delete)
    (define-key map "\r" 'cptree-ov-delete)
    (setq cptree--overlay-keymap map)))

(defun cptree-delete-overlay(o prop)
  (when (eq (overlay-get o 'cptree-tag) prop)
    (delete-overlay o)
    t))

(defun cptree-hide-region (from to prop)
  "Hides a region by making an invisible overlay over it and save the
overlay on the hide-region-overlays \"ring\""
  (interactive)
  (let ((new-overlay (make-overlay from to)))
    ;;(overlay-put new-overlay 'invisible nil)
    (overlay-put new-overlay 'cptree-tag prop)
    (overlay-put new-overlay 'face 'codepilot-folding-overlay)
    (overlay-put new-overlay 'display
                 (propertize
                  (format "...<%d lines>..."
                          (1- (count-lines (overlay-start new-overlay)
                                           (overlay-end new-overlay))))))
    (overlay-put new-overlay 'priority (- 0 from))
    (overlay-put new-overlay 'keymap cptree--overlay-keymap)
    (overlay-put new-overlay 'pointer 'hand)))

(require 'python)

(defun mypython-fold/unfold-block ()
  "fold the block"
  (interactive)
  (let (ret b e)
    (dolist (o (overlays-at (if (python-open-block-statement-p)
                                (save-excursion
                                  (python-end-of-statement)
                                  (point)
                                  )
                                (point))))
      (when (cptree-delete-overlay o 'cptree)
        (setq ret t)))
    (unless ret
      (save-excursion
        (unless (python-open-block-statement-p)
          (python-beginning-of-block))
        (python-end-of-statement)
        (setq b (point))
        (python-end-of-block)
        (setq e (1- (point)))
        (cptree-hide-region b e 'cptree)))))

(define-key python-mode-map [(f10)] 'mypython-fold/unfold-block)
;;;;;;;;;;;;;;;;;;;; 折叠 end ;;;;;;;;;;;;;;;;;;;;



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;                                         
;;; Auto-completion                                                                                            
;;;  Integrates:                                                                                               
;;;   1) Rope                                                                                                  
;;;   2) Yasnippet                                                                                             
;;;   all with AutoComplete.el                                                                                 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;                                         
(defun prefix-list-elements (list prefix)
  (let (value)
    (nreverse
     (dolist (element list value)
      (setq value (cons (format "%s%s" prefix element) value))))))
(defvar ac-source-rope
  '((candidates
     . (lambda ()
         (prefix-list-elements (rope-completions) ac-target))))
  "Source for Rope")
(defun ac-python-find ()
  "Python `ac-find-function'."
  (require 'thingatpt)
  (let ((symbol (car-safe (bounds-of-thing-at-point 'symbol))))
    (if (null symbol)
        (if (string= "." (buffer-substring (- (point) 1) (point)))
            (point)
          nil)
      symbol)))
(defun ac-python-candidate ()
  "Python `ac-candidates-function'"
  (let (candidates)
    (dolist (source ac-sources)
      (if (symbolp source)
          (setq source (symbol-value source)))
      (let* ((ac-limit (or (cdr-safe (assq 'limit source)) ac-limit))
             (requires (cdr-safe (assq 'requires source)))
             cand)
        (if (or (null requires)
                (>= (length ac-target) requires))
            (setq cand
                  (delq nil
                        (mapcar (lambda (candidate)
                                  (propertize candidate 'source source))
                                (funcall (cdr (assq 'candidates source)))))))
        (if (and (> ac-limit 1)
                 (> (length cand) ac-limit))
            (setcdr (nthcdr (1- ac-limit) cand) nil))
        (setq candidates (append candidates cand))))
    (delete-dups candidates)))
(add-hook 'python-mode-hook
          (lambda ()
                 (auto-complete-mode 1)
                 (set (make-local-variable 'ac-sources)
                      (append ac-sources '(ac-source-rope) '(ac-source-yasnippet)))
                 (set (make-local-variable 'ac-find-function) 'ac-python-find)
                 (set (make-local-variable 'ac-candidate-function) 'ac-python-candidate)
                 (set (make-local-variable 'ac-auto-start) nil)))

;;Ryan's python specific tab completion                                                                        
(defun ryan-python-tab ()
  ; Try the following:                                                                                         
  ; 1) Do a yasnippet expansion                                                                                
  ; 2) Do a Rope code completion                                                                               
  ; 3) Do an indent                                                                                            
  (interactive)
  (if (eql (ac-start) 0)
      (indent-for-tab-command)))

;; geniux hack,修改了 ac-start 会导致其他模式的补全不正常
;; (defadvice ac-start (before advice-turn-on-auto-start activate)
;;   (set (make-local-variable 'ac-auto-start) t))
;; (defadvice ac-cleanup (after advice-turn-off-auto-start activate)
;;   (set (make-local-variable 'ac-auto-start) nil))

(define-key python-mode-map "\t" 'ryan-python-tab)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;                                         
;;; End Auto Completion                                                                                        
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


