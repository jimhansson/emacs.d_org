 -*- mode: org -*-

put this in your .emacs

#+begin_src emacs_lisp
(add-to-list 'load-path "~/.emacs.d/")
(require 'cl)

;; set-up org babel
(setq org-babel-load-languages '((emacs-lisp . t)))
(setq org-confirm-babel-evaluate nil)
(require 'org-install)
(require 'org)

;; load neatly organized org file!
(org-babel-load-file "~/.emacs.d_org/emacs.org")
(org-babel-load-file "~/.emacs.d_org/local/emacs.org")
#+end_src


