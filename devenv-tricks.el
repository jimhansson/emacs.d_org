;; Command to point VS.NET at our current file & line
(defun my-current-line ()
  "Return the current buffer line at point.  The first line is 0."
  (save-excursion
    (beginning-of-line)
    (count-lines (point-min) (point))))
(defun devenv-cmd (&rest args)
  "Send a command-line to a running VS.NET process.  'devenv' comes from devenv.exe"
  (call-process "DevEnvCommand" nil nil nil (apply 'concat args)))
(defun switch-to-devenv ()
  "Jump to VS.NET, at the same file & line as in emacs"
  (interactive)
  (save-some-buffers)
  (let ((val1
	   (devenv-cmd "File.OpenFile \"" (buffer-file-name (current-buffer)) "\""))
	(val2
	   (devenv-cmd "Edit.GoTo " (int-to-string (+ (my-current-line) 1)))))
    (cond ((zerop (+ val1 val2))
	      ;(iconify-frame)  ;; what I really want here is to raise the VS.NET window
	         t)
	    ((or (= val1 1) (= val2 1))
	        (error "command failed"))  ;; hm, how do I get the output of the command?
	      (t
	          (error "couldn't run DevEnvCommand")))))
(global-set-key [f3] 'switch-to-devenv)

;; Command to toggle a VS.NET breakpoint at the current line.
(defun devenv-toggle-breakpoint ()
  "Toggle a breakpoint at the current line"
  (interactive)
  (switch-to-devenv)
  (devenv-cmd "Debug.ToggleBreakpoint"))
(global-set-key [f9] 'devenv-toggle-breakpoint)

;; Run the debugger.
(defun devenv-debug ()
  "Run the debugger in VS.NET"
  (interactive)
  (devenv-cmd "Debug.Start"))
(global-set-key [f5] 'devenv-debug)
