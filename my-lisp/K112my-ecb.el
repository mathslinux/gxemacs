;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ECB config file
;; Time-stamp: <2011-08-22-11:49:16 by mathslinux>
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-to-list 'load-path (concat site-lisp-path "ecb"))
(require 'ecb)
(defun gx-ecb ()
  "启动ecb"
  (interactive)
  (setq ecb-tip-of-the-day nil)
  (ecb-activate))
  (ecb-layout-switch "left2")
(gx-ecb)