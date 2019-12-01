;; Jeremy's Annotated Emacs Configuration

;; Initialize the package manager
(require 'package)
(package-initialize)

(require 'better-defaults)

;;(text-scale-adjust 10)
(set-face-attribute 'default nil :height 150)
;;(set-face-attribute 'default nil :height (+ (face-attribute 'default :height) 20))

;;(load-theme 'wilson t)
(load-theme 'gruvbox-dark-soft t)

;; Don't ever allow me to accidently print the buffer
(global-unset-key (kbd "s-p"))

;; Don't minimize/hide emacs window accidently
(global-unset-key (kbd "C-z"))

;; Helm
(require 'helm-config)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(helm-mode 1)

;; Leave the scratch buffer empty when created
(setq initial-scratch-message nil)

;; Don't display the splash screen on start
(setq inhibit-splash-screen t)

;; Don't ring or display any bells
(setq ring-bell-function 'ignore)
(setq visual-bell nil)

;; Set eww as the default browser
(setq browse-url-browser-function #'eww-browse-url)

;;(setq c-default-style '((java-mode . "java") (awk-mode . "awk") (c-mode . "linux")))

;; Accept y/n rather than yes/no for prompts
(fset 'yes-or-no-p 'y-or-n-p)

;; Add a key binding for 'other-window' going backwards
(global-set-key (kbd "C-x p") (lambda () (interactive) (other-window -1)))

;;;;;; EShell

(setenv "PATH" (concat (getenv "PATH") ":~/bin"))
(setq exec-path (append exec-path '("~/bin")))

;; Set the eshell path
(add-hook 'eshell-mode-hook (lambda ()
                              (setq eshell-path-env (concat "/Users/jeremy/bin:" eshell-path-env))
                              (setenv "PATH" (concat "/usr/local/bin:" (getenv "PATH")))
                              ;;(define-key eshell-mode-map (kbd "M-s") 'other-window-or-split)
                              ))

;;
(setq tab-awlays-indent 'complete)

;;
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

(load "~/.emacs.d/langs/c.el")
(load "~/.emacs.d/langs/clojure.el")
(load "~/.emacs.d/langs/elisp.el")
;;(load "~/.emacs.d/langs/forth.el")
(load "~/.emacs.d/langs/go.el")
(load "~/.emacs.d/langs/html.el")
(load "~/.emacs.d/langs/lisp.el")
;;(load "~/.emacs.d/langs/pony.el")
(load "~/.emacs.d/langs/postgres.el")
(load "~/.emacs.d/langs/racket.el")
(load "~/.emacs.d/langs/java.el")
(load "~/.emacs.d/langs/javascript.el")


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cider-boot-parameters "cider repl -s wait")
 '(gofmt-command "/usr/local/bin/gofmt")
 '(package-selected-packages
   (quote
    (lsp-mode websocket yaml-mode sublime-themes racket-mode markdown-mode magit helm go-mode company clj-refactor better-defaults))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )








(setenv "PATH" (concat (getenv "PATH") ":" "/usr/local/bin"))
(setq exec-path (append exec-path '("/usr/local/bin")))

;; magit, not yours
(global-set-key (kbd "C-x g") 'magit-status)

;;(require 'helm-config)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
(global-set-key (kbd "C-x C-f") #'helm-find-files)
(helm-mode 1)


(global-git-gutter-mode +1)




;; iterm2 https://www.emacswiki.org/emacs/iTerm2
;; iterm2 mouse support
(unless window-system
  (require 'mouse)
  (xterm-mouse-mode t)
  (defun track-mouse (e))
  (setq mouse-sel-mode t))
