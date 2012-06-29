;; -*- mode: emacs-lisp -*-
;; this is what is needed in the real .emacs file.
;; remember to change the paths at the bottom of this file
; found on EmacsWiki
(setq package-archives '(("ELPA" . "http://tromey.com/elpa/") 
                         ("gnu" . "http://elpa.gnu.org/packages/")))
; http://marmalade-repo.org/ 
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))

(add-to-list 'load-path "~/.emacs.d/")
(require 'cl)

;; set-up org babel
(setq org-babel-load-languages '((emacs-lisp . t)))
(setq org-confirm-babel-evaluate nil)
(require 'org-install)
(require 'org)

;; all these paths need '/' at the end
;; you need to change this
(setq local-emacs-org-dir "c:/Users/jiha/Documents/github/emacs.d_org/")
;; where shared org files are
(setq shared-org-files-dir "c:/Users/jiha/Documents/github/shared_org/")
;; where local org files are
(setq local-org-files-dir "c:/Users/jiha/Documents/org/")
;; load neatly organized org file!
(add-to-list 'load-path local-emacs-org-dir)
(org-babel-load-file (concat local-emacs-org-dir "emacs.org"))
