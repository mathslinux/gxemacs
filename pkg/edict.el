;;; edict.el --- Emacs dictionary interface

;; Copyright (C) 2011 mathslinux

;; Author: mathslinux <riegamaths@gmail.com>
;; Version: 0.0.2
;; Keywords: dictionary
;; URL: http://mathslinux.org

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:
;; The edict call a python app whose name is also edict to translate, edict is a python app. But in the
;; future, the edict should be implemented in elisp.

;; Installation:
;; 
;;  - put `edict.el' somewhere in your emacs load path
;;  - add the following to your .emacs file
;;    (require 'edict)
;; 	  (setq edict-app-path "your-app-path")
;; 	  (setq edict-engine "google") 
;; 	  (setq edict-from-lang "en")
;; 	  (setq edict-to-lang "zh")
;; 	  (global-set-key (kbd "<f10>") 'edict)
;; 

;;; Todo:
;; TTS support

;;; Code:

;; Customization
(defcustom edict-engine "google"
  "The engine of search,
if select google, use the google's ajax. !!Note it's search online.
if select stardict, use stardict to search."
  :group 'edict
  :type 'string)

(defcustom edict-from-lang "en"
  "The lanuage you want to translate from."
  :group 'edict
  :type 'string)

(defcustom edict-to-lang "zh"
  "The lanuage you want to translate to."
  :group 'edict
  :type 'string)

(defun edict ()
  "Call edict app to translate, edict is a python app. But in the
future, the edict should be implemented by elisp."
  (interactive)
  (let (search-command begin end)
	(if mark-active
		(setq begin (region-beginning) end (region-end))
	  (save-excursion
		;; When cursor position is the beginning of the searched word, (backward-word)
		;; can't move region-beginning to the beginning of the word, so use (forward-char)
		;; to move forward a char, then call (backward-word), the region-beginning last will
		;; return the beginning position the word.
		(progn
		  (forward-char)
		  (backward-word)
		  (mark-word)
		  (setq begin (region-beginning) end (region-end)))))
	(setq search-command (format "%s -e %s -f %s -t %s %s" edict-app-path edict-engine edict-from-lang edict-to-lang (buffer-substring begin end)))
	(tooltip-show (shell-command-to-string search-command))))

(defun edict-google (&optional zh-en)
  "Call edict app to translate, in this function, we use google translator.
and translate from chinese to english."
  (interactive)
  (let (search-command begin end (from "en") (to "zh"))
	(if mark-active
		(setq begin (region-beginning) end (region-end))
	  (save-excursion
	  	;; When cursor position is the beginning of the searched word, (backward-word)
	  	;; can't move region-beginning to the beginning of the word, so use (forward-char)
	  	;; to move forward a char, then call (backward-word), the region-beginning last will
	  	;; return the beginning position the word.
	  	(progn
	  	  (forward-char)
	  	  (backward-word)
	  	  (mark-word)
	  	  (setq begin (region-beginning) end (region-end)))))
	(if zh-en
		  (setq from "zh" to "en"))
	(setq search-command (format "%s -e google -f %s -t %s %s" edict-app-path from to (buffer-substring begin end)))
	(tooltip-show (shell-command-to-string search-command))))

;; (global-set-key (kbd "<f11>") 'edict)

(provide 'edict)





