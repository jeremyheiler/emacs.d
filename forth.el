(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
(setq exec-path (append exec-path '("/usr/local/bin")))

(autoload 'forth-mode "~/.emacs.d/gforth.el")

(setq auto-mode-alist
      (cons '("\\.fs\\'" . forth-mode) auto-mode-alist))

(autoload 'forth-block-mode "~/.emacs.d/gforth.el")

(setq auto-mode-alist
      (cons '("\\.fb\\'" . forth-block-mode) auto-mode-alist))

(add-hook 'forth-mode-hook
          (function
           (lambda ()
             ;; customize variables here:
             (setq forth-indent-level 4)
             (setq forth-minor-indent-level 2)
             (setq forth-hilight-level 3)
             )))
