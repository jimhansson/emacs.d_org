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

;;you need to change this
(setq local-emacs-org-dir "~/.emacs.d_org/")
;; load neatly organized org file!
(add-to-list 'load-path local-emacs-org-dir)
(org-babel-load-file (concat local-emacs-org-dir "emacs.org"))
