;; setup for gnus
;; Make Gnus NOT ignore [Gmail] mailboxes
(setq gnus-ignored-newsgroups "^to\\.\\|^[0-9. ]+\\( \\|$\\)\\|^[\"]\"[#'()]")

;; setup journaling
(defvar org-journal-file "~/../../Documents/org/journal.org"
  "Path to OrgMode journal file.")
(defvar org-journal-date-format "%Y-%m-%d"
  "Date format string for journal headings.")
(when (require 'deft nil 'noerror) 
   (setq
      deft-extension "org"
      deft-directory "~/Org/deft/"
      deft-text-mode 'org-mode)
   (global-set-key (kbd "<f9>") 'deft))
;; resurect clock and clocking history
(org-clock-persistence-insinuate)

(filesets-init)

(load-library "hideshow")
(defun toggle-selective-display (column)
      (interactive "P")
      (set-selective-display
       (or column
           (unless selective-display
             (1+ (current-column))))))

(defun toggle-hiding (column)
      (interactive "P")
      (if hs-minor-mode
          (if (condition-case nil
                  (hs-toggle-hiding)
                (error t))
              (hs-show-all))
        (toggle-selective-display column)))
(global-set-key (kbd "C-+") 'toggle-hiding)
(global-set-key "\C-c>"  'hs-hide-block)
(global-set-key "\C-c<"  'hs-show-block)

(global-visual-line-mode 1)

(add-to-list 'load-path "~/.emacs.d")
(require 'smooth-scrolling)
(require 'fill-column-indicator)

;; load csharp mode
(require 'csharp-mode)
(autoload 'csharp-mode "csharp-mode" "Major mode for editing C# code." t)
(load "csharp-hs-forward-sexp.el")
(setq auto-mode-alist
      (append '(("\\.cs$" . csharp-mode)) auto-mode-alist))


(defun my-csharp-mode-fn ()
  "function that runs when csharp-mode is initialized for a buffer."
  (hs-minor-mode 1)
  (setq hs-isearch-open t)
;; flymake
;;  (require 'flymake)
;;  (flymake-mode 1)
  )

(add-hook  'csharp-mode-hook 'my-csharp-mode-fn t)

;; smart tabs
(setq-default tab-width 4) ; or any other preferred value
(setq cua-auto-tabify-rectangles nil)

(defadvice align (around smart-tabs activate)
  (let ((indent-tabs-mode nil)) ad-do-it))

(defadvice align-regexp (around smart-tabs activate)
  (let ((indent-tabs-mode nil)) ad-do-it))

(defadvice indent-relative (around smart-tabs activate)
  (let ((indent-tabs-mode nil)) ad-do-it))

(defadvice indent-according-to-mode (around smart-tabs activate)
  (let ((indent-tabs-mode indent-tabs-mode))
    (if (memq indent-line-function
			  '(indent-relative
				indent-relative-maybe))
		(setq indent-tabs-mode nil))
    ad-do-it))

(defmacro smart-tabs-advice (function offset)
  `(progn
     (defvaralias ',offset 'tab-width)
     (defadvice ,function (around smart-tabs activate)
       (cond
	(indent-tabs-mode
	 (save-excursion
	   (beginning-of-line)
	   (while (looking-at "\t*\\( +\\)\t+")
	     (replace-match "" nil nil nil 1)))
	 (setq tab-width tab-width)
	 (let ((tab-width fill-column)
	       (,offset fill-column)
	       (wstart (window-start)))
	   (unwind-protect
	       (progn ad-do-it)
	     (set-window-start (selected-window) wstart))))
	(t
	 ad-do-it)))))

(smart-tabs-advice c-indent-line c-basic-offset)
(smart-tabs-advice c-indent-region c-basic-offset)


;; otherwise C-c C-r (eval region) takes forever
(setq ess-eval-visibly-p nil)
;; otherwise you are prompted each time you start an interactive R session
(setq ess-ask-for-ess-directory nil)

(global-ede-mode t)
(put 'narrow-to-region 'disabled nil)

;; don't ask before evaluating code that are included in org-files.
(defun my-org-confirm-babel-evaluate (lang body)
  nil) ; don't ask for any language 
(setq org-confirm-babel-evaluate 'my-org-confirm-babel-evaluate)

(setq tls-program '("C:/PROGRA~2/Git/bin/openssl.exe s_client -connect %h:%p -no_ssl2 -ign_eof"))

;; nice code in org
;; fontify code in code blocks
(setq org-src-fontify-natively t)
;;(org-block-begin-line
;; ((t (:underline "#A7A6AA" :foreground "#008ED1" :background "#EAEAFF"))))
;;(org-block-background
;; ((t (:background "#FFFFEA"))))
;;(org-block-end-line
;; ((t (:overline "#A7A6AA" :foreground "#008ED1" :background "#EAEAFF"))))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(c-basic-offset 4)
 '(column-number-mode t)
 '(custom-enabled-themes (quote (tango-dark)))
 '(ede-project-directories (quote ("c:/Users/jiha/Documents/GitHub/hell")))
 '(exec-path (quote ("c:/oracle/product/11.1.0/client_1" "C:/oracle/product/11.1.0/client_1/bin" "c:/W/10.2_next/iccruntime/bin" "C:/Program Files/Common Files/Microsoft Shared/Windows Live" "C:/windows/system32" "C:/windows" "C:/windows/System32/Wbem" "C:/windows/System32/WindowsPowerShell/v1.0/" "C:/Program Files (x86)/Common Files/Roxio Shared/DLLShared/" "C:/Program Files/WIDCOMM/Bluetooth Software/" "C:/Program Files/WIDCOMM/Bluetooth Software/syswow64" "C:/Program Files (x86)/Common Files/Roxio Shared/OEM/DLLShared/" "C:/Program Files (x86)/Common Files/Roxio Shared/OEM/DLLShared/" "C:/Program Files (x86)/Common Files/Roxio Shared/OEM/12.0/DLLShared/" "C:/Program Files (x86)/Roxio/OEM/AudioCore/" "C:/Program Files (x86)/Intel/Services/IPT/" "c:/Program Files (x86)/Microsoft SQL Server/90/Tools/binn/" "C:/Program Files/TortoiseSVN/bin" "c:/Users/jiha/emacs-24.1/bin" "c:\\cygwin\\bin")))
 '(filesets-data (quote (("OrgFiles" (:tree "C:\\users\\jiha\\Documents\\org" "^.+\\.org$") (:tree-max-level 3)) ("SQL files" (:tree "C:\\W\\10.2_Next\\icc\\api\\dbi\\db_schema\\8.0\\Oracle\\admin" "^.+\\.plb$") (:tree-max-level 2)))))
 '(global-auto-revert-mode t)
 '(gnus-use-header-prefetch t)
 '(mode-line-in-non-selected-windows nil)
 '(mode-line-inverse-video t)
 '(mouse-wheel-progressive-speed nil)
 '(mouse-wheel-scroll-amount (quote (2 ((shift) . 1) ((control)))))
 '(org-agenda-files (quote ("c:/Users/jiha/Documents/org/mdms/project.org" "c:/Users/jiha/Documents/org/GTD.org")))
 '(org-agenda-start-with-clockreport-mode t)
 '(org-agenda-start-with-follow-mode t)
 '(org-enforce-todo-checkbox-dependencies t)
 '(org-enforce-todo-dependencies t)
 '(org-modules (quote (org-bbdb org-bibtex org-crypt org-docview org-gnus org-id org-info org-jsinfo org-habit org-irc org-mew org-mhe org-protocol org-rmail org-vm org-wl org-w3m org-mouse)))
 '(read-mail-command (quote gnus))
 '(safe-local-variable-values (quote ((auto-fill-mode))))
 '(save-place t nil (saveplace))
 '(scroll-conservatively 1000)
 '(scroll-margin 5)
 '(send-mail-function (quote smtpmail-send-it))
 '(shell-file-name "c:\\cygwin\\bin\\bash.exe")
 '(show-paren-mode t)
 '(size-indication-mode t)
 '(smtpmail-smtp-server "mail.powelasa.powel.com")
 '(smtpmail-smtp-service 25)
 '(sql-database "birdie")
 '(sql-product (quote oracle))
 '(standard-indent 4)
 '(tab-always-indent (quote complete))
 '(text-mode-hook (quote (turn-on-auto-fill text-mode-hook-identify)))
 '(tool-bar-mode nil)
 '(uniquify-buffer-name-style (quote post-forward) nil (uniquify))
 '(user-full-name "Jim Hansson")
 '(user-mail-address "jim.hansson@powel.se")
 '(windmove-wrap-around t))
