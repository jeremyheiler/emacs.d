;;;;;; Jeremy's Annotated Emacs Configuration

;;;; Initialize the package manager
(require 'package)
(package-initialize)

;;;; Load my preferred theme
(load-theme 'wilson t)

;;;; Leave the scratch buffer empty when created
(setq initial-scratch-message nil)

;;;; Don't display the splash screen on start
(setq inhibit-splash-screen t)

;;;; Don't ring or display any bells
(setq ring-bell-function 'ignore)
(setq visual-bell nil)

;;;; Set eww as the default browser
(setq browse-url-browser-function #'eww-browse-url)

;;;;
;;(setq c-default-style '((java-mode . "java") (awk-mode . "awk") (c-mode . "linux")))

;;;; Accept y/n rather than yes/no for prompts
(fset 'yes-or-no-p 'y-or-n-p)

;;;; Add a key binding for 'other-window' going backwards
(global-set-key (kbd "C-x p") (lambda () (interactive) (other-window -1)))

;;;;;; Paredit

;;;; I don't remember why I set this. Something about macOS eating keys in iTerm?
(eval-after-load 'paredit
  '(progn
     (define-key paredit-mode-map (kbd "M-)") 'paredit-forward-slurp-sexp)
     (define-key paredit-mode-map (kbd "M-(") 'paredit-backward-slurp-sexp)
     (define-key paredit-mode-map (kbd "M-{") 'paredit-forward-barf-sexp)
     (define-key paredit-mode-map (kbd "M-}") 'paredit-backward-barf-sexp)))

;;;;;; ELisp

;;;; Enable paredit for Elisp files
(add-hook 'emacs-lisp-mode-hook #'enable-paredit-mode)

;;;;;; EShell

(setenv "PATH" (concat (getenv "PATH") ":~/bin"))
(setq exec-path (append exec-path '("~/bin")))

;;;; Set the eshell path
(add-hook 'eshell-mode-hook (lambda ()
                              (setq eshell-path-env (concat "/Users/jeremy/bin:" eshell-path-env))
                              (setenv "PATH" (concat "/usr/local/bin:" (getenv "PATH")))
                              ;;(define-key eshell-mode-map (kbd "M-s") 'other-window-or-split)
                              ))

;;;;
(setq tab-awlays-indent 'complete)

;;;;
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;;;;;; Org Mode

(setq org-log-done 'time)
;;(setq org-startup-indented t)
(setq org-startup-folded nil)

;;;;;; Fill Mode

;;;; Don't require two spaces to end a sentence
(setq sentence-end-double-space nil)

;;;; Consider list elements to be paragraphs so they don't collapse
(setq paragraph-start "\f\\|[ \t]*$\\|[ \t]*[-+*] ")


;;;;;; Languages

(load "~/.emacs.d/c.el")
(load "~/.emacs.d/clojure.el")
;;(load "~/.emacs.d/forth.el")
;;(load "~/.emacs.d/go.el")
(load "~/.emacs.d/html.el")
;;(load "~/.emacs.d/lisp.el")
;;(load "~/.emacs.d/pony.el")
(load "~/.emacs.d/postgres.el")
(load "~/.emacs.d/racket.el")
(load "~/.emacs.d/java.el")
(load "~/.emacs.d/javascript.el")
