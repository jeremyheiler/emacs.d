(setq racket-racket-program "/usr/bin/racket")
(setq racket-raco-program "/usr/bin/raco")

(add-hook 'racket-mode-hook 'paredit-mode)
(add-hook 'racket-repl-mode-hook 'paredit-mode)
