;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Dictionary config file ;;
;; Time-stamp: <2011-08-30-23:28:07 星期二 by geniux>
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'edict)
(setq edict-app-path (concat app-path "edict.py"))
(setq edict-engine "stardict")
(setq edict-from-lang "en")
(setq edict-to-lang "zh")
(global-set-key (kbd "<f11>") 'edict)
(global-set-key (kbd "<C-f11>") 'edict-google)
(global-set-key (kbd "<C-S-f11>") '(lambda () (interactive) (edict-google t)))
;; (global-set-key (kbd "<C-S-f11>") '(edict-google t))
