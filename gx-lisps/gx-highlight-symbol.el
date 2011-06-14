;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Highlight symbol config file ;;
;; Last modified time
;; Time-stamp: <2010-08-22-13:52:31 星期日 by geniux>
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'highlight-symbol)

(global-set-key [(control f5)] 'highlight-symbol-at-point)
(global-set-key [f5] 'highlight-symbol-next)
(global-set-key [(shift f5)] 'highlight-symbol-prev)
;; 清除所有
(global-set-key [(control shift f5)] 'highlight-symbol-remove-all)
;; 替换操作
(global-set-key [(meta f5)] 'highlight-symbol-query-replace)