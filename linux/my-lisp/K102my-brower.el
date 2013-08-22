;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; W3M config file
;; Time-stamp: <2011-08-22-19:57:14 星期一 by geniux>
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; W3m
;;; Todo:
;; 1. apt-get install w3m w3m-el w3m-img semi (in ubuntu)
;; 2. cvs -d :pserver:anonymous@cvs.namazu.org:/storage/cvsroot co emacs-w3m
;; 3. autoconf; ./configure --with-addpath=/root/.emacs.d/lisps

;;使用Emacs-w3m浏览网页
;; (add-to-list 'load-path "~/emacs/site-lisp/w3m")
;; (require 'w3m-load)
;; (require 'w3m-e21)
;; (provide 'w3m-e23)
;; (setq w3m-use-favicon nil)
;; (setq w3m-command-arguments '("-cookie" "-F"))
;; (setq w3m-use-cookies t)
;; (setq w3m-home-page "http://www.google.com")

;; (setq w3m-display-inline-image t)

(add-to-list 'load-path (concat site-lisp-path "share/emacs/site-lisp/w3m"))
(require 'w3m)
;;启动和初始化w3m.el
(autoload 'w3m "w3m" "Interface for w3m on Emacs." t)
(autoload 'w3m-browse-url "w3m" "Ask a WWW browser to show a URL." t)
(autoload 'w3m-search "w3m-search" "Search words using emacs-w3m." t)
;;使用w3m作为默认的浏览器
;; (setq browse-url-browser-function 'w3m-browse-url)
;;使用mule-ucs，只有在你安装mule-ucs elisp扩展包时这个才有用，可以看Unicode解码的网页
;(setq w3m-use-mule-ucs t)
;;使用工具包
(setq w3m-use-toolbar t)
;;使用info的快件键绑定
;(set-default 'w3m-key-binding 'info)
;;启用cookie
(setq w3m-use-cookies t)
;;这个是作什么的?
(setq w3m-use-tab-menubar t)
;;设定w3m图标所在文件夹
;(setq w3m-icon-directory "/home/jerry/software/xemacs/w3m/emacs-w3m-1.4.4/icons")
;;显示图标
(setq w3m-show-graphic-icons-in-header-line t)
(setq w3m-show-graphic-icons-in-mode-line t)
;;设定w3m运行的参数，分别为使用cookie和使用框架
(setq w3m-command-arguments '("-cookie" "-F"))
;;用w3m浏览网页时也显示图片
(setq w3m-display-inline-image t)
;; ;;设定w3m的语言设置，以便方便使用和阅读中文-用了就乱码
;; ;;书签解码设置
;; (setq w3m-bookmark-file-coding-system 'chinese-iso-8bit)
;; ;;w3m的解码设置，后面最好都有，我也不详解了
;; (setq w3m-coding-system 'chinese-iso-8bit)
;; (setq w3m-default-coding-system 'chinese-iso-8bit)
;; (setq w3m-file-coding-system 'chinese-iso-8bit)
;; (setq w3m-file-name-coding-system 'chinese-iso-8bit)
;; (setq w3m-terminal-coding-system 'chinese-iso-8bit)
;; (setq w3m-input-coding-system 'chinese-iso-8bit)
;; (setq w3m-output-coding-system 'chinese-iso-8bit)
;;w3m是使用tab的，设定Tab的宽度
(setq w3m-tab-width 4)
;;设定w3m的主页
(setq w3m-home-page "http://www.google.com")
;;当用 shift+RET 打开新链接时将不自动跳转到新的页面，等提示已经完全打开，才用 C-c C-n ，
;;C-c C-p 打开，这个好用
(setq w3m-view-this-url-new-session-in-background t)
(add-hook 'w3m-fontify-after-hook 'remove-w3m-output-garbages)
;;好像是有利于中文搜索的
(defun remove-w3m-output-garbages ()
"去掉w3m输出的垃圾."
(interactive)
(let ((buffer-read-only))
(setf (point) (point-min))
(while (re-search-forward "[\200-\240]" nil t)
(replace-match " "))
(set-buffer-multibyte t))
(set-buffer-modified-p nil))
;;颜色设置
;(setq w3m-
;;;;;;;;;;;;;;;;;;;;;
;;语言设置
;;这个不知道有用没，好像在下一版emacs对unicode支持好了就可以了
;;当然这个是用emacs-cvs
;;;;;;;;;;;;;;;;;;;;;
(when (boundp 'utf-translate-cjk)
(setq utf-translate-cjk t)
(custom-set-variables
'(utf-translate-cjk t)))
(if (fboundp 'utf-translate-cjk-mode)
(utf-translate-cjk-mode 1))
;;配置handle text/html part with emacs-w3m under SEMI MUAs such as Wanderlust
;;(require `mime-w3m)
