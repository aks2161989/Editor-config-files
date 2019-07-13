
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;;(package-initialize)

;;(global-linum-mode t) ;This line shows line numbers

;; Use 4 spaces for indentation
(setq tab-width 4)

;;Prevent welcome screen
(setq inhibit-startup-screen t)

;; By default, the 'scratch' buffer displays the text ";; This buffer is for text that is not saved, and for Lisp evaluation.
;; To create a file, visit it with C-x C-f and enter text in its buffer."
;; Do not display this text
(setq initial-scratch-message "")

;;Open these files on startup
(find-file "f:/MCSD/Programming in CSharp/MCSD Certification Code and Test Questions/06/Chapter6_code/612095c06src")

;; Switch to the 'scratch' buffer on startup, instead of the above directory
(custom-set-variables
 '(initial-buffer-choice t))


(savehist-mode 1) ;; Save mini-buffer history

;; Make dired use of msys' ls program
;;(setq ls-lisp-use-insert-directory-program t) ;; use external ls
;;(setq insert-directory-program "C:/workspace/windows/msys64/usr/bin/ls") ;; ls program name

;; Get current filename
;;(define-key minibuffer-local-map
;;  [f3] (lambda () (interactive) 
;;       (insert (buffer-name (current-buffer-not-mini)))))

(defun current-buffer-not-mini ()
  "Return current-buffer if current buffer is not the *mini-buffer*
  else return buffer before minibuf is activated."
  (if (not (window-minibuffer-p)) (current-buffer)
      (if (eq (get-lru-window) (next-window))
          (window-buffer (previous-window)) (window-buffer (next-window)))))
;; Get filename code ends here

;; load emacs 24's package system. Add MELPA repository.
(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   ;; '("melpa" . "http://stable.melpa.org/packages/") ; many packages won't show if using stable
   '("melpa" . "http://melpa.milkbox.net/packages/")
   t))
;; load package code ends here

;; required for evil mode
;;(package-initialize)
;;(evil-mode 1)        ;; enable evil-mode
;; evil mode code ends here

;; enable electric-pair-mode for a better experience with csharp-mode
(defun my-csharp-mode-hook ()
  ;; enable the stuff you want for C# here
  (electric-pair-mode 1)       ;; Emacs 24
  (electric-pair-local-mode 1) ;; Emacs 25
  )
(add-hook 'csharp-mode-hook 'my-csharp-mode-hook)
;; electric-pair-mode code ends here

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (csharp-mode))))

;; Set Font and font size
(set-face-attribute 'default nil :font "Courier New-14")

;; Prevent lower border from extending below window frame
(defconst frame-default-top      0  "The 'top'  position property of a frame.")
(defconst frame-default-left     0  "The 'left' position property of a frame.")
(defconst frame-default-height  30  "The default frame height.")
(defconst frame-default-width  78  "The default frame width.")

(add-to-list 'default-frame-alist (cons 'left   frame-default-left))
(add-to-list 'default-frame-alist (cons 'top    frame-default-top))
(add-to-list 'default-frame-alist (cons 'height frame-default-height))
(add-to-list 'default-frame-alist (cons 'width  frame-default-width))

(add-to-list 'initial-frame-alist (cons 'left   frame-default-left))
(add-to-list 'initial-frame-alist (cons 'top    frame-default-top))
(add-to-list 'initial-frame-alist (cons 'height frame-default-height))
(add-to-list 'initial-frame-alist (cons 'width  frame-default-width))
;; Lower border code ends here

;; Display total number of lines in Emacs modeline
(defvar my-mode-line-buffer-line-count nil)
(make-variable-buffer-local 'my-mode-line-buffer-line-count)

(setq-default mode-line-format
              '("  " mode-line-modified
                (list 'line-number-mode "  ")
                (:eval (when line-number-mode
                         (let ((str "L%l"))
                           (when (and (not (buffer-modified-p)) my-mode-line-buffer-line-count)
                             (setq str (concat str "/" my-mode-line-buffer-line-count)))
                           str)))
                "  %p"
                (list 'column-number-mode "  C%c")
                "  " mode-line-buffer-identification
                "  " mode-line-modes))

(defun my-mode-line-count-lines ()
  (setq my-mode-line-buffer-line-count (int-to-string (count-lines (point-min) (point-max)))))

(add-hook 'find-file-hook 'my-mode-line-count-lines)
(add-hook 'after-save-hook 'my-mode-line-count-lines)
(add-hook 'after-revert-hook 'my-mode-line-count-lines)
(add-hook 'dired-after-readin-hook 'my-mode-line-count-lines)
;; Display total number of lines code ends here

;; Run C++ programs directly from within Emacs
(defun execute-cpp-program ()
  (interactive)
  (defvar foo)
  (setq foo (concat "g++ " (buffer-name) " && a.exe" ))
  (async-shell-command foo))
;; Run C++ programs code ends here

;; Compile and run C# programs directly from within Emacs
(defun execute-csharp-program ()
  (interactive)
  (defvar foo1)
  (setq foo1 (concat "csc -out:" (file-name-sans-extension (buffer-file-name)) ".exe " (buffer-file-name) " && " (file-name-sans-extension (buffer-file-name)) ".exe"))
  (async-shell-command foo1))
;; Compile and run C# program code ends here

;; Launch in browser
(defun launch-in-browser()
  (interactive)
  (if (buffer-file-name)
      (let ((filename (buffer-file-name)))
	(async-shell-command (concat "start chrome.exe \"file://" filename "\"")))))
;; Launch in browser code ends here

;; speedbar shows all types of files, not only directories
(custom-set-variables
 '(speedbar-show-unknown-files t)
)
;; speedbar show-files code ends here

;; Macro to select all text in buffer and copy it
(fset 'copyAll
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ("h\367" 0 "%d")) arg)))
;; Macro ENDS HERE

;; Bind F5 to 'copyAll' macro defined above
(global-set-key (kbd "<f5>") 'copyAll)
;; Bind F5 to 'copyAll' ends here
