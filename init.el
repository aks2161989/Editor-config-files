
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

;; Open files at last-edited position
(save-place-mode 1)
;; Open files at last-edited position code ends here

;; Setting up spell check with hunspell
;; Code taken from https://emacs.stackexchange.com/a/22311/18512
(setq ispell-program-name "F:/hunspell-1.3.2-3-w32-bin/bin/hunspell.exe")
;; "en_US" is key to lookup in `ispell-local-dictionary-alist`.
;; Please note it will be passed as default value to hunspell CLI `-d` option
;; if you don't manually setup `-d` in `ispell-local-dictionary-alist`
(setq ispell-local-dictionary "en_US") 
(setq ispell-local-dictionary-alist
      '(("en_US" "[[:alpha:]]" "[^[:alpha:]]" "[']" nil ("-d" "en_US") nil utf-8)))
;; Setting up spell-check code ends here

;;Open these files on startup
(find-file "f:/MCSD/Programming in CSharp/MCSD Certification Code and Test Questions/06/Chapter6_code/612095c06src")

;; Switch to the 'scratch' buffer on startup, instead of the above directory
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ecb-options-version "2.50")
 '(initial-buffer-choice t)
 '(package-selected-packages (quote (ecb company omnisharp csharp-mode)))
 '(speedbar-show-unknown-files t))

;; Save mini-buffer history
(savehist-mode 1) 

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

;; Set the omnisharp-server-executable-path when omnisharp-roslyn is extracted manually
(setq omnisharp-server-executable-path "F:\\omnisharp-win-x86\\OmniSharp.exe")
;; Set the omnisharp-server-executable-path code ends here

;; Add this to csharp-mode-hook to your init.el to automatically invoke omnisharp-emacs when opening C# files:
(add-hook 'csharp-mode-hook 'omnisharp-mode)

;; For autocompletion via company mode to work you will also need this in your init.el:
(eval-after-load
 'company
 '(add-to-list 'company-backends 'company-omnisharp))

(add-hook 'csharp-mode-hook #'company-mode)

;;omnisharp-emacs supports Flycheck and it can be enabled automatically by hooking up flycheck-mode to be enabled for csharp-mode buffers:
(add-hook 'csharp-mode-hook #'flycheck-mode)

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

;; Declare and define custom variables
(defcustom my-selected-font "Courier New-14" ;; Select Font Type And Size Here
  "My default font type and size"
  :type 'string)
(defcustom my-x-frame-pos nil
  "My default horizontal frame position (x)"
  :type 'integer)
(defcustom my-y-frame-pos nil
  "My default vertical frame position (y)"
  :type 'integer)
(defcustom my-frame-width nil
  "My default horizontal frame size"
  :type 'integer)
(defcustom my-frame-height nil
  "My default vertical frame size"
  :type 'integer)
(defcustom my-x-frame-pos-moveRight nil
  "The horizontal frame position (x) for moveRight function"
  :type 'integer)
(defcustom my-y-frame-pos-moveRight nil
  "The vertical frame position (y) for moveRight function"
  :type 'integer)
(defcustom my-frame-width-moveRight nil
  "The frame width for moveRight function"
  :type 'integer)
(defcustom my-frame-height-moveRight nil
  "The frame height for moveRight function"
  :type 'integer)
(defcustom my-x-frame-pos-moveTop nil
  "The horizontal frame position (x) for moveTop function"
  :type 'integer)
(defcustom my-y-frame-pos-moveTop nil
  "The vertical frame position (y) for moveTop function"
  :type 'integer)
(defcustom my-frame-width-moveTop nil
  "The frame width for moveTop function"
  :type 'integer)
(defcustom my-frame-height-moveTop nil
  "The frame height for moveTop function"
  :type 'integer)
(defcustom my-x-frame-pos-moveBottom nil
  "The horizontal frame position (x) for moveBottom function"
  :type 'integer)
(defcustom my-y-frame-pos-moveBottom nil
  "The vertical frame position (y) for moveBottom function"
  :type 'integer)
(defcustom my-frame-width-moveBottom nil
  "The frame width for moveBottom function"
  :type 'integer)
(defcustom my-frame-height-moveBottom nil
  "The frame height for moveBottom function"
  :type 'integer)
;; Declare and define custom variables code ends here

;; Modify custom variables based on font selected
(cond ((equal my-selected-font "Courier New-14")
       (setq my-x-frame-pos 100)
       (setq my-y-frame-pos 50)
       (setq my-frame-width 82)
       (setq my-frame-height 28)
       (setq my-x-frame-pos-moveRight 859)
       (setq my-y-frame-pos-moveRight 0)
       (setq my-frame-width-moveRight 42)
       (setq my-frame-height-moveRight 30)
       (setq my-x-frame-pos-moveTop 0)
       (setq my-y-frame-pos-moveTop 0)
       (setq my-frame-width-moveTop 120)
       (setq my-frame-height-moveTop 14)
       (setq my-x-frame-pos-moveBottom my-x-frame-pos-moveTop)
       (setq my-y-frame-pos-moveBottom 345)
       (setq my-frame-width-moveBottom my-frame-width-moveTop)
       (setq my-frame-height-moveBottom my-frame-height-moveTop))

      ((equal my-selected-font "Arial-14")
       (setq my-x-frame-pos 100)
       (setq my-y-frame-pos 15)
       (setq my-frame-width 100)
       (setq my-frame-height 28)
       (setq my-x-frame-pos-moveRight 960)
       (setq my-y-frame-pos-moveRight 0)
       (setq my-frame-width-moveRight 45)
       (setq my-frame-height-moveRight 29)
       (setq my-x-frame-pos-moveTop 0)
       (setq my-y-frame-pos-moveTop 0)
       (setq my-frame-width-moveTop 165)
       (setq my-frame-height-moveTop 14)
       (setq my-x-frame-pos-moveBottom my-x-frame-pos-moveTop)
       (setq my-y-frame-pos-moveBottom 328)
       (setq my-frame-width-moveBottom my-frame-width-moveTop)
       (setq my-frame-height-moveBottom my-frame-height-moveTop))
      )
;; Modify custom variables based on font selected code ends here

;; A function to restore the startup font type & size, frame position & size...   
;; ...I have set in the default-frame-alist code below
;; This function can be  used to restore the defaults when the frame is...
;; ...deliberately resized and needs to be brought back to its initial size/font
(defun originalPosition ()
  (interactive)
;;  (set-frame-font "Courier New-14" t t)
  (set-frame-position (selected-frame) my-x-frame-pos my-y-frame-pos)
  (when window-system (set-frame-size (selected-frame) my-frame-width my-frame-height))
  )
;;(originalPosition)
;; Code to restore Emacs to startup font and frame parameters ends here

;; Code to bind originalPosition to the following key sequences 
(global-set-key (kbd "C-c o p") 'originalPosition)
(global-set-key (kbd "C-c m o") 'originalPosition)
(global-set-key (kbd "C-c i p") 'originalPosition)
(global-set-key (kbd "C-c m i") 'originalPosition)
;; Code to bind originalPosition to key sequences ends here

;; My desired font type & size, frame position & size for ALL Emacs frames
;; Same settings as originalPosition function above
;; These settings work for ALL Emacs frames, even when running emacsclientsw.exe
(add-to-list 'default-frame-alist `(font . ,my-selected-font)) ;; Font type & size
(add-to-list 'default-frame-alist `(top . ,my-y-frame-pos)) ;; Vertical frame position
(add-to-list 'default-frame-alist `(left . ,my-x-frame-pos)) ;; Horizontal frame position
(add-to-list 'default-frame-alist `(height . ,my-frame-height)) ;; Vertical frame size
(add-to-list 'default-frame-alist `(width . ,my-frame-width)) ;; Horizontal frame size
;; Code to set Emacs to my desired font & frame parameters ends here

;; Change the default block cursor to a bar
;;(setq-default cursor-type 'bar)
;; Change cursor to bar code ends here

;; Resize and move Emacs to the right side
(defun  moveRight ()
  (interactive)
    (when window-system (set-frame-size (selected-frame) my-frame-width-moveRight my-frame-height-moveRight))
    (set-frame-position (selected-frame) my-x-frame-pos-moveRight my-y-frame-pos-moveRight)
      )
;; Resize and move right code ends here

;; Code to bind moveRight to the key sequence "C-c m r"
(global-set-key (kbd "C-c m r") 'moveRight)
;; Code to bind moveRight to the key sequence "C-c m r" ends here

;; Resize and move Emacs to the top
(defun  moveTop ()
  (interactive)
    (when window-system (set-frame-size (selected-frame) my-frame-width-moveTop my-frame-height-moveTop))
    (set-frame-position (selected-frame) my-x-frame-pos-moveTop my-y-frame-pos-moveTop)
      )
;; Resize and move top code ends here

;; Code to bind moveTop to the key sequence "C-c m t"
(global-set-key (kbd "C-c m t") 'moveTop)
;; Code to bind moveTop to the key sequence "C-c m t" ends here

;; Resize and move Emacs to the bottom
(defun  moveBottom ()
  (interactive)
    (when window-system (set-frame-size (selected-frame) my-frame-width-moveBottom my-frame-height-moveBottom))
    (set-frame-position (selected-frame) my-x-frame-pos-moveBottom my-y-frame-pos-moveBottom)
      )
;; Resize and move bottom code ends here

;; Code to bind moveBottom to the key sequence "C-c m b"
(global-set-key (kbd "C-c m b") 'moveBottom)
;; Code to bind moveBottom to the key sequence "C-c m b" ends here

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

;; Hide newline symbols when word wrap is turned on
(setf (cdr (assq 'continuation fringe-indicator-alist))
      '(nil nil) ;; no continuation indicators
      ;; '(nil right-curly-arrow) ;; right indicator only
      ;; '(left-curly-arrow nil) ;; left indicator only
      ;; '(left-curly-arrow right-curly-arrow) ;; default
      )
;; Hide newline symbols code ends here

;; Do not split words in half when word wrap is turned on
(global-visual-line-mode t)
;; Prevent word splitting code ends here

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

;; speedbar show-files code ends here

;; Macro to select all text in buffer and copy it
(fset 'copyAll
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ("h\367" 0 "%d")) arg)))
;; Macro ENDS HERE

;; Bind F5 to 'copyAll' macro defined above
(global-set-key (kbd "<f5>") 'copyAll)
;; Bind F5 to 'copyAll' ends here

;; Macro to scroll down one line at a time
(fset 'scroll-down-one-line-macro
   "\C-u1\C-v")
;; Macro to scroll down one line at a time ends here

;; Bind M-(down) to the scroll-down-one-line-macro defined above
(global-set-key (kbd "<M-down>") 'scroll-down-one-line-macro)
;; Bind M-(down) to scroll-down-one-line-macro ends here

;; Macro to scroll up one line at a time
(fset 'scroll-up-one-line-macro
   "\C-u1\366")
;; Macro to scroll up one line at a time code ends here

;; Bind M-(up) to the scroll-up-one-line-macro defined above
(global-set-key (kbd "<M-up>") 'scroll-up-one-line-macro)
;; Bind M-(up) to scroll-up-one-line-macro ends here

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
