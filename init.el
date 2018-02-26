;; Jeremy's Annotated Emacs Configuration

;; Package Manager
(require 'package)
(package-initialize)

;; Better Defaults
(require 'better-defaults)

(set-face-attribute 'default nil :height (+ (face-attribute 'default :height) 10))

;; Theme
;;(load-theme 'wilson t)
(load-theme 'gruvbox-dark-soft t)

;;(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
;;(load-theme 'mccarthy2 t)

;; When I accidentilly trigger the print buffer dialog, my instinct is
;; to press ESC to dismiss it, rather than use the mouse to press
;; "cancel". However, that crashes Emacs on macOS every time.
(global-unset-key (kbd "s-p"))

;; Helm
(require 'helm-config)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(helm-mode 1)

;; Start with any empty scratch buffer
(setq initial-scratch-message nil)

;; Start without the slash buffer
(setq inhibit-splash-screen t)

;; Disable audio and visual bells
(setq ring-bell-function 'ignore)
(setq visual-bell nil)

;; Set eww as the default browser
(setq browse-url-browser-function #'eww-browse-url)

;;(setq c-default-style '((java-mode . "java") (awk-mode . "awk") (c-mode . "linux")))

;; Accept y/n rather than yes/no for prompts
(fset 'yes-or-no-p 'y-or-n-p)

;; Add a key binding for 'other-window' going backwards
(global-set-key (kbd "C-x p") (lambda () (interactive) (other-window -1)))

;;;;;; Paredit

;;;; I don't remember why I set this. Something about macOS eating keys in iTerm?
;; (eval-after-load 'paredit
;;    '(progn
;;       (define-key paredit-mode-map (kbd "M-)") 'paredit-forward-slurp-sexp)
;;       (define-key paredit-mode-map (kbd "M-(") 'paredit-backward-slurp-sexp)
;;       (define-key paredit-mode-map (kbd "M-{") 'paredit-forward-barf-sexp)
;;       (define-key paredit-mode-map (kbd "M-}") 'paredit-backward-barf-sexp)))


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


;;;; Highlight the current line
;;(global-hl-line-mode 1)


;;;; Show git diffs in the gutter
(global-git-gutter-mode 1)

;;;;;; Languages

(load "~/.emacs.d/c.el")
(load "~/.emacs.d/clojure.el")
;;(load "~/.emacs.d/forth.el")
(load "~/.emacs.d/go.el")
(load "~/.emacs.d/html.el")
;;(load "~/.emacs.d/lisp.el")
;;(load "~/.emacs.d/pony.el")
(load "~/.emacs.d/postgres.el")
(load "~/.emacs.d/racket.el")
(load "~/.emacs.d/java.el")
(load "~/.emacs.d/javascript.el")
(put 'upcase-region 'disabled nil)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cider-boot-parameters "cider repl -s wait")
 '(cljr-auto-eval-ns-form nil)
 '(cljr-favor-prefix-notation nil)
 '(gofmt-command "/usr/local/bin/gofmt")
 '(package-selected-packages
   (quote
    (yaml-mode sublime-themes racket-mode python-mode markdown-mode magit helm go-mode git-gutter company clj-refactor better-defaults))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )




(setenv "PATH" (concat (getenv "PATH") ":" "/usr/local/bin"))
(setq exec-path (append exec-path '("/usr/local/bin")))
