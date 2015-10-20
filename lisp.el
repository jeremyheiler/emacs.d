(setq inferior-lisp-program "/usr/bin/sbcl")
;;(setq inferior-lisp-program "/usr/local/bin/sbcl")
(setq slime-contribs '(slime-fancy))

(defun override-slime-repl-bindings-with-paredit ()
  (define-key slime-repl-mode-map
    (read-kbd-macro paredit-backward-delete-key) nil))

(add-hook 'slime-mode-hook #'enable-paredit-mode)
(add-hook 'slime-repl-mode-hook #'enable-paredit-mode)
(add-hook 'slime-repl-mode-hook 'override-slime-repl-bindings-with-paredit)
