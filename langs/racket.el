(setq racket-racket-program "/usr/local/bin/racket")
(setq racket-raco-program "/usr/local/bin/raco")

(add-hook 'racket-mode-hook #'enable-paredit-mode)
(add-hook 'racket-repl-mode-hook #'enable-paredit-mode)
