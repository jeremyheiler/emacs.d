
(require 'package)
(package-initialize)

;;(load-theme 'wombat t)
(load-theme 'sanityinc-tomorrow-eighties t)
;;(load-theme 'sanityinc-solarized-dark t)

(set-face-attribute 'default nil :height 100)

(add-to-list 'load-path "~/.emacs.d/better-defaults")
(require 'better-defaults)

(setq browse-url-browser-function #'eww-browse-url)
(setq initial-scratch-message nil)
(setq inhibit-splash-screen t)
(setq ring-bell-function 'ignore)
(setq tab-awlays-indent 'complete)
(setq visual-bell nil)

(setq c-default-style '((java-mode . "java") (awk-mode . "awk") (c-mode . "linux")))
(setq-default c-basic-offset 8 tab-width 8 indent-tabs-mode t)

(fset 'yes-or-no-p 'y-or-n-p)

(eval-after-load 'paredit
  '(progn
     (define-key paredit-mode-map (kbd "M-)") 'paredit-forward-slurp-sexp)
     (define-key paredit-mode-map (kbd "M-(") 'paredit-backward-slurp-sexp)
     (define-key paredit-mode-map (kbd "M-{") 'paredit-forward-barf-sexp)
     (define-key paredit-mode-map (kbd "M-}") 'paredit-backward-barf-sexp)))

(load "~/.emacs.d/clojure.el")
(load "~/.emacs.d/go.el")
(load "~/.emacs.d/lisp.el")
(load "~/.emacs.d/postgres.el")
(load "~/.emacs.d/racket.el")

(add-hook 'emacs-lisp-mode-hook #'enable-paredit-mode)

(defun jh-previous-window ()
  (interactive)
  (other-window -1))

(global-set-key (kbd "C-x p") 'jh-previous-window)

;; idk what this does; i don't remember putting it here
(put 'narrow-to-region 'disabled nil)

;; eshell
(defun eshell-mode-hook-func ()
  (setq eshell-path-env (concat "/Users/jeremy/bin:" eshell-path-env))
  (setenv "PATH" (concat "/usr/local/bin:" (getenv "PATH")))
  ;;(define-key eshell-mode-map (kbd "M-s") 'other-window-or-split)
  )

(add-hook 'eshell-mode-hook 'eshell-mode-hook-func)
