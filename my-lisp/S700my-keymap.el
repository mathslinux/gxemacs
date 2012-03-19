;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Key map config file ;;
;; Time-stamp: <2012-03-19-10:40:13 星期一 by geniux>
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; close current buffer
(global-set-key [C-f9] 'kill-this-buffer)

;; close window
(global-set-key [f4] 'delete-window)

;; 按F7编译
(global-set-key [f7] 'compile)

;; 拷贝当前行
(defun copy-line (&optional arg)
  "Save current line into Kill-Ring without mark the line"
  (interactive "P")
  (let ((beg (line-beginning-position))
        (end (line-end-position arg)))
    (copy-region-as-kill beg end))
  )
(define-key global-map (kbd "C-c y") 'copy-line)


;; Save desktop save after saving buffer
(defun save-buffer-and-desktop ()
  "Save desktop save after saving buffer."
  (interactive)
  (progn
	(save-buffer)
	(desktop-save-in-desktop-dir)))
(global-set-key (kbd "C-x C-s") 'save-buffer-and-desktop)

;; Undo, Redo
(require 'redo)
(global-set-key (kbd "C-,") 'undo)
(global-set-key (kbd "C-.") 'redo) 

;; eshell

;; ibuffer
(global-set-key (kbd "C-x C-b") 'ibuffer)

(global-set-key [f1] 'eshell)

;;跳到指定行
(global-set-key "\M-g" 'goto-line)

;;隐藏和显示ecb窗口
(define-key global-map [(control f3)] 'ecb-show-ecb-windows)
(define-key global-map [(control f4)] 'ecb-hide-ecb-windows)

;; tab栏
(define-prefix-command 'lwindow-map)
(global-set-key (kbd "C-<left>") 'tabbar-backward)
(global-set-key (kbd "C-<right>") 'tabbar-forward)
(global-set-key (kbd "C-<up>") 'tabbar-backward-group)
(global-set-key (kbd "C-<down>") 'tabbar-forward-group)

;;各窗口间切换
(global-set-key [M-left] 'windmove-left)
(global-set-key [M-right] 'windmove-right)
(global-set-key [M-up] 'windmove-up)
(global-set-key [M-down] 'windmove-down)

;; VI 的 % 括号匹配
;; Default is C-M-n C-M-p
(global-set-key "%" 'match-paren)
(defun match-paren (arg)
  "Go to the matching parenthesis if on parenthesis otherwise insert %."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
        ((looking-at "\\s\)") (forward-char 1) (backward-list 1))
        (t (self-insert-command (or arg 1)))))

;; 跳转到变量定义处
(global-set-key [f12] 'semantic-ia-fast-jump)

;; 选择可粘帖的列表
(require 'browse-kill-ring)
(global-set-key [(control c)(k)] 'browse-kill-ring)
(browse-kill-ring-default-keybindings)


;; gdb
(defun define-c-mode-fn-key-debug()
  (setq gdb-many-windows t)
  (define-key c-mode-base-map (kbd "C-c g") 'gdb)
  ;; (define-key c-mode-base-map (kbd "<f5>") 'gud-go)
  (define-key c-mode-base-map (kbd "<f10>") 'gud-step)
  (define-key c-mode-base-map (kbd "<f11>") 'gud-next)
  (define-key c-mode-base-map (kbd "S-<f10>") 'gud-finish)
  (define-key c-mode-base-map (kbd "<f9>") 'gud-break)
  (define-key c-mode-base-map (kbd "S-<f9>") 'gud-remove)
  
  ;; (define-key gud-mode-map (kbd "<f5>") 'gud-go)
  (define-key gud-mode-map (kbd "<f10>") 'gud-step)
  (define-key gud-mode-map (kbd "<f11>") 'gud-next)
  (define-key gud-mode-map (kbd "S-<f10>") 'gud-finish)
  (define-key gud-mode-map (kbd "<f9>") 'gud-break))


;; 退出gdb的时候关闭gdb对应的buffer
(add-hook 'gdb-mode-hook 'kill-buffer-when-shell-command-exit)

;; 显示gdb的鼠标提示
(gud-tooltip-mode 1)

;; 当gdb/gud结束的时候，最好回到代码窗口，或者回到*scratch*好了
(defun kill-buffers-when-gdb-quit ()
  "Close gdb buffer when gdb quit. This function is invoked when gdb mode is enabled with gdb-mode-hook" 
  (let ((process (get-buffer-process (current-buffer))))
    (when (processp process)
      (set-process-sentinel process 
							(lambda (proc change)
							  (when (string-match "\\(finished\\|exited\\|killed\\)" change)
								(condition-case nil
									(progn 
									  (gdb-many-windows -1)
									  (delete-other-windows 
									   (get-buffer-window
										(switch-to-buffer 
										 (condition-case nil
											 (gud-find-file gdb-main-file)
										   (error "*Scratch*")))))
									  (define-c-mode-fn-key-edit)
									  (gud-reset)
									  (gdb-reset)					  
									  (kill-buffer (process-buffer proc)))
								  (error nil))))))))

(add-hook 'c-mode-hook 'define-c-mode-fn-key-debug)
(add-hook 'c-mode-hook 'kill-buffers-when-gdb-quit)
(mapc (lambda (mode-hook)
	(add-hook mode-hook (lambda ()
						  (progn 
							(tool-bar-add-item "gud" 'gdb 'gdb :visible '(memq major-mode '(c++-mode c-mode)))
							(tool-bar-add-item "compile" 'compile 'compile :visible '(memq major-mode '(c++-mode c-mode)))))))
      (list 'c-mode-hook 'c++-mode-hook))


;; Highlight-Symbol keymap
(require 'highlight-symbol)
(global-set-key [(control f5)] 'highlight-symbol-at-point)
(global-set-key [f5] 'highlight-symbol-next)
(global-set-key [(shift f5)] 'highlight-symbol-prev)
;; 清除所有
(global-set-key [(control shift f5)] 'highlight-symbol-remove-all)
;; 替换操作
(global-set-key [(meta f5)] 'highlight-symbol-query-replace)

;; Bookmark setting
(load "bm-1.53")
(global-set-key (kbd "<f2>") 'bm-toggle)
(global-set-key (kbd "<C-f2>")   'bm-next)
(global-set-key (kbd "<S-f2>") 'bm-previous)

(global-set-key (kbd "M-2") 'set-mark-command)
